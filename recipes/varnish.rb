#
# Cookbook Name:: acme
# Recipe:: varnish
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
# Install varnish.

package 'varnish' do
  action [:install]
end

service 'varnish' do
 action [:start]
end
#results = search(:node, 'roles:acmestatic',
#  :filter_result => {'ip' => [ 'ipaddress' ]
#                    }
#      ).each do |result|
#  puts result['myvar']
#end
#
acmestatic = search(:node, "role:acmestatic")
#srvrole = results[0]
  template "#{node['varnish']['dir']}/#{node['varnish']['vcl_conf']}" do
#  source node['varnish']['vcl_source']
#  cookbook node['varnish']['vcl_cookbook']
  variables(
      :acmestatic => acmestatic
    )
#  owner 'root'
#  group 'root'
#  mode 0644
   notifies :restart, 'service[varnish]', :delayed
#   onlyif node['varnish']['vcl_generated'] == false }
end

service 'varnish' do
 action [:restart]
end
#search(:node, 'roles:acmedynamic',
#  :filter_result => {'ip' => [ 'ipaddress' ]
#                    }
#      ).each do |result|
#  puts result['ipaddress']
#end
