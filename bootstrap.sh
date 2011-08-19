## This script is used to initialize a machine by setting up
## chef solo and running the recipes
##
## Date: 2011.08.18
## Author: Luis Saffie <luis@saffie.ca>
##

apt-get update
apt-get -y upgrade

# Installing git
apt-get -y install git-core

## Install Chef Solo
apt-get -y install ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert ruby1.8-dev

cd /tmp
wget http://production.cf.rubygems.org/rubygems/rubygems-1.7.2.tgz
tar zxf rubygems-1.7.2.tgz
cd rubygems-1.7.2
ruby setup.rb --no-format-executable

gem install chef --no-ri --no-rdoc
gem install ohai --no-ri --no-rdoc

## Bringing in building repo and running it
cd /root
git clone https://github.com/lsaffie/chef-solo.git
cd chef-solo
./cook.sh
