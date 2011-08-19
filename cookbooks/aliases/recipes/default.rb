bash "set ntp servers" do
  code <<-EOH
    sed -i 's/^root:/root: unixroot@ehealthinnovation.org/g'
  EOH
end
