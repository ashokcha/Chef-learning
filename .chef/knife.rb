# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ashok"
client_key               "#{current_dir}/ashok.pem"
chef_server_url          "https://achauhan19801.mylabserver.com/organizations/ashokacademy"
cookbook_path            ["#{current_dir}/../cookbooks"]
