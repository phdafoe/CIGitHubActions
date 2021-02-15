# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/translate_v2/service.rb'
require 'google/apis/translate_v2/classes.rb'
require 'google/apis/translate_v2/representations.rb'

module Google
  module Apis
    # Translate API
    #
    # Lets you translate text from one language to another
    #
    # @see https://developers.google.com/translate/v2/using_rest
    module TranslateV2
      VERSION = 'V2'
      REVISION = '20160217'
    end
  end
end
