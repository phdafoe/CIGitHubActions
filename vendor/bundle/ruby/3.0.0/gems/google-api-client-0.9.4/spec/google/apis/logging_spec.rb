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

require 'spec_helper'
require 'google/apis'
require 'google/apis/core/logging'

RSpec.describe Google::Apis do
  it 'should have a default logger' do
    expect(Google::Apis.logger).to be_an_instance_of(Logger)
  end

  context 'with service' do
    let(:service) do
      Class.new do
        include Google::Apis::Core::Logging
      end.new
    end

    it 'should have a logger' do
      expect(service.logger).to be_an_instance_of(Logger)
    end

    it 'should use the default logger' do
      expect(service.logger).to be Google::Apis.logger
    end

    it 'should allow custom loggers' do
      Google::Apis.logger = Logger.new(STDERR)
      expect(service.logger).to be Google::Apis.logger
    end

  end
end
