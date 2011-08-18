package 'curl'
package 'libcurl4-openssl-dev'

bash "install rvm" do
  code <<-EOH
    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    source /etc/profile.d/rvm.sh
  EOH
  creates "/usr/local/rvm"
end

bash "install rvm ruby 1.9.2" do
  code <<-EOH
    echo "rvm use 1.9.2" >> /etc/profile.d/rvm.sh
    source /etc/profile.d/rvm.sh

    echo "install ssl"
    rvm package install openssl

    echo "install ruby 1.9.2"
    rvm install 1.9.2 --with-openssl-dir=/usr/local/rvm/usr


    echo "use 1.9.2"
    rvm use 1.9.2 --default
  EOH
  creates "/usr/local/rvm/gems/ruby-1.9.2-p290/"
end

bash "install bundler" do
  code <<-EOH
    source /etc/profile.d/rvm.sh
    gem install bundler --no-rdoc --no-ri
  EOH
  creates "/usr/local/rvm/gems/ruby-1.9.2-p290/bin/bundle"
end

bash "install passenger" do
  code <<-EOH
    source /etc/profile.d/rvm.sh
    gem install passenger --no-rdoc --no-ri
    /usr/local/rvm/gems/ruby-1.9.2-p290/bin/passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx
  EOH
  creates "/usr/local/rvm/gems/ruby-1.9.2-p290/bin/passenger-install-nginx-module"
end
