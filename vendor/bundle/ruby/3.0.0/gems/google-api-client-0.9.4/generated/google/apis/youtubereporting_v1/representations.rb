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

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module YoutubereportingV1
      
      class Media
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReportTypesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ReportType
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Job
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListJobsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListReportsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Report
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Media
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :resource_name, as: 'resourceName'
        end
      end
      
      class ListReportTypesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :report_types, as: 'reportTypes', class: Google::Apis::YoutubereportingV1::ReportType, decorator: Google::Apis::YoutubereportingV1::ReportType::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class ReportType
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
        end
      end
      
      class Job
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :report_type_id, as: 'reportTypeId'
          property :name, as: 'name'
          property :create_time, as: 'createTime'
        end
      end
      
      class ListJobsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :jobs, as: 'jobs', class: Google::Apis::YoutubereportingV1::Job, decorator: Google::Apis::YoutubereportingV1::Job::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ListReportsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :reports, as: 'reports', class: Google::Apis::YoutubereportingV1::Report, decorator: Google::Apis::YoutubereportingV1::Report::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Report
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :job_id, as: 'jobId'
          property :start_time, as: 'startTime'
          property :end_time, as: 'endTime'
          property :create_time, as: 'createTime'
          property :download_url, as: 'downloadUrl'
        end
      end
    end
  end
end
