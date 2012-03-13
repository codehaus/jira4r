################################################################################
#  Copyright 2006-2010 OpenXource Australia
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
################################################################################

require 'yaml'
require 'lib/jira4r/jira_tool.rb'

# YAML should look like
# url: http://jira4.atlassian.com
# username: mr_test
# password: mr_test99
def get_credentials(file)
  result = YAML.load_file(file)
  raise Exception "No JIRA URL defined (url)" unless result.has_key?('url')
  raise Exception "No JIRA username defined (username)" unless result.has_key?('url')
  raise Exception "No JIRA password defined (password)" unless result.has_key?('url')
  return result
end


def connect_to_jira(file)
  creds = get_credentials(file)
  jira = Jira4R::JiraTool.new(2, creds['url'])
  jira.login(creds['username'], creds['password'])
  return jira
end