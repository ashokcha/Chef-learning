package 'Install Apache' do
	package_name 'httpd'
	action [:install]
end

service 'httpd' do
	service_name 'httpd'
	action [:restart, :enable]
end

file 'Update index.html' do
	path '/var/www/html/index.html'
	content '<html> This is a test Chef workstation....... </html>'
	mode '0755'
	owner 'root'
	group 'root'
	backup 2
	notifies :restart, 'service[httpd]'
end

%w{dos2unix perl-macros}.each do | pkg |
	package pkg do
	action :upgrade
	end
end

file 'Update Banner' do
	path '/etc/motd'
	content 'THIS IS A TEST BANNER'
end

execute 'command-test' do
	command 'echo bbbbbbbbblah >> /etc/motd'
	not_if 'test -r /etc/motd'
end

#service 'httpd' do
#	subscribes :reload, "cookbook_file /etc/httpd/conf/httpd.conf"
#end

#cookbook_file "/etc/httpd/conf/httpd.conf" do
#	source 'httpd.conf'
#	mode '0644'
#	notifies :restart, 'service[httpd]'
#end
