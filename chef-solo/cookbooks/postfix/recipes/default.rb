package "postfix"

bash "set aliases" do
  code <<-EOH
    echo "root: unixroot@ehealthinnovation.org" >> /etc/aliases
  EOH
end
