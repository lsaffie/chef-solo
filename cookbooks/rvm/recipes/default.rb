package 'libcurl4-openssl-dev'

bash "install rvm" do
  code <<-EOH
	bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
  EOH
  creates "/usr/local/rvm"
end

bash "install rvm ruby 1.9.2" do
  code <<-EOH
    echo "install ssl"
    rvm package install openssl

    echo "install ruby 1.9.2"
    rvm install 1.9.2 --with-openssl-dir=/usr/local/rvm/usr

    echo "use 1.9.2"
    rvm --default use 1.9.2

    echo "Add deploy to rvm group"
    usermod -G rvm deploy
  EOH
end

bash "install bundler" do
  code <<-EOH
    gem install bundler --no-rdoc --no-ri
  EOH
end

bash "install passenger" do
  code <<-EOH
    gem install passenger --no-rdoc --no-ri
    /usr/local/rvm/gems/ruby-1.9.2-p290/bin/passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx
  EOH
end
