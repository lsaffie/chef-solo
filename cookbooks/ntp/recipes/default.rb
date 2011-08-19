package "ntp"

bash "set ntp servers" do
  code <<-EOH
    sed -i 's/server pool.ntp*/server 0.ca.pool.ntp.org\nserver 1.ca.pool.ntp.org\n server 2.ca.pool.ntp.org\nserver 3.ca.pool.ntp.org/g'
  EOH
end

service "ntp" do
  action :restart
end
