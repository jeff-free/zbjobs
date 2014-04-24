require 'capistrano/ext/multistage'
require 'bundler/capistrano' #Using bundler with Capistrano
require 'capistrano/local_precompile'
require 'rvm/capistrano'
require 'cape'

set :stages, %w(staging production)
set :default_stage, "production"

set :precompile_cmd

Cape do
  mirror_rake_tasks :dev
end