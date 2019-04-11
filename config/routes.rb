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
    get '/explore/1', to: 'explore#exhibit_01', as: 'exhibit_01'
    get '/explore/2', to: 'explore#exhibit_02', as: 'exhibit_02'
    get '/explore/3', to: 'explore#exhibit_03', as: 'exhibit_03'
    get '/explore/4', to: 'explore#exhibit_04', as: 'exhibit_04'
    get '/explore/5', to: 'explore#essay_01', as: 'essay_01'
    get '/explore/6', to: 'explore#essay_01_portuguese', as: 'essay_01_port'

    # research / investiga
    get '/research', to: 'research#index', as: 'research'

    # teach / enseña
    get '/teach', to: 'teach#index', as: 'teach'

    get '/content_pages', to: 'general#content_pages', as: 'content_pages'
  end

end
