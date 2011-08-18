gem_pacakge "ruby-shadow" do
  action :install
end

user "deploy" do
  comment "deploy user"
  system true
  shell "/bin/bash"
  home "/home/deploy"
  password "$1$9oRNaWmK$psmojmwlT10bmQjdXYvkH1"
  supports :manage_home => true
end
