chef ofbiz cookbook
===================
This is a cookbook designed to install and run Apache Ofbiz, following the installation instructions

- http://ofbiz.apache.org/download.html

This is really just an example cookbook, installing the demo data. It was written to answer the following
stackoverflow question:

- http://stackoverflow.com/questions/19751025/can-ofbiz-be-configured-to-work-as-a-single-monolithic-webapp

This cookbook has only been tested on CentOS, but should work on most linuxes

Requirements
------------
This cookbook depends on the following cookbooks

- ark
- java 
- runit

Usage
-----
This project has been setup to run as a vagrant project. Need to install vagrant, virtualbox
and the following vagrant plugins

- vagrant-berkshelf 
- vagrant-omnibus 

Run vagrant

  vagrant up

Ofbiz will br running on the following URL

- http://33.33.33.10:8080/catalog

Attributes
----------

- TODO : Cookbook has no attributes currently need to soft configure items like Ofbiz version

Recipes
-------

- default

Author
------

Author:: Mark O'Connor (mark@myspotontheweb.com)
