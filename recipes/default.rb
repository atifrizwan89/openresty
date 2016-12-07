#
# Cookbook Name:: openresty
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

##########Deault Attributes should go in attributes/default.rb############
node[:openresty_version] = 'openresty-1.11.2.2'
node[:openresty_prefix] = '/usr/local/openresty'
node[:pcre_jit] = 'true'
node[:luajit] == 'true'
node[:http_ssl] == 'true'
node[:with_pcre_jit] = ''
node[:with_luajit] = ''
node[:with_http_ssl] ''


if node[:pcre_jit] == 'true'
node[:with_pcre_jit] = '--with-pcre-jit'

if node[:luajit] == 'true'
node[:with_luajit] = '--with-luajit'

if node[:http_ssl] == 'true'
node[:with_http_ssl] '--with-http_ssl'



if node[:platform_family].include?("rhel")
%w{readline-devel pcre-devel openssl-devel gcc}.each do |pkg|
  package pkg do
    action :install
  end
end
end

if node[:platform_family].include?("debian")
%w{libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential}.each do |pkg|
  package pkg do
    action :install
  end
end
end



bash "install_openresty" do
  user "root"
  cwd "/opt"
  code <<-EOH
  wget https://openresty.org/download/#{node[:openresty_version]}.tar.gz
  tar -xvf #{node[:openresty_version]}.tar.gz
  EOH
  action [:run]
  notifies :run, 'bash[install_with_modules]'
  end
  
  
bash "install_with_modules" do
user "root"
  cwd "/opt/#{node[:openresty_version]}"
  code <<-EOH
  ./configure --prefix=#{node[:openresty_prefix]} #{node[:with_pcre_jit]} #{node[:with_luajit]} #{node[:with_http_ssl]}
  make
  make install
  echo "export PATH=#{node[:openresty_prefix]}/bin:#{node[:openresty_prefix]}/nginx/sbin:$PATH" >> ~/.bash_rc
  source ~/.bash_rc
  EOH
action [:nothing]
end
  
 
 
  
  
  
  