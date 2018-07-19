Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  langs = APP_OPTS["languages"]
  locales = langs ? Regexp.new(langs) : /en/

  # make sure all new routes can be english or spanish
  scope "(:locale)", locale: locales do

    # about
    get '/about/people', to: 'general#about_people', as: 'about_people'

    # explore / explora
    get '/explore', to: 'explore#index', as: 'explore'

    # research / investiga
    get '/research', to: 'research#index', as: 'research'

    # teach / enseña
    get '/teach', to: 'teach#index', as: 'teach'
  end

end
