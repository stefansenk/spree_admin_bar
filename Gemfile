source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'spree_core', github: 'spree/spree', branch: 'master'
gem 'spree_backend', github: 'spree/spree', branch: 'master'
# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: 'master'
gem 'spree_related_products', github: 'spree-contrib/spree_related_products', branch: 'master'
gem 'rails-controller-testing'

gem 'rubocop', require: false
gem 'rubocop-rspec', require: false

# gem 'spree_i18n', github: 'spree-contrib/spree_i18n'
# gem 'globalize', github: 'globalize/globalize'
# gem 'spree_globalize', github: 'spree-contrib/spree_globalize', branch: 'master'
# gem 'spree_static_content', github: 'spree-contrib/spree_static_content', branch: 'master'

gemspec
