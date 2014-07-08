# after_restart.rb

#config.node[:applications].each do |app_name,data|

# rename the auto-generated application config so the chef config can replace it
# sudo "touch /etc/nginx/servers/#{app_name}.conf && mv /etc/nginx/servers/#{app_name}.conf /etc/nginx/servers/#{app_name}.conf.bak"
  
# end

# start php
# sudo "/etc/init.d/spawn-fcgi-php start"

# restart nginx
# this is required because of the change in nginx files above
# sudo "/etc/init.d/nginx restart"
