# # -*- encoding : utf-8 -*-

# # from https://github.com/AF83/capistrano-af83/blob/master/lib/capistrano/af83/deploy/assets.rb
# set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)

# namespace :deploy do
# #   namespace :assets do

# #     desc <<-DESC
# #       Run the asset precompilation rake task. You can specify the full path \
# #       to the rake executable by setting the rake variable. You can also \
# #       specify additional environment variables to pass to rake via the \
# #       asset_env variable. The defaults are:

# #         set :rake,      "rake"
# #         set :rails_env, "production"
# #         set :asset_env, "RAILS_GROUPS=assets"
# #         set :assets_dependencies, fetch(:assets_dependencies) + %w(config/locales/js)
# #     DESC
# #     task :precompile, :roles => :web, :except => { :no_release => true } do
# #       begin
# #         from = source.next_revision(current_revision)
# #       rescue
# #         err_no = true
# #       end

# #       if err_no || capture("cd #{latest_release} && #{source.local.diff(from)} #{assets_dependencies.join ' '} | wc -l").to_i > 0
# #         run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
# #       else
# #         logger.info "Skipping asset pre-compilation because there were no asset changes"
# #       end
# #     end

# #   end
# # end
# # namespace :assets do
# #   task :precompile, :roles => :web do
# #     from = source.next_revision(current_revision)
# #       if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
# #         run_locally("rake assets:clean && rake assets:precompile")
# #         run_locally "cd public && tar -jcf assets.tar.bz2 assets"
# #         top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
# #         run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
# #         run_locally "rm public/assets.tar.bz2"
# #         run_locally("rake assets:clean")
# #       else
# #         logger.info "Skipping asset precompilation because there were no asset changes"
# #       end
# #       end
# #     end
# #   end
#  task :precompile, :roles => :web do
#       from = source.next_revision(current_revision)
#       if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
#         run_locally("RAILS_ENV=#{rails_env} rake assets:clean && RAILS_ENV=#{rails_env} rake assets:precompile")
#         run_locally "cd public && tar -jcf assets.tar.bz2 assets"
#         top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
#         run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
#         run_locally "rm public/assets.tar.bz2"
#         run_locally("rake assets:clean")
#       else
#         logger.info "Skipping asset precompilation because there were no asset changes"
#       end
#     end

#     task :symlink, roles: :web do
#       run ("rm -rf #{latest_release}/public/assets &&
#             mkdir -p #{latest_release}/public &&
#             mkdir -p #{shared_path}/assets &&
#             ln -s #{shared_path}/assets #{latest_release}/public/assets")
#     end
#   end
namespace :deploy do
  namespace :assets do

    task :precompile, :roles => :web do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ lib/assets/ app/assets/ | wc -l").to_i > 0
        run_locally("RAILS_ENV=#{rails_env} rake assets:clean && RAILS_ENV=#{rails_env} rake assets:precompile")
        run_locally "cd public && tar -jcf assets.tar.bz2 assets"
        top.upload "public/assets.tar.bz2", "#{shared_path}", :via => :scp
        run "cd #{shared_path} && tar -jxf assets.tar.bz2 && rm assets.tar.bz2"
        run_locally "rm public/assets.tar.bz2"
        run_locally("rake assets:clean")
      else
        logger.info "Skipping asset precompilation because there were no asset changes"
      end
    end

    task :symlink, roles: :web do
      run ("rm -rf #{latest_release}/public/assets &&
            mkdir -p #{latest_release}/public &&
            mkdir -p #{shared_path}/assets &&
            ln -s #{shared_path}/assets #{latest_release}/public/assets")
    end
  end

end