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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module DriveV3
      # Drive API
      #
      # The API to interact with Drive.
      #
      # @example
      #    require 'google/apis/drive_v3'
      #
      #    Drive = Google::Apis::DriveV3 # Alias the module
      #    service = Drive::DriveService.new
      #
      # @see https://developers.google.com/drive/
      class DriveService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        #  Overrides userIp if both are provided.
        attr_accessor :quota_user

        # @return [String]
        #  IP address of the site where the request originates. Use this if you want to
        #  enforce per-user limits.
        attr_accessor :user_ip

        def initialize
          super('https://www.googleapis.com/', 'drive/v3/')
        end
        
        # Gets information about the user, the user's Drive, and system capabilities.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::About] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::About]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_about(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'about', options)
          command.response_representation = Google::Apis::DriveV3::About::Representation
          command.response_class = Google::Apis::DriveV3::About
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the starting pageToken for listing future changes.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::StartPageToken] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::StartPageToken]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_changes_start_page_token(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'changes/startPageToken', options)
          command.response_representation = Google::Apis::DriveV3::StartPageToken::Representation
          command.response_class = Google::Apis::DriveV3::StartPageToken
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists changes for a user.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This should
        #   be set to the value of 'nextPageToken' from the previous response or to the
        #   response from the getStartPageToken method.
        # @param [Boolean] include_removed
        #   Whether to include changes indicating that items have left the view of the
        #   changes list, for example by deletion or lost access.
        # @param [Fixnum] page_size
        #   The maximum number of changes to return per page.
        # @param [Boolean] restrict_to_my_drive
        #   Whether to restrict the results to changes inside the My Drive hierarchy. This
        #   omits changes to files such as those in the Application Data folder or shared
        #   files which have not been added to My Drive.
        # @param [String] spaces
        #   A comma-separated list of spaces to query within the user corpus. Supported
        #   values are 'drive', 'appDataFolder' and 'photos'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::ChangeList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::ChangeList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_changes(page_token, include_removed: nil, page_size: nil, restrict_to_my_drive: nil, spaces: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'changes', options)
          command.response_representation = Google::Apis::DriveV3::ChangeList::Representation
          command.response_class = Google::Apis::DriveV3::ChangeList
          command.query['includeRemoved'] = include_removed unless include_removed.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['restrictToMyDrive'] = restrict_to_my_drive unless restrict_to_my_drive.nil?
          command.query['spaces'] = spaces unless spaces.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Subscribes to changes for a user.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This should
        #   be set to the value of 'nextPageToken' from the previous response or to the
        #   response from the getStartPageToken method.
        # @param [Google::Apis::DriveV3::Channel] channel_object
        # @param [Boolean] include_removed
        #   Whether to include changes indicating that items have left the view of the
        #   changes list, for example by deletion or lost access.
        # @param [Fixnum] page_size
        #   The maximum number of changes to return per page.
        # @param [Boolean] restrict_to_my_drive
        #   Whether to restrict the results to changes inside the My Drive hierarchy. This
        #   omits changes to files such as those in the Application Data folder or shared
        #   files which have not been added to My Drive.
        # @param [String] spaces
        #   A comma-separated list of spaces to query within the user corpus. Supported
        #   values are 'drive', 'appDataFolder' and 'photos'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_change(page_token, channel_object = nil, include_removed: nil, page_size: nil, restrict_to_my_drive: nil, spaces: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:post, 'changes/watch', options)
          command.request_representation = Google::Apis::DriveV3::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::DriveV3::Channel::Representation
          command.response_class = Google::Apis::DriveV3::Channel
          command.query['includeRemoved'] = include_removed unless include_removed.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['restrictToMyDrive'] = restrict_to_my_drive unless restrict_to_my_drive.nil?
          command.query['spaces'] = spaces unless spaces.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Stop watching resources through this channel
        # @param [Google::Apis::DriveV3::Channel] channel_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def stop_channel(channel_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:post, 'channels/stop', options)
          command.request_representation = Google::Apis::DriveV3::Channel::Representation
          command.request_object = channel_object
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new comment on a file.
        # @param [String] file_id
        #   The ID of the file.
        # @param [Google::Apis::DriveV3::Comment] comment_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_comment(file_id, comment_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:post, 'files/{fileId}/comments', options)
          command.request_representation = Google::Apis::DriveV3::Comment::Representation
          command.request_object = comment_object
          command.response_representation = Google::Apis::DriveV3::Comment::Representation
          command.response_class = Google::Apis::DriveV3::Comment
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a comment.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_comment(file_id, comment_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'files/{fileId}/comments/{commentId}', options)
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a comment by ID.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [Boolean] include_deleted
        #   Whether to return deleted comments. Deleted comments will not include their
        #   original content.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_comment(file_id, comment_id, include_deleted: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/{fileId}/comments/{commentId}', options)
          command.response_representation = Google::Apis::DriveV3::Comment::Representation
          command.response_class = Google::Apis::DriveV3::Comment
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['includeDeleted'] = include_deleted unless include_deleted.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists a file's comments.
        # @param [String] file_id
        #   The ID of the file.
        # @param [Boolean] include_deleted
        #   Whether to include deleted comments. Deleted comments will not include their
        #   original content.
        # @param [Fixnum] page_size
        #   The maximum number of comments to return per page.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This should
        #   be set to the value of 'nextPageToken' from the previous response.
        # @param [String] start_modified_time
        #   The minimum value of 'modifiedTime' for the result comments (RFC 3339 date-
        #   time).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::CommentList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::CommentList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_comments(file_id, include_deleted: nil, page_size: nil, page_token: nil, start_modified_time: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/{fileId}/comments', options)
          command.response_representation = Google::Apis::DriveV3::CommentList::Representation
          command.response_class = Google::Apis::DriveV3::CommentList
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['includeDeleted'] = include_deleted unless include_deleted.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startModifiedTime'] = start_modified_time unless start_modified_time.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a comment with patch semantics.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [Google::Apis::DriveV3::Comment] comment_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Comment] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Comment]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_comment(file_id, comment_id, comment_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:patch, 'files/{fileId}/comments/{commentId}', options)
          command.request_representation = Google::Apis::DriveV3::Comment::Representation
          command.request_object = comment_object
          command.response_representation = Google::Apis::DriveV3::Comment::Representation
          command.response_class = Google::Apis::DriveV3::Comment
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a copy of a file and applies any requested updates with patch
        # semantics.
        # @param [String] file_id
        #   The ID of the file.
        # @param [Google::Apis::DriveV3::File] file_object
        # @param [Boolean] ignore_default_visibility
        #   Whether to ignore the domain's default visibility settings for the created
        #   file. Domain administrators can choose to make all uploaded files visible to
        #   the domain by default; this parameter bypasses that behavior for the request.
        #   Permissions are still inherited from parent folders.
        # @param [Boolean] keep_revision_forever
        #   Whether to set the 'keepForever' field in the new head revision. This is only
        #   applicable to files with binary content in Drive.
        # @param [String] ocr_language
        #   A language hint for OCR processing during image import (ISO 639-1 code).
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::File] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::File]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def copy_file(file_id, file_object = nil, ignore_default_visibility: nil, keep_revision_forever: nil, ocr_language: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:post, 'files/{fileId}/copy', options)
          command.request_representation = Google::Apis::DriveV3::File::Representation
          command.request_object = file_object
          command.response_representation = Google::Apis::DriveV3::File::Representation
          command.response_class = Google::Apis::DriveV3::File
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['ignoreDefaultVisibility'] = ignore_default_visibility unless ignore_default_visibility.nil?
          command.query['keepRevisionForever'] = keep_revision_forever unless keep_revision_forever.nil?
          command.query['ocrLanguage'] = ocr_language unless ocr_language.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new file.
        # @param [Google::Apis::DriveV3::File] file_object
        # @param [Boolean] ignore_default_visibility
        #   Whether to ignore the domain's default visibility settings for the created
        #   file. Domain administrators can choose to make all uploaded files visible to
        #   the domain by default; this parameter bypasses that behavior for the request.
        #   Permissions are still inherited from parent folders.
        # @param [Boolean] keep_revision_forever
        #   Whether to set the 'keepForever' field in the new head revision. This is only
        #   applicable to files with binary content in Drive.
        # @param [String] ocr_language
        #   A language hint for OCR processing during image import (ISO 639-1 code).
        # @param [Boolean] use_content_as_indexable_text
        #   Whether to use the uploaded content as indexable text.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::File] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::File]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_file(file_object = nil, ignore_default_visibility: nil, keep_revision_forever: nil, ocr_language: nil, use_content_as_indexable_text: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command =  make_simple_command(:post, 'files', options)
          else
            command = make_upload_command(:post, 'files', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::DriveV3::File::Representation
          command.request_object = file_object
          command.response_representation = Google::Apis::DriveV3::File::Representation
          command.response_class = Google::Apis::DriveV3::File
          command.query['ignoreDefaultVisibility'] = ignore_default_visibility unless ignore_default_visibility.nil?
          command.query['keepRevisionForever'] = keep_revision_forever unless keep_revision_forever.nil?
          command.query['ocrLanguage'] = ocr_language unless ocr_language.nil?
          command.query['useContentAsIndexableText'] = use_content_as_indexable_text unless use_content_as_indexable_text.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes a file owned by the user without moving it to the trash.
        # If the target is a folder, all descendants owned by the user are also deleted.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_file(file_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'files/{fileId}', options)
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes all of the user's trashed files.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def empty_file_trash(fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'files/trash', options)
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Exports a Google Doc to the requested MIME type and returns the exported
        # content.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] mime_type
        #   The MIME type of the format requested for this export.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def export_file(file_id, mime_type, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command =  make_simple_command(:get, 'files/{fileId}/export', options)
          else
            command = make_download_command(:get, 'files/{fileId}/export', options)
            command.download_dest = download_dest
          end
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['mimeType'] = mime_type unless mime_type.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Generates a set of file IDs which can be provided in create requests.
        # @param [Fixnum] count
        #   The number of IDs to return.
        # @param [String] space
        #   The space in which the IDs can be used to create new files. Supported values
        #   are 'drive' and 'appDataFolder'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::GeneratedIds] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::GeneratedIds]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def generate_file_ids(count: nil, space: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/generateIds', options)
          command.response_representation = Google::Apis::DriveV3::GeneratedIds::Representation
          command.response_class = Google::Apis::DriveV3::GeneratedIds
          command.query['count'] = count unless count.nil?
          command.query['space'] = space unless space.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a file's metadata or content by ID.
        # @param [String] file_id
        #   The ID of the file.
        # @param [Boolean] acknowledge_abuse
        #   Whether the user is acknowledging the risk of downloading known malware or
        #   other abusive files. This is only applicable when alt=media.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::File] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::File]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_file(file_id, acknowledge_abuse: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command =  make_simple_command(:get, 'files/{fileId}', options)
          else
            command = make_download_command(:get, 'files/{fileId}', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::DriveV3::File::Representation
          command.response_class = Google::Apis::DriveV3::File
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['acknowledgeAbuse'] = acknowledge_abuse unless acknowledge_abuse.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists or searches files.
        # @param [String] corpus
        #   The source of files to list.
        # @param [String] order_by
        #   A comma-separated list of sort keys. Valid keys are 'createdTime', 'folder', '
        #   modifiedByMeTime', 'modifiedTime', 'name', 'quotaBytesUsed', 'recency', '
        #   sharedWithMeTime', 'starred', and 'viewedByMeTime'. Each key sorts ascending
        #   by default, but may be reversed with the 'desc' modifier. Example usage: ?
        #   orderBy=folder,modifiedTime desc,name. Please note that there is a current
        #   limitation for users with approximately one million files in which the
        #   requested sort order is ignored.
        # @param [Fixnum] page_size
        #   The maximum number of files to return per page.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This should
        #   be set to the value of 'nextPageToken' from the previous response.
        # @param [String] q
        #   A query for filtering the file results. See the "Search for Files" guide for
        #   supported syntax.
        # @param [String] spaces
        #   A comma-separated list of spaces to query within the corpus. Supported values
        #   are 'drive', 'appDataFolder' and 'photos'.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::FileList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::FileList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_files(corpus: nil, order_by: nil, page_size: nil, page_token: nil, q: nil, spaces: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files', options)
          command.response_representation = Google::Apis::DriveV3::FileList::Representation
          command.response_class = Google::Apis::DriveV3::FileList
          command.query['corpus'] = corpus unless corpus.nil?
          command.query['orderBy'] = order_by unless order_by.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['q'] = q unless q.nil?
          command.query['spaces'] = spaces unless spaces.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a file's metadata and/or content with patch semantics.
        # @param [String] file_id
        #   The ID of the file.
        # @param [Google::Apis::DriveV3::File] file_object
        # @param [String] add_parents
        #   A comma-separated list of parent IDs to add.
        # @param [Boolean] keep_revision_forever
        #   Whether to set the 'keepForever' field in the new head revision. This is only
        #   applicable to files with binary content in Drive.
        # @param [String] ocr_language
        #   A language hint for OCR processing during image import (ISO 639-1 code).
        # @param [String] remove_parents
        #   A comma-separated list of parent IDs to remove.
        # @param [Boolean] use_content_as_indexable_text
        #   Whether to use the uploaded content as indexable text.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::File] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::File]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_file(file_id, file_object = nil, add_parents: nil, keep_revision_forever: nil, ocr_language: nil, remove_parents: nil, use_content_as_indexable_text: nil, fields: nil, quota_user: nil, user_ip: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command =  make_simple_command(:patch, 'files/{fileId}', options)
          else
            command = make_upload_command(:patch, 'files/{fileId}', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::DriveV3::File::Representation
          command.request_object = file_object
          command.response_representation = Google::Apis::DriveV3::File::Representation
          command.response_class = Google::Apis::DriveV3::File
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['addParents'] = add_parents unless add_parents.nil?
          command.query['keepRevisionForever'] = keep_revision_forever unless keep_revision_forever.nil?
          command.query['ocrLanguage'] = ocr_language unless ocr_language.nil?
          command.query['removeParents'] = remove_parents unless remove_parents.nil?
          command.query['useContentAsIndexableText'] = use_content_as_indexable_text unless use_content_as_indexable_text.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Subscribes to changes to a file
        # @param [String] file_id
        #   The ID of the file.
        # @param [Google::Apis::DriveV3::Channel] channel_object
        # @param [Boolean] acknowledge_abuse
        #   Whether the user is acknowledging the risk of downloading known malware or
        #   other abusive files. This is only applicable when alt=media.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Channel] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Channel]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def watch_file(file_id, channel_object = nil, acknowledge_abuse: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command =  make_simple_command(:post, 'files/{fileId}/watch', options)
          else
            command = make_download_command(:post, 'files/{fileId}/watch', options)
            command.download_dest = download_dest
          end
          command.request_representation = Google::Apis::DriveV3::Channel::Representation
          command.request_object = channel_object
          command.response_representation = Google::Apis::DriveV3::Channel::Representation
          command.response_class = Google::Apis::DriveV3::Channel
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['acknowledgeAbuse'] = acknowledge_abuse unless acknowledge_abuse.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a permission for a file.
        # @param [String] file_id
        #   The ID of the file.
        # @param [Google::Apis::DriveV3::Permission] permission_object
        # @param [String] email_message
        #   A custom message to include in the notification email.
        # @param [Boolean] send_notification_email
        #   Whether to send a notification email when sharing to users or groups. This
        #   defaults to true for users and groups, and is not allowed for other requests.
        #   It must not be disabled for ownership transfers.
        # @param [Boolean] transfer_ownership
        #   Whether to transfer ownership to the specified user and downgrade the current
        #   owner to a writer. This parameter is required as an acknowledgement of the
        #   side effect.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Permission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Permission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_permission(file_id, permission_object = nil, email_message: nil, send_notification_email: nil, transfer_ownership: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:post, 'files/{fileId}/permissions', options)
          command.request_representation = Google::Apis::DriveV3::Permission::Representation
          command.request_object = permission_object
          command.response_representation = Google::Apis::DriveV3::Permission::Representation
          command.response_class = Google::Apis::DriveV3::Permission
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['emailMessage'] = email_message unless email_message.nil?
          command.query['sendNotificationEmail'] = send_notification_email unless send_notification_email.nil?
          command.query['transferOwnership'] = transfer_ownership unless transfer_ownership.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a permission.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] permission_id
        #   The ID of the permission.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_permission(file_id, permission_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'files/{fileId}/permissions/{permissionId}', options)
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['permissionId'] = permission_id unless permission_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a permission by ID.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] permission_id
        #   The ID of the permission.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Permission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Permission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_permission(file_id, permission_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/{fileId}/permissions/{permissionId}', options)
          command.response_representation = Google::Apis::DriveV3::Permission::Representation
          command.response_class = Google::Apis::DriveV3::Permission
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['permissionId'] = permission_id unless permission_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists a file's permissions.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::PermissionList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::PermissionList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_permissions(file_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/{fileId}/permissions', options)
          command.response_representation = Google::Apis::DriveV3::PermissionList::Representation
          command.response_class = Google::Apis::DriveV3::PermissionList
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a permission with patch semantics.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] permission_id
        #   The ID of the permission.
        # @param [Google::Apis::DriveV3::Permission] permission_object
        # @param [Boolean] transfer_ownership
        #   Whether to transfer ownership to the specified user and downgrade the current
        #   owner to a writer. This parameter is required as an acknowledgement of the
        #   side effect.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Permission] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Permission]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_permission(file_id, permission_id, permission_object = nil, transfer_ownership: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:patch, 'files/{fileId}/permissions/{permissionId}', options)
          command.request_representation = Google::Apis::DriveV3::Permission::Representation
          command.request_object = permission_object
          command.response_representation = Google::Apis::DriveV3::Permission::Representation
          command.response_class = Google::Apis::DriveV3::Permission
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['permissionId'] = permission_id unless permission_id.nil?
          command.query['transferOwnership'] = transfer_ownership unless transfer_ownership.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a new reply to a comment.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [Google::Apis::DriveV3::Reply] reply_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Reply] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Reply]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_reply(file_id, comment_id, reply_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:post, 'files/{fileId}/comments/{commentId}/replies', options)
          command.request_representation = Google::Apis::DriveV3::Reply::Representation
          command.request_object = reply_object
          command.response_representation = Google::Apis::DriveV3::Reply::Representation
          command.response_class = Google::Apis::DriveV3::Reply
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a reply.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [String] reply_id
        #   The ID of the reply.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_reply(file_id, comment_id, reply_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'files/{fileId}/comments/{commentId}/replies/{replyId}', options)
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.params['replyId'] = reply_id unless reply_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a reply by ID.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [String] reply_id
        #   The ID of the reply.
        # @param [Boolean] include_deleted
        #   Whether to return deleted replies. Deleted replies will not include their
        #   original content.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Reply] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Reply]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_reply(file_id, comment_id, reply_id, include_deleted: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/{fileId}/comments/{commentId}/replies/{replyId}', options)
          command.response_representation = Google::Apis::DriveV3::Reply::Representation
          command.response_class = Google::Apis::DriveV3::Reply
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.params['replyId'] = reply_id unless reply_id.nil?
          command.query['includeDeleted'] = include_deleted unless include_deleted.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists a comment's replies.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [Boolean] include_deleted
        #   Whether to include deleted replies. Deleted replies will not include their
        #   original content.
        # @param [Fixnum] page_size
        #   The maximum number of replies to return per page.
        # @param [String] page_token
        #   The token for continuing a previous list request on the next page. This should
        #   be set to the value of 'nextPageToken' from the previous response.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::ReplyList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::ReplyList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_replies(file_id, comment_id, include_deleted: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/{fileId}/comments/{commentId}/replies', options)
          command.response_representation = Google::Apis::DriveV3::ReplyList::Representation
          command.response_class = Google::Apis::DriveV3::ReplyList
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.query['includeDeleted'] = include_deleted unless include_deleted.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a reply with patch semantics.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] comment_id
        #   The ID of the comment.
        # @param [String] reply_id
        #   The ID of the reply.
        # @param [Google::Apis::DriveV3::Reply] reply_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Reply] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Reply]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_reply(file_id, comment_id, reply_id, reply_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:patch, 'files/{fileId}/comments/{commentId}/replies/{replyId}', options)
          command.request_representation = Google::Apis::DriveV3::Reply::Representation
          command.request_object = reply_object
          command.response_representation = Google::Apis::DriveV3::Reply::Representation
          command.response_class = Google::Apis::DriveV3::Reply
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['commentId'] = comment_id unless comment_id.nil?
          command.params['replyId'] = reply_id unless reply_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Permanently deletes a revision. This method is only applicable to files with
        # binary content in Drive.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] revision_id
        #   The ID of the revision.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [NilClass] No result returned for this method
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [void]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_revision(file_id, revision_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'files/{fileId}/revisions/{revisionId}', options)
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['revisionId'] = revision_id unless revision_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets a revision's metadata or content by ID.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] revision_id
        #   The ID of the revision.
        # @param [Boolean] acknowledge_abuse
        #   Whether the user is acknowledging the risk of downloading known malware or
        #   other abusive files. This is only applicable when alt=media.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Revision] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Revision]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_revision(file_id, revision_id, acknowledge_abuse: nil, fields: nil, quota_user: nil, user_ip: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command =  make_simple_command(:get, 'files/{fileId}/revisions/{revisionId}', options)
          else
            command = make_download_command(:get, 'files/{fileId}/revisions/{revisionId}', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::DriveV3::Revision::Representation
          command.response_class = Google::Apis::DriveV3::Revision
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['revisionId'] = revision_id unless revision_id.nil?
          command.query['acknowledgeAbuse'] = acknowledge_abuse unless acknowledge_abuse.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists a file's revisions.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::RevisionList] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::RevisionList]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_revisions(file_id, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:get, 'files/{fileId}/revisions', options)
          command.response_representation = Google::Apis::DriveV3::RevisionList::Representation
          command.response_class = Google::Apis::DriveV3::RevisionList
          command.params['fileId'] = file_id unless file_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a revision with patch semantics.
        # @param [String] file_id
        #   The ID of the file.
        # @param [String] revision_id
        #   The ID of the revision.
        # @param [Google::Apis::DriveV3::Revision] revision_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        #   Overrides userIp if both are provided.
        # @param [String] user_ip
        #   IP address of the site where the request originates. Use this if you want to
        #   enforce per-user limits.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DriveV3::Revision] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DriveV3::Revision]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_revision(file_id, revision_id, revision_object = nil, fields: nil, quota_user: nil, user_ip: nil, options: nil, &block)
          command =  make_simple_command(:patch, 'files/{fileId}/revisions/{revisionId}', options)
          command.request_representation = Google::Apis::DriveV3::Revision::Representation
          command.request_object = revision_object
          command.response_representation = Google::Apis::DriveV3::Revision::Representation
          command.response_class = Google::Apis::DriveV3::Revision
          command.params['fileId'] = file_id unless file_id.nil?
          command.params['revisionId'] = revision_id unless revision_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['userIp'] = user_ip unless user_ip.nil?
        end
      end
    end
  end
end
