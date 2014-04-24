require 'capistrano/ext/multistage'
require 'bundler/capistrano' #Using bundler with Capistrano
require 'rvm/capistrano'
require 'cape'

set :stages, %w(staging production)
set :default_stage, "production"

Cape do
  mirror_rake_tasks :dev
end