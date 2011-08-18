package "mysql-server"

bash "set mysql password" do
  code <<-EOH
    mysqladmin -u root password "spamhead"
  EOH
end

service "mysql" do
  action :restart
end
