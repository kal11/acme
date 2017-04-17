default['acme']['web']['document_root'] = '/var/www/default/public_html'
default['varnish']['default'] = '/etc/default/varnish'
default['varnish']['dir'] = '/etc/varnish'
default['varnish']['start'] = 'yes'
default['varnish']['vcl_conf'] = 'default.vcl'
default['varnish']['vcl_source'] = 'default.vcl.erb'
default['varnish']['conf_source'] = 'varnish.erb'
#default['acmestatic'] = search(:node, 'role:acmestatic')
