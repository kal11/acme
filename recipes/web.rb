#
# Cookbook Name:: acme
# Recipe:: web
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
# Create the document root directory
#Some IP work to workaround multinode kitchen.

# linux
#

kernel = node['kernel']
auto_node = node.automatic

# linux
  if node["virtualization"] && node["virtualization"]["system"] == "vbox"
    interface = node["network"]["interfaces"].select do |key|
        puts key
            key == "enp0s8"
              end
                unless interface.empty?
                    interface["enp0s8"]["addresses"].each do |ip, params|
                          if params['family'] == ('inet')
                                  auto_node["ipaddress"] = ip
                                        end
                                            end
                                              end
                                                
                                                # windows
 
                                                elsif kernel && kernel["cs_info"] && kernel["cs_info"]["model"] == "VirtualBox"
                                                  interfaces = node["network"]["interfaces"]
                                                    interface_key = interfaces.keys.last
                                                      auto_node["ipaddress"] = interfaces[interface_key]["configuration"]["ip_address"][0]
                                                      end

directory node['acme']['web']['document_root'] do
  recursive true
end

# Add the site configuration.
httpd_config 'default' do
  source 'default.conf.erb'
end

# Install Apache and start the service.
httpd_service 'default' do
  mpm 'prefork'
  action [:create, :start]
  subscribes :restart, 'httpd_config[default]'
end
# Install php.
package 'php' do
  action :install
  notifies :restart, 'httpd_service[default]'
end

search(:node, 'roles:acmedynamic',
  :filter_result => {'ip' => [ 'ipaddress' ]
                    }
      ).each do |result|
  puts result['ip']
end
 
