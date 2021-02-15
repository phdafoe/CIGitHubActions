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
    module ClassroomV1
      
      class Course
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCoursesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CourseAlias
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListCourseAliasesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Invitation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListInvitationsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserProfile
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Name
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GlobalPermission
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Teacher
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListTeachersResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Student
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListStudentsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Course
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name'
          property :section, as: 'section'
          property :description_heading, as: 'descriptionHeading'
          property :description, as: 'description'
          property :room, as: 'room'
          property :owner_id, as: 'ownerId'
          property :creation_time, as: 'creationTime'
          property :update_time, as: 'updateTime'
          property :enrollment_code, as: 'enrollmentCode'
          property :course_state, as: 'courseState'
          property :alternate_link, as: 'alternateLink'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class ListCoursesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :courses, as: 'courses', class: Google::Apis::ClassroomV1::Course, decorator: Google::Apis::ClassroomV1::Course::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class CourseAlias
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :alias, as: 'alias'
        end
      end
      
      class ListCourseAliasesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :aliases, as: 'aliases', class: Google::Apis::ClassroomV1::CourseAlias, decorator: Google::Apis::ClassroomV1::CourseAlias::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Invitation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :user_id, as: 'userId'
          property :course_id, as: 'courseId'
          property :role, as: 'role'
        end
      end
      
      class ListInvitationsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :invitations, as: 'invitations', class: Google::Apis::ClassroomV1::Invitation, decorator: Google::Apis::ClassroomV1::Invitation::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class UserProfile
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :name, as: 'name', class: Google::Apis::ClassroomV1::Name, decorator: Google::Apis::ClassroomV1::Name::Representation
      
          property :email_address, as: 'emailAddress'
          property :photo_url, as: 'photoUrl'
          collection :permissions, as: 'permissions', class: Google::Apis::ClassroomV1::GlobalPermission, decorator: Google::Apis::ClassroomV1::GlobalPermission::Representation
      
        end
      end
      
      class Name
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :given_name, as: 'givenName'
          property :family_name, as: 'familyName'
          property :full_name, as: 'fullName'
        end
      end
      
      class GlobalPermission
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :permission, as: 'permission'
        end
      end
      
      class Teacher
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :course_id, as: 'courseId'
          property :user_id, as: 'userId'
          property :profile, as: 'profile', class: Google::Apis::ClassroomV1::UserProfile, decorator: Google::Apis::ClassroomV1::UserProfile::Representation
      
        end
      end
      
      class ListTeachersResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :teachers, as: 'teachers', class: Google::Apis::ClassroomV1::Teacher, decorator: Google::Apis::ClassroomV1::Teacher::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Student
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :course_id, as: 'courseId'
          property :user_id, as: 'userId'
          property :profile, as: 'profile', class: Google::Apis::ClassroomV1::UserProfile, decorator: Google::Apis::ClassroomV1::UserProfile::Representation
      
        end
      end
      
      class ListStudentsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :students, as: 'students', class: Google::Apis::ClassroomV1::Student, decorator: Google::Apis::ClassroomV1::Student::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
    end
  end
end
