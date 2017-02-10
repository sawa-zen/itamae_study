package 'nginx'

file "/etc/nginx/conf.d/default.conf" do
  action :delete
  notifies :reload, "service[nginx]"
end

template '/etc/nginx/nginx.conf' do
  source './templates/etc/nginx/nginx.conf'
  notifies :reload, "service[nginx]"
end

service 'nginx' do
  action :start
end
