# before_symlink.rb

  # symlink the wp-config.php file created by custom chef recipe
  run "ln -nfs /data/#{config.app_name}/shared/config/wp-config.php /data/#{config.app_name}/current/public/wp-config.php"
