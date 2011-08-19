bash "set aliases" do
  code <<-EOH
    sed -i 's/^root:/root: unixroot@ehealthinnovation.org/g'
  EOH
end
