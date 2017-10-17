#
# Cookbook:: hungry_rbenv
# Recipe:: default
#
# Copyright:: 2017, Rlab, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

bash 'apt update_rbenv' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  apt-get update
  EOH
end

rbenv_system_install 'system' do
  update_rbenv false
end

rbenv_ruby node['hungry_rbenv']['ruby_version']

rbenv_global node['hungry_rbenv']['ruby_version']

user 'deploy' do
  comment 'Random User'
  uid '1512'
  gid 'sudo'
  password '$1$aGDTbIQw$sndFQ2IkX7VcsvkURN7SV1'
end
