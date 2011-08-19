package "ntp"

bash "set ntp servers" do
  code <<-EOH
    sed -i 's/^server ntp.ubuntu.com/server 0.ca.pool.ntp.org\nserver 1.ca.pool.ntp.org\nserver 2.ca.pool.ntp.org\nserver 3.ca.pool.ntp.org/g'
  EOH
end

service "ntp" do
  action :restart
end
