# Family Letters

This application was generated using Orchid (https://github.com/CDRH/orchid) for the Family Letters project.

## Adding Images

Use the following tag to include images that are on the media server

```
<%= image_tag iiif("shan_p.035.jpg", size: "!200,200") %>
```

## Adding New Pages

First off, think about what URL you want this page to be at. Example: `family_letters/explore/connections`

get '/explore/connections', to: 'explore#connections', as: 'explore_connections'

First off, we have to add a route so that the Rails app knows what to do when a request hits `community/reunion`. Open up `config/routes.rb` and scroll down until you see the other community routes.  Somewhere in there add the following:

```
get 'community/reunion', to: 'community#reunion', as: :community_reunion
```

What is that doing?  Well, part by part it's basically saying:

```
get 'some/path', to: 'controller#action', as: :name_of_route
```

You can put whatever path you want at `get 'some/path'` to reflect the URL you want this page to be at. Then you need a controller and an action. A community controller already exists (there's a controller for each section of the site) so you should be good to go there, and you are making up your action right now. I picked `community#reunion` to make sure the action obviously corresponds to the URL. Then you can pick any unique name for this route, though I wanted it to fairly obviously correspond to the controller (section of the site) and action, so named it `:community_reunion`.  You can name it whatever you want if you don't think you'll be confused later about it!

Once your new route has been added, open up the views that corresponds with the controller you picked above and add a file with that action's name and the extension `html.erb`:  `app/views/community/reunion.html.erb`

Open the file and put in the title you want to display in browser tabs:

```
<% @title = "Reunion 2019" %>
```

If you try typing some text below that line in the file, saving, and going to that page on the development site, you should see your test text!

Now you're ready to learn the basic rules of Rails views, [check out the documentation](rails_views.md)
