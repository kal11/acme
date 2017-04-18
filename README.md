# acme

This is a chef cookbook that will automatically install a webserver and change it's listening port to 8080 and the default root directory to /var/www/default/ just specifying in the run_list the following

recipe:

acme::web

In order for the webservers to be automatically added to varnish backends there are two chef roles that need to be defined either in the .kitchen.yml or using knife these roles are:

amcestatic (This role will automatically add the backend to the right part in the vcl template for caching and also loadbalancing with the right weight currently the weight assigned for this role is 9)

To install varnish and configure the main node please use acme::varnish

TODO: acmedynamic not finalized yet it's actually a one line of extra work and it will have the weight of 1 and it would be used only if the request is dynamic request i.e. not an image or a vdieo.

For now this cookbook only works on ubuntu and tested on ubuntu-16.04.

Whenever I get more time I will work on fixing the issue and a new branch for the acmedynamic and AWS support for autoscaling using ELB ASGs.

