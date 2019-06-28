# Family Letters

This application was generated using Orchid (https://github.com/CDRH/orchid) for the Family Letters project.

## Adding Images

Use the following tag to include images that are on the media server

```
<%= image_tag iiif("shan_p.035.jpg", size: "!200,200") %>
```

If you want to use an image tag that only shows a certain region, you can use: 

```
<%= iiif("shan_d.481.jpg", region: "pct:20,15,60,60", size: "!1000,1000") %>
```

(this translates to a url like: https://cdrhmedia.unl.edu/iiif/2/family_letters%2Fshan_d.481.jpg/pct:20,15,60,60/!1000,1000/0/default.jpg)

## Adding New Pages

First off, think about what URL you want this page to be at. Example: `family_letters/explore/connections`

Open up `config/routes.rb` and scroll down until you see the other explore routes.  Somewhere in there add the following:

```
get '/explore/connections', to: 'explore#connections', as: 'explore_connections'
```

What is that doing?  Well, part by part it's basically saying:

```
get 'some/path', to: 'controller#action', as: :name_of_route
```

You can put whatever path you want at `get 'some/path'` to reflect the URL you want this page to be at. Then you need a controller and an action. A community controller already exists (there's a controller for each section of the site) so you should be good to go there, and you are making up your action right now. I picked `explore#connection` to make sure the action obviously corresponds to the URL. Then you can pick any unique name for this route, though I wanted it to fairly obviously correspond to the controller (section of the site) and action, so named it `:explore_connections`.  You can name it whatever you want if you don't think you'll be confused later about it!

Once your new route has been added, open up the views that corresponds with the controller you picked above and add a file with that action's name and the extension `html.erb`:  `app/views/explore/connections.html.erb`

Open the file and edit html. 

## Adding bilingual content

Bilingual content will generally be pulled form YAML files. You call the content in yaml files like so: 

```
<%= t "explore.title", default: "Explore" %>
```

If you are in the spanish language part of the site, this will look in an `_es` yaml file located in config/locales for a section marked explore and a sub item called title. You can nest these as far as needed. 

```
  explore:
    title: Explora
```

If you need to add html content, you'll need an item with the name "html" like so: 

```
home:
    # greeting to the user
    greeting: Bienvenidos
    # custom: contents of home page
    html: |-
      <p>El proyecto <em>Cartas de Familia</em> preserva, digitaliza, analiza y
      presenta al público una colección de la correspondencia y otros
      documentos personales de una familia mexicoamericana que emigró de
      Zacatecas, México, a los estados de Colorado y Nebraska, Estados Unidos,
      durante  la primera mitad del siglo XX.</p>
```

Remember that every piece of text should appear in both the english and spanish yaml files. 

If a page is only in one language, you can simply put the text in the template. 
