#
# Cookbook Name:: wordpress
# Recipe:: default
#

if ['solo', 'app', 'app_master'].include?(node[:instance_role])

  node[:applications].each do |app_name,data|
    user = node[:users].first

    template "/data/#{app_name}/shared/config/wp-config.php" do
      owner user[:username]
      group user[:username]
      mode 0644
      source "wp-config.php.erb"
      variables({
        :app_name => app_name,
        :dbpass => node[:users].first[:password]
      })
    end

  end
end