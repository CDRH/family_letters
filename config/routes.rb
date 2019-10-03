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

    # teach / enseña
    get '/teach', to: 'teach#index', as: 'teach'
    get '/teach/lesson01', to: 'teach#lesson01', as: 'teach_lesson01'
    get '/teach/lesson02', to: 'teach#lesson02', as: 'teach_lesson02'
    get '/teach/lesson03', to: 'teach#lesson03', as: 'teach_lesson03'
    get '/teach/lesson04', to: 'teach#lesson04', as: 'teach_lesson04'
    get '/teach/lesson05', to: 'teach#lesson05', as: 'teach_lesson05'

    get '/content_pages', to: 'general#content_pages', as: 'content_pages'
  end

end
