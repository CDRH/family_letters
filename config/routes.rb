Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  langs = APP_OPTS["languages"]
  locales = langs ? Regexp.new(langs) : /en/

  # make sure all new routes can be english or spanish
  scope "(:locale)", locale: locales do

    # about
    get '/about/team', to: 'general#about_team', as: 'about_team'
    get '/about/technical', to: 'general#about_technical', as: 'about_technical'
    get '/about/acknowledgements', to: 'general#about_acknowledgements', as: 'about_acknowledgements'
    get '/about/faq', to: 'general#about_faq', as: 'about_faq'

    # explore / explora
    get '/explore', to: 'explore#index', as: 'explore'
    get '/explore/connections', to: 'explore#connections', as: 'explore_connections'
    get '/explore/language_and_life', to: 'explore#language_and_life', as: 'explore_language_and_life'
    get '/explore/migrations', to: 'explore#migrations', as: 'explore_migrations'
    get '/explore/more_than_work', to: 'explore#more_than_work', as: 'explore_more_than_work'
    get '/explore/objects', to: 'explore#objects', as: 'explore_objects'
    get '/explore/objects_pt', to: 'explore#objects_pt', as: 'explore_objects_pt'

    # research / investiga
    get '/research', to: 'research#index', as: 'research'
    get '/research/maps/decade/(:id)', to: 'research#map_decade', as: 'research_map_decade'
    get '/research/maps/photographs', to: 'research#map_photographs', as: 'research_map_photographs'
    get '/research/maps/place/(:id)', to: 'research#map_place', as: 'research_map_place'

    # learn / enseña
    get '/learn', to: 'learn#index', as: 'learn'
    get '/learn/lesson01', to: 'learn#lesson01', as: 'learn_lesson01'
    get '/learn/lesson02', to: 'learn#lesson02', as: 'learn_lesson02'
    get '/learn/lesson03', to: 'learn#lesson03', as: 'learn_lesson03'
    get '/learn/lesson04', to: 'learn#lesson04', as: 'learn_lesson04'
    get '/learn/lesson05', to: 'learn#lesson05', as: 'learn_lesson05'

    get '/content_pages', to: 'general#content_pages', as: 'content_pages'
  end

end
