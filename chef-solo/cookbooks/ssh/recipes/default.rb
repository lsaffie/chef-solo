bash "disable ssh root login" do
  code <<-EOH
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
  EOH
end

service "ssh" do
  action :restart
end
