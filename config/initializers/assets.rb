# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( load_lightbox.js )

# Fix sassc-rails extension processing order
# https://github.com/sass/sassc-rails/pull/103
# This will fail once above PR is merged due to frozen EXTENSIONS constant
module SassC
  module Rails
    class Importer < SassC::Importer
      EXTENSIONS = [
        CssScssExtension.new,
        CssSassExtension.new,
        SassERBExtension.new,
        ERBExtension.new(".scss.erb"),
        ERBExtension.new(".css.erb"),
        Extension.new(".scss"),
        Extension.new(".sass"),
        CSSExtension.new
      ].freeze
    end
  end
end

# Add our helpers to Asset Pipeline context for use in ERB pre-processing
# https://github.com/rails/sprockets-rails/issues/307#issuecomment-170707886
Rails.application.config.assets.configure do |env|
  env.context_class.class_eval do
    include ApplicationHelper
  end
end
