package "mysql-server"
package "libmysqld-dev"
package "libsqlite3-dev"

bash "set mysql password" do
  code <<-EOH
    mysqladmin -u root password "spamhead"
  EOH
end

service "mysql" do
  action :restart
end
