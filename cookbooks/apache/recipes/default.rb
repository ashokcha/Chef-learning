#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# Install apache package
package 'httpd' do
	package_name 'httpd'
	action :install
end
	
serivce 'httpd' do
	service_name 'httpd'
	action [:start, :enable]
end


