name 'acme'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures acme'
long_description 'Installs/Configures acme'
version '0.1.0'
chef_version '>= 12.1' if respond to?(:chef_version)
issues_url  'https://github.com/learn-chef/lamp/issues' if respond_to?(:issues_url)
sources_url 'https://github.com/learn-chef/lamp' if respond_to?(:source_url)
supports 'ubuntu'

depends 'httpd', '~>0.4'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/acme/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/acme' if respond_to?(:source_url)
