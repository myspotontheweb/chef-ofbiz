#
# Cookbook Name:: chef-ofbiz
# Recipe:: default
#
#  Copyright 2013 Mark O'Connor
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

include_recipe "java"
include_recipe "runit"

package "unzip"
package "rsync"

user  "ofbiz"
group "ofbiz"

ark "ofbiz" do 
  url "http://archive.apache.org/dist/ofbiz/apache-ofbiz-12.04.02.zip"
  version "12.04.02"
  checksum "a34d45f5a16f5ef29cf708846460f7b3289ac11b1eddf2ad7692c6c82c9aa4e6"
  owner "ofbiz"
  group "ofbiz"
end

execute "Build Ofbiz loading demo data" do
  command "/usr/local/ofbiz/ant load-demo"
  cwd "/usr/local/ofbiz"
  user "ofbiz"
  group "ofbiz"
  creates "/usr/local/ofbiz/ofbiz.jar"
end

runit_service "ofbiz" do
  options({
    :jvmargs => "-Xms128M -Xmx512M -XX:MaxPermSize=512m"
  })
end

