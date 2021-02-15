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
    module DriveV3
      
      # Information about the user, the user's Drive, and system capabilities.
      class About
        include Google::Apis::Core::Hashable
      
        # Whether the user has installed the requesting app.
        # Corresponds to the JSON property `appInstalled`
        # @return [Boolean]
        attr_accessor :app_installed
        alias_method :app_installed?, :app_installed
      
        # A map of source MIME type to possible targets for all supported exports.
        # Corresponds to the JSON property `exportFormats`
        # @return [Hash<String,Array<String>>]
        attr_accessor :export_formats
      
        # The currently supported folder colors as RGB hex strings.
        # Corresponds to the JSON property `folderColorPalette`
        # @return [Array<String>]
        attr_accessor :folder_color_palette
      
        # A map of source MIME type to possible targets for all supported imports.
        # Corresponds to the JSON property `importFormats`
        # @return [Hash<String,Array<String>>]
        attr_accessor :import_formats
      
        # This is always drive#about.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A map of maximum import sizes by MIME type, in bytes.
        # Corresponds to the JSON property `maxImportSizes`
        # @return [Hash<String,String>]
        attr_accessor :max_import_sizes
      
        # The maximum upload size in bytes.
        # Corresponds to the JSON property `maxUploadSize`
        # @return [String]
        attr_accessor :max_upload_size
      
        # The user's storage quota limits and usage. All fields are measured in bytes.
        # Corresponds to the JSON property `storageQuota`
        # @return [Google::Apis::DriveV3::About::StorageQuota]
        attr_accessor :storage_quota
      
        # Information about a Drive user.
        # Corresponds to the JSON property `user`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :user
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_installed = args[:app_installed] if args.key?(:app_installed)
          @export_formats = args[:export_formats] if args.key?(:export_formats)
          @folder_color_palette = args[:folder_color_palette] if args.key?(:folder_color_palette)
          @import_formats = args[:import_formats] if args.key?(:import_formats)
          @kind = args[:kind] if args.key?(:kind)
          @max_import_sizes = args[:max_import_sizes] if args.key?(:max_import_sizes)
          @max_upload_size = args[:max_upload_size] if args.key?(:max_upload_size)
          @storage_quota = args[:storage_quota] if args.key?(:storage_quota)
          @user = args[:user] if args.key?(:user)
        end
        
        # The user's storage quota limits and usage. All fields are measured in bytes.
        class StorageQuota
          include Google::Apis::Core::Hashable
        
          # The usage limit, if applicable. This will not be present if the user has
          # unlimited storage.
          # Corresponds to the JSON property `limit`
          # @return [String]
          attr_accessor :limit
        
          # The total usage across all services.
          # Corresponds to the JSON property `usage`
          # @return [String]
          attr_accessor :usage
        
          # The usage by all files in Google Drive.
          # Corresponds to the JSON property `usageInDrive`
          # @return [String]
          attr_accessor :usage_in_drive
        
          # The usage by trashed files in Google Drive.
          # Corresponds to the JSON property `usageInDriveTrash`
          # @return [String]
          attr_accessor :usage_in_drive_trash
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @limit = args[:limit] if args.key?(:limit)
            @usage = args[:usage] if args.key?(:usage)
            @usage_in_drive = args[:usage_in_drive] if args.key?(:usage_in_drive)
            @usage_in_drive_trash = args[:usage_in_drive_trash] if args.key?(:usage_in_drive_trash)
          end
        end
      end
      
      # A change to a file.
      class Change
        include Google::Apis::Core::Hashable
      
        # The metadata for a file.
        # Corresponds to the JSON property `file`
        # @return [Google::Apis::DriveV3::File]
        attr_accessor :file
      
        # The ID of the file which has changed.
        # Corresponds to the JSON property `fileId`
        # @return [String]
        attr_accessor :file_id
      
        # This is always drive#change.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Whether the file has been removed from the view of the changes list, for
        # example by deletion or lost access.
        # Corresponds to the JSON property `removed`
        # @return [Boolean]
        attr_accessor :removed
        alias_method :removed?, :removed
      
        # The time of this change (RFC 3339 date-time).
        # Corresponds to the JSON property `time`
        # @return [DateTime]
        attr_accessor :time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @file = args[:file] if args.key?(:file)
          @file_id = args[:file_id] if args.key?(:file_id)
          @kind = args[:kind] if args.key?(:kind)
          @removed = args[:removed] if args.key?(:removed)
          @time = args[:time] if args.key?(:time)
        end
      end
      
      # A list of changes for a user.
      class ChangeList
        include Google::Apis::Core::Hashable
      
        # The page of changes.
        # Corresponds to the JSON property `changes`
        # @return [Array<Google::Apis::DriveV3::Change>]
        attr_accessor :changes
      
        # This is always drive#changeList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The starting page token for future changes. This will be present only if the
        # end of the current changes list has been reached.
        # Corresponds to the JSON property `newStartPageToken`
        # @return [String]
        attr_accessor :new_start_page_token
      
        # The page token for the next page of changes. This will be absent if the end of
        # the current changes list has been reached.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @changes = args[:changes] if args.key?(:changes)
          @kind = args[:kind] if args.key?(:kind)
          @new_start_page_token = args[:new_start_page_token] if args.key?(:new_start_page_token)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # An notification channel used to watch for resource changes.
      class Channel
        include Google::Apis::Core::Hashable
      
        # The address where notifications are delivered for this channel.
        # Corresponds to the JSON property `address`
        # @return [String]
        attr_accessor :address
      
        # Date and time of notification channel expiration, expressed as a Unix
        # timestamp, in milliseconds. Optional.
        # Corresponds to the JSON property `expiration`
        # @return [String]
        attr_accessor :expiration
      
        # A UUID or similar unique string that identifies this channel.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Identifies this as a notification channel used to watch for changes to a
        # resource. Value: the fixed string "api#channel".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Additional parameters controlling delivery channel behavior. Optional.
        # Corresponds to the JSON property `params`
        # @return [Hash<String,String>]
        attr_accessor :params
      
        # A Boolean value to indicate whether payload is wanted. Optional.
        # Corresponds to the JSON property `payload`
        # @return [Boolean]
        attr_accessor :payload
        alias_method :payload?, :payload
      
        # An opaque ID that identifies the resource being watched on this channel.
        # Stable across different API versions.
        # Corresponds to the JSON property `resourceId`
        # @return [String]
        attr_accessor :resource_id
      
        # A version-specific identifier for the watched resource.
        # Corresponds to the JSON property `resourceUri`
        # @return [String]
        attr_accessor :resource_uri
      
        # An arbitrary string delivered to the target address with each notification
        # delivered over this channel. Optional.
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        # The type of delivery mechanism used for this channel.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @address = args[:address] if args.key?(:address)
          @expiration = args[:expiration] if args.key?(:expiration)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @params = args[:params] if args.key?(:params)
          @payload = args[:payload] if args.key?(:payload)
          @resource_id = args[:resource_id] if args.key?(:resource_id)
          @resource_uri = args[:resource_uri] if args.key?(:resource_uri)
          @token = args[:token] if args.key?(:token)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A comment on a file.
      class Comment
        include Google::Apis::Core::Hashable
      
        # A region of the document represented as a JSON string. See anchor
        # documentation for details on how to define and interpret anchor properties.
        # Corresponds to the JSON property `anchor`
        # @return [String]
        attr_accessor :anchor
      
        # Information about a Drive user.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :author
      
        # The plain text content of the comment. This field is used for setting the
        # content, while htmlContent should be displayed.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The time at which the comment was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # Whether the comment has been deleted. A deleted comment has no content.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # The content of the comment with HTML formatting.
        # Corresponds to the JSON property `htmlContent`
        # @return [String]
        attr_accessor :html_content
      
        # The ID of the comment.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # This is always drive#comment.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The last time the comment or any of its replies was modified (RFC 3339 date-
        # time).
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        # The file content to which the comment refers, typically within the anchor
        # region. For a text file, for example, this would be the text at the location
        # of the comment.
        # Corresponds to the JSON property `quotedFileContent`
        # @return [Google::Apis::DriveV3::Comment::QuotedFileContent]
        attr_accessor :quoted_file_content
      
        # The full list of replies to the comment in chronological order.
        # Corresponds to the JSON property `replies`
        # @return [Array<Google::Apis::DriveV3::Reply>]
        attr_accessor :replies
      
        # Whether the comment has been resolved by one of its replies.
        # Corresponds to the JSON property `resolved`
        # @return [Boolean]
        attr_accessor :resolved
        alias_method :resolved?, :resolved
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anchor = args[:anchor] if args.key?(:anchor)
          @author = args[:author] if args.key?(:author)
          @content = args[:content] if args.key?(:content)
          @created_time = args[:created_time] if args.key?(:created_time)
          @deleted = args[:deleted] if args.key?(:deleted)
          @html_content = args[:html_content] if args.key?(:html_content)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
          @quoted_file_content = args[:quoted_file_content] if args.key?(:quoted_file_content)
          @replies = args[:replies] if args.key?(:replies)
          @resolved = args[:resolved] if args.key?(:resolved)
        end
        
        # The file content to which the comment refers, typically within the anchor
        # region. For a text file, for example, this would be the text at the location
        # of the comment.
        class QuotedFileContent
          include Google::Apis::Core::Hashable
        
          # The MIME type of the quoted content.
          # Corresponds to the JSON property `mimeType`
          # @return [String]
          attr_accessor :mime_type
        
          # The quoted content itself. This is interpreted as plain text if set through
          # the API.
          # Corresponds to the JSON property `value`
          # @return [String]
          attr_accessor :value
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @mime_type = args[:mime_type] if args.key?(:mime_type)
            @value = args[:value] if args.key?(:value)
          end
        end
      end
      
      # A list of comments on a file.
      class CommentList
        include Google::Apis::Core::Hashable
      
        # The page of comments.
        # Corresponds to the JSON property `comments`
        # @return [Array<Google::Apis::DriveV3::Comment>]
        attr_accessor :comments
      
        # This is always drive#commentList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of comments. This will be absent if the end
        # of the comments list has been reached.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @comments = args[:comments] if args.key?(:comments)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The metadata for a file.
      class File
        include Google::Apis::Core::Hashable
      
        # A collection of arbitrary key-value pairs which are private to the requesting
        # app.
        # Entries with null values are cleared in update and copy requests.
        # Corresponds to the JSON property `appProperties`
        # @return [Hash<String,String>]
        attr_accessor :app_properties
      
        # Capabilities the current user has on the file.
        # Corresponds to the JSON property `capabilities`
        # @return [Google::Apis::DriveV3::File::Capabilities]
        attr_accessor :capabilities
      
        # Additional information about the content of the file. These fields are never
        # populated in responses.
        # Corresponds to the JSON property `contentHints`
        # @return [Google::Apis::DriveV3::File::ContentHints]
        attr_accessor :content_hints
      
        # The time at which the file was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # A short description of the file.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Whether the file has been explicitly trashed, as opposed to recursively
        # trashed from a parent folder.
        # Corresponds to the JSON property `explicitlyTrashed`
        # @return [Boolean]
        attr_accessor :explicitly_trashed
        alias_method :explicitly_trashed?, :explicitly_trashed
      
        # The final component of fullFileExtension. This is only available for files
        # with binary content in Drive.
        # Corresponds to the JSON property `fileExtension`
        # @return [String]
        attr_accessor :file_extension
      
        # The color for a folder as an RGB hex string. The supported colors are
        # published in the folderColorPalette field of the About resource.
        # If an unsupported color is specified, the closest color in the palette will be
        # used instead.
        # Corresponds to the JSON property `folderColorRgb`
        # @return [String]
        attr_accessor :folder_color_rgb
      
        # The full file extension extracted from the name field. May contain multiple
        # concatenated extensions, such as "tar.gz". This is only available for files
        # with binary content in Drive.
        # This is automatically updated when the name field changes, however it is not
        # cleared if the new name does not contain a valid extension.
        # Corresponds to the JSON property `fullFileExtension`
        # @return [String]
        attr_accessor :full_file_extension
      
        # The ID of the file's head revision. This is currently only available for files
        # with binary content in Drive.
        # Corresponds to the JSON property `headRevisionId`
        # @return [String]
        attr_accessor :head_revision_id
      
        # A static, unauthenticated link to the file's icon.
        # Corresponds to the JSON property `iconLink`
        # @return [String]
        attr_accessor :icon_link
      
        # The ID of the file.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Additional metadata about image media, if available.
        # Corresponds to the JSON property `imageMediaMetadata`
        # @return [Google::Apis::DriveV3::File::ImageMediaMetadata]
        attr_accessor :image_media_metadata
      
        # This is always drive#file.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Information about a Drive user.
        # Corresponds to the JSON property `lastModifyingUser`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :last_modifying_user
      
        # The MD5 checksum for the content of the file. This is only applicable to files
        # with binary content in Drive.
        # Corresponds to the JSON property `md5Checksum`
        # @return [String]
        attr_accessor :md5_checksum
      
        # The MIME type of the file.
        # Drive will attempt to automatically detect an appropriate value from uploaded
        # content if no value is provided. The value cannot be changed unless a new
        # revision is uploaded.
        # If a file is created with a Google Doc MIME type, the uploaded content will be
        # imported if possible. The supported import formats are published in the About
        # resource.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The last time the file was modified by the user (RFC 3339 date-time).
        # Corresponds to the JSON property `modifiedByMeTime`
        # @return [DateTime]
        attr_accessor :modified_by_me_time
      
        # The last time the file was modified by anyone (RFC 3339 date-time).
        # Note that setting modifiedTime will also update modifiedByMeTime for the user.
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        # The name of the file. This is not necessarily unique within a folder.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The original filename of the uploaded content if available, or else the
        # original value of the name field. This is only available for files with binary
        # content in Drive.
        # Corresponds to the JSON property `originalFilename`
        # @return [String]
        attr_accessor :original_filename
      
        # Whether the user owns the file.
        # Corresponds to the JSON property `ownedByMe`
        # @return [Boolean]
        attr_accessor :owned_by_me
        alias_method :owned_by_me?, :owned_by_me
      
        # The owners of the file. Currently, only certain legacy files may have more
        # than one owner.
        # Corresponds to the JSON property `owners`
        # @return [Array<Google::Apis::DriveV3::User>]
        attr_accessor :owners
      
        # The IDs of the parent folders which contain the file.
        # If not specified as part of a create request, the file will be placed directly
        # in the My Drive folder. Update requests must use the addParents and
        # removeParents parameters to modify the values.
        # Corresponds to the JSON property `parents`
        # @return [Array<String>]
        attr_accessor :parents
      
        # The full list of permissions for the file. This is only available if the
        # requesting user can share the file.
        # Corresponds to the JSON property `permissions`
        # @return [Array<Google::Apis::DriveV3::Permission>]
        attr_accessor :permissions
      
        # A collection of arbitrary key-value pairs which are visible to all apps.
        # Entries with null values are cleared in update and copy requests.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The number of storage quota bytes used by the file. This includes the head
        # revision as well as previous revisions with keepForever enabled.
        # Corresponds to the JSON property `quotaBytesUsed`
        # @return [String]
        attr_accessor :quota_bytes_used
      
        # Whether the file has been shared.
        # Corresponds to the JSON property `shared`
        # @return [Boolean]
        attr_accessor :shared
        alias_method :shared?, :shared
      
        # The time at which the file was shared with the user, if applicable (RFC 3339
        # date-time).
        # Corresponds to the JSON property `sharedWithMeTime`
        # @return [DateTime]
        attr_accessor :shared_with_me_time
      
        # Information about a Drive user.
        # Corresponds to the JSON property `sharingUser`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :sharing_user
      
        # The size of the file's content in bytes. This is only applicable to files with
        # binary content in Drive.
        # Corresponds to the JSON property `size`
        # @return [String]
        attr_accessor :size
      
        # The list of spaces which contain the file. The currently supported values are '
        # drive', 'appDataFolder' and 'photos'.
        # Corresponds to the JSON property `spaces`
        # @return [Array<String>]
        attr_accessor :spaces
      
        # Whether the user has starred the file.
        # Corresponds to the JSON property `starred`
        # @return [Boolean]
        attr_accessor :starred
        alias_method :starred?, :starred
      
        # A short-lived link to the file's thumbnail, if available. Typically lasts on
        # the order of hours.
        # Corresponds to the JSON property `thumbnailLink`
        # @return [String]
        attr_accessor :thumbnail_link
      
        # Whether the file has been trashed, either explicitly or from a trashed parent
        # folder. Only the owner may trash a file, and other users cannot see files in
        # the owner's trash.
        # Corresponds to the JSON property `trashed`
        # @return [Boolean]
        attr_accessor :trashed
        alias_method :trashed?, :trashed
      
        # A monotonically increasing version number for the file. This reflects every
        # change made to the file on the server, even those not visible to the user.
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        # Additional metadata about video media. This may not be available immediately
        # upon upload.
        # Corresponds to the JSON property `videoMediaMetadata`
        # @return [Google::Apis::DriveV3::File::VideoMediaMetadata]
        attr_accessor :video_media_metadata
      
        # Whether the file has been viewed by this user.
        # Corresponds to the JSON property `viewedByMe`
        # @return [Boolean]
        attr_accessor :viewed_by_me
        alias_method :viewed_by_me?, :viewed_by_me
      
        # The last time the file was viewed by the user (RFC 3339 date-time).
        # Corresponds to the JSON property `viewedByMeTime`
        # @return [DateTime]
        attr_accessor :viewed_by_me_time
      
        # Whether users with only reader or commenter permission can copy the file's
        # content. This affects copy, download, and print operations.
        # Corresponds to the JSON property `viewersCanCopyContent`
        # @return [Boolean]
        attr_accessor :viewers_can_copy_content
        alias_method :viewers_can_copy_content?, :viewers_can_copy_content
      
        # A link for downloading the content of the file in a browser. This is only
        # available for files with binary content in Drive.
        # Corresponds to the JSON property `webContentLink`
        # @return [String]
        attr_accessor :web_content_link
      
        # A link for opening the file in a relevant Google editor or viewer in a browser.
        # Corresponds to the JSON property `webViewLink`
        # @return [String]
        attr_accessor :web_view_link
      
        # Whether users with only writer permission can modify the file's permissions.
        # Corresponds to the JSON property `writersCanShare`
        # @return [Boolean]
        attr_accessor :writers_can_share
        alias_method :writers_can_share?, :writers_can_share
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_properties = args[:app_properties] if args.key?(:app_properties)
          @capabilities = args[:capabilities] if args.key?(:capabilities)
          @content_hints = args[:content_hints] if args.key?(:content_hints)
          @created_time = args[:created_time] if args.key?(:created_time)
          @description = args[:description] if args.key?(:description)
          @explicitly_trashed = args[:explicitly_trashed] if args.key?(:explicitly_trashed)
          @file_extension = args[:file_extension] if args.key?(:file_extension)
          @folder_color_rgb = args[:folder_color_rgb] if args.key?(:folder_color_rgb)
          @full_file_extension = args[:full_file_extension] if args.key?(:full_file_extension)
          @head_revision_id = args[:head_revision_id] if args.key?(:head_revision_id)
          @icon_link = args[:icon_link] if args.key?(:icon_link)
          @id = args[:id] if args.key?(:id)
          @image_media_metadata = args[:image_media_metadata] if args.key?(:image_media_metadata)
          @kind = args[:kind] if args.key?(:kind)
          @last_modifying_user = args[:last_modifying_user] if args.key?(:last_modifying_user)
          @md5_checksum = args[:md5_checksum] if args.key?(:md5_checksum)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @modified_by_me_time = args[:modified_by_me_time] if args.key?(:modified_by_me_time)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
          @name = args[:name] if args.key?(:name)
          @original_filename = args[:original_filename] if args.key?(:original_filename)
          @owned_by_me = args[:owned_by_me] if args.key?(:owned_by_me)
          @owners = args[:owners] if args.key?(:owners)
          @parents = args[:parents] if args.key?(:parents)
          @permissions = args[:permissions] if args.key?(:permissions)
          @properties = args[:properties] if args.key?(:properties)
          @quota_bytes_used = args[:quota_bytes_used] if args.key?(:quota_bytes_used)
          @shared = args[:shared] if args.key?(:shared)
          @shared_with_me_time = args[:shared_with_me_time] if args.key?(:shared_with_me_time)
          @sharing_user = args[:sharing_user] if args.key?(:sharing_user)
          @size = args[:size] if args.key?(:size)
          @spaces = args[:spaces] if args.key?(:spaces)
          @starred = args[:starred] if args.key?(:starred)
          @thumbnail_link = args[:thumbnail_link] if args.key?(:thumbnail_link)
          @trashed = args[:trashed] if args.key?(:trashed)
          @version = args[:version] if args.key?(:version)
          @video_media_metadata = args[:video_media_metadata] if args.key?(:video_media_metadata)
          @viewed_by_me = args[:viewed_by_me] if args.key?(:viewed_by_me)
          @viewed_by_me_time = args[:viewed_by_me_time] if args.key?(:viewed_by_me_time)
          @viewers_can_copy_content = args[:viewers_can_copy_content] if args.key?(:viewers_can_copy_content)
          @web_content_link = args[:web_content_link] if args.key?(:web_content_link)
          @web_view_link = args[:web_view_link] if args.key?(:web_view_link)
          @writers_can_share = args[:writers_can_share] if args.key?(:writers_can_share)
        end
        
        # Capabilities the current user has on the file.
        class Capabilities
          include Google::Apis::Core::Hashable
        
          # Whether the user can comment on the file.
          # Corresponds to the JSON property `canComment`
          # @return [Boolean]
          attr_accessor :can_comment
          alias_method :can_comment?, :can_comment
        
          # Whether the user can copy the file.
          # Corresponds to the JSON property `canCopy`
          # @return [Boolean]
          attr_accessor :can_copy
          alias_method :can_copy?, :can_copy
        
          # Whether the user can edit the file's content.
          # Corresponds to the JSON property `canEdit`
          # @return [Boolean]
          attr_accessor :can_edit
          alias_method :can_edit?, :can_edit
        
          # Whether the current user has read access to the Revisions resource of the file.
          # Corresponds to the JSON property `canReadRevisions`
          # @return [Boolean]
          attr_accessor :can_read_revisions
          alias_method :can_read_revisions?, :can_read_revisions
        
          # Whether the user can modify the file's permissions and sharing settings.
          # Corresponds to the JSON property `canShare`
          # @return [Boolean]
          attr_accessor :can_share
          alias_method :can_share?, :can_share
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @can_comment = args[:can_comment] if args.key?(:can_comment)
            @can_copy = args[:can_copy] if args.key?(:can_copy)
            @can_edit = args[:can_edit] if args.key?(:can_edit)
            @can_read_revisions = args[:can_read_revisions] if args.key?(:can_read_revisions)
            @can_share = args[:can_share] if args.key?(:can_share)
          end
        end
        
        # Additional information about the content of the file. These fields are never
        # populated in responses.
        class ContentHints
          include Google::Apis::Core::Hashable
        
          # Text to be indexed for the file to improve fullText queries. This is limited
          # to 128KB in length and may contain HTML elements.
          # Corresponds to the JSON property `indexableText`
          # @return [String]
          attr_accessor :indexable_text
        
          # A thumbnail for the file. This will only be used if Drive cannot generate a
          # standard thumbnail.
          # Corresponds to the JSON property `thumbnail`
          # @return [Google::Apis::DriveV3::File::ContentHints::Thumbnail]
          attr_accessor :thumbnail
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @indexable_text = args[:indexable_text] if args.key?(:indexable_text)
            @thumbnail = args[:thumbnail] if args.key?(:thumbnail)
          end
          
          # A thumbnail for the file. This will only be used if Drive cannot generate a
          # standard thumbnail.
          class Thumbnail
            include Google::Apis::Core::Hashable
          
            # The thumbnail data encoded with URL-safe Base64 (RFC 4648 section 5).
            # Corresponds to the JSON property `image`
            # @return [String]
            attr_accessor :image
          
            # The MIME type of the thumbnail.
            # Corresponds to the JSON property `mimeType`
            # @return [String]
            attr_accessor :mime_type
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @image = args[:image] if args.key?(:image)
              @mime_type = args[:mime_type] if args.key?(:mime_type)
            end
          end
        end
        
        # Additional metadata about image media, if available.
        class ImageMediaMetadata
          include Google::Apis::Core::Hashable
        
          # The aperture used to create the photo (f-number).
          # Corresponds to the JSON property `aperture`
          # @return [Float]
          attr_accessor :aperture
        
          # The make of the camera used to create the photo.
          # Corresponds to the JSON property `cameraMake`
          # @return [String]
          attr_accessor :camera_make
        
          # The model of the camera used to create the photo.
          # Corresponds to the JSON property `cameraModel`
          # @return [String]
          attr_accessor :camera_model
        
          # The color space of the photo.
          # Corresponds to the JSON property `colorSpace`
          # @return [String]
          attr_accessor :color_space
        
          # The exposure bias of the photo (APEX value).
          # Corresponds to the JSON property `exposureBias`
          # @return [Float]
          attr_accessor :exposure_bias
        
          # The exposure mode used to create the photo.
          # Corresponds to the JSON property `exposureMode`
          # @return [String]
          attr_accessor :exposure_mode
        
          # The length of the exposure, in seconds.
          # Corresponds to the JSON property `exposureTime`
          # @return [Float]
          attr_accessor :exposure_time
        
          # Whether a flash was used to create the photo.
          # Corresponds to the JSON property `flashUsed`
          # @return [Boolean]
          attr_accessor :flash_used
          alias_method :flash_used?, :flash_used
        
          # The focal length used to create the photo, in millimeters.
          # Corresponds to the JSON property `focalLength`
          # @return [Float]
          attr_accessor :focal_length
        
          # The height of the image in pixels.
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # The ISO speed used to create the photo.
          # Corresponds to the JSON property `isoSpeed`
          # @return [Fixnum]
          attr_accessor :iso_speed
        
          # The lens used to create the photo.
          # Corresponds to the JSON property `lens`
          # @return [String]
          attr_accessor :lens
        
          # Geographic location information stored in the image.
          # Corresponds to the JSON property `location`
          # @return [Google::Apis::DriveV3::File::ImageMediaMetadata::Location]
          attr_accessor :location
        
          # The smallest f-number of the lens at the focal length used to create the photo
          # (APEX value).
          # Corresponds to the JSON property `maxApertureValue`
          # @return [Float]
          attr_accessor :max_aperture_value
        
          # The metering mode used to create the photo.
          # Corresponds to the JSON property `meteringMode`
          # @return [String]
          attr_accessor :metering_mode
        
          # The rotation in clockwise degrees from the image's original orientation.
          # Corresponds to the JSON property `rotation`
          # @return [Fixnum]
          attr_accessor :rotation
        
          # The type of sensor used to create the photo.
          # Corresponds to the JSON property `sensor`
          # @return [String]
          attr_accessor :sensor
        
          # The distance to the subject of the photo, in meters.
          # Corresponds to the JSON property `subjectDistance`
          # @return [Fixnum]
          attr_accessor :subject_distance
        
          # The date and time the photo was taken (EXIF DateTime).
          # Corresponds to the JSON property `time`
          # @return [String]
          attr_accessor :time
        
          # The white balance mode used to create the photo.
          # Corresponds to the JSON property `whiteBalance`
          # @return [String]
          attr_accessor :white_balance
        
          # The width of the image in pixels.
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @aperture = args[:aperture] if args.key?(:aperture)
            @camera_make = args[:camera_make] if args.key?(:camera_make)
            @camera_model = args[:camera_model] if args.key?(:camera_model)
            @color_space = args[:color_space] if args.key?(:color_space)
            @exposure_bias = args[:exposure_bias] if args.key?(:exposure_bias)
            @exposure_mode = args[:exposure_mode] if args.key?(:exposure_mode)
            @exposure_time = args[:exposure_time] if args.key?(:exposure_time)
            @flash_used = args[:flash_used] if args.key?(:flash_used)
            @focal_length = args[:focal_length] if args.key?(:focal_length)
            @height = args[:height] if args.key?(:height)
            @iso_speed = args[:iso_speed] if args.key?(:iso_speed)
            @lens = args[:lens] if args.key?(:lens)
            @location = args[:location] if args.key?(:location)
            @max_aperture_value = args[:max_aperture_value] if args.key?(:max_aperture_value)
            @metering_mode = args[:metering_mode] if args.key?(:metering_mode)
            @rotation = args[:rotation] if args.key?(:rotation)
            @sensor = args[:sensor] if args.key?(:sensor)
            @subject_distance = args[:subject_distance] if args.key?(:subject_distance)
            @time = args[:time] if args.key?(:time)
            @white_balance = args[:white_balance] if args.key?(:white_balance)
            @width = args[:width] if args.key?(:width)
          end
          
          # Geographic location information stored in the image.
          class Location
            include Google::Apis::Core::Hashable
          
            # The altitude stored in the image.
            # Corresponds to the JSON property `altitude`
            # @return [Float]
            attr_accessor :altitude
          
            # The latitude stored in the image.
            # Corresponds to the JSON property `latitude`
            # @return [Float]
            attr_accessor :latitude
          
            # The longitude stored in the image.
            # Corresponds to the JSON property `longitude`
            # @return [Float]
            attr_accessor :longitude
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @altitude = args[:altitude] if args.key?(:altitude)
              @latitude = args[:latitude] if args.key?(:latitude)
              @longitude = args[:longitude] if args.key?(:longitude)
            end
          end
        end
        
        # Additional metadata about video media. This may not be available immediately
        # upon upload.
        class VideoMediaMetadata
          include Google::Apis::Core::Hashable
        
          # The duration of the video in milliseconds.
          # Corresponds to the JSON property `durationMillis`
          # @return [String]
          attr_accessor :duration_millis
        
          # The height of the video in pixels.
          # Corresponds to the JSON property `height`
          # @return [Fixnum]
          attr_accessor :height
        
          # The width of the video in pixels.
          # Corresponds to the JSON property `width`
          # @return [Fixnum]
          attr_accessor :width
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @duration_millis = args[:duration_millis] if args.key?(:duration_millis)
            @height = args[:height] if args.key?(:height)
            @width = args[:width] if args.key?(:width)
          end
        end
      end
      
      # A list of files.
      class FileList
        include Google::Apis::Core::Hashable
      
        # The page of files.
        # Corresponds to the JSON property `files`
        # @return [Array<Google::Apis::DriveV3::File>]
        attr_accessor :files
      
        # This is always drive#fileList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of files. This will be absent if the end of
        # the files list has been reached.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @files = args[:files] if args.key?(:files)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A list of generated file IDs which can be provided in create requests.
      class GeneratedIds
        include Google::Apis::Core::Hashable
      
        # The IDs generated for the requesting user in the specified space.
        # Corresponds to the JSON property `ids`
        # @return [Array<String>]
        attr_accessor :ids
      
        # This is always drive#generatedIds
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The type of file that can be created with these IDs.
        # Corresponds to the JSON property `space`
        # @return [String]
        attr_accessor :space
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ids = args[:ids] if args.key?(:ids)
          @kind = args[:kind] if args.key?(:kind)
          @space = args[:space] if args.key?(:space)
        end
      end
      
      # A permission for a file. A permission grants a user, group, domain or the
      # world access to a file or a folder hierarchy.
      class Permission
        include Google::Apis::Core::Hashable
      
        # Whether the permission allows the file to be discovered through search. This
        # is only applicable for permissions of type domain or anyone.
        # Corresponds to the JSON property `allowFileDiscovery`
        # @return [Boolean]
        attr_accessor :allow_file_discovery
        alias_method :allow_file_discovery?, :allow_file_discovery
      
        # A displayable name for users, groups or domains.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The domain to which this permission refers.
        # Corresponds to the JSON property `domain`
        # @return [String]
        attr_accessor :domain
      
        # The email address of the user or group to which this permission refers.
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # The ID of this permission. This is a unique identifier for the grantee, and is
        # published in User resources as permissionId.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # This is always drive#permission.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # A link to the user's profile photo, if available.
        # Corresponds to the JSON property `photoLink`
        # @return [String]
        attr_accessor :photo_link
      
        # The role granted by this permission. Valid values are:
        # - owner
        # - writer
        # - commenter
        # - reader
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        # The type of the grantee. Valid values are:
        # - user
        # - group
        # - domain
        # - anyone
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @allow_file_discovery = args[:allow_file_discovery] if args.key?(:allow_file_discovery)
          @display_name = args[:display_name] if args.key?(:display_name)
          @domain = args[:domain] if args.key?(:domain)
          @email_address = args[:email_address] if args.key?(:email_address)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @photo_link = args[:photo_link] if args.key?(:photo_link)
          @role = args[:role] if args.key?(:role)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # A list of permissions for a file.
      class PermissionList
        include Google::Apis::Core::Hashable
      
        # This is always drive#permissionList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The full list of permissions.
        # Corresponds to the JSON property `permissions`
        # @return [Array<Google::Apis::DriveV3::Permission>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # A reply to a comment on a file.
      class Reply
        include Google::Apis::Core::Hashable
      
        # The action the reply performed to the parent comment. Valid values are:
        # - resolve
        # - reopen
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Information about a Drive user.
        # Corresponds to the JSON property `author`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :author
      
        # The plain text content of the reply. This field is used for setting the
        # content, while htmlContent should be displayed. This is required on creates if
        # no action is specified.
        # Corresponds to the JSON property `content`
        # @return [String]
        attr_accessor :content
      
        # The time at which the reply was created (RFC 3339 date-time).
        # Corresponds to the JSON property `createdTime`
        # @return [DateTime]
        attr_accessor :created_time
      
        # Whether the reply has been deleted. A deleted reply has no content.
        # Corresponds to the JSON property `deleted`
        # @return [Boolean]
        attr_accessor :deleted
        alias_method :deleted?, :deleted
      
        # The content of the reply with HTML formatting.
        # Corresponds to the JSON property `htmlContent`
        # @return [String]
        attr_accessor :html_content
      
        # The ID of the reply.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # This is always drive#reply.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The last time the reply was modified (RFC 3339 date-time).
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @author = args[:author] if args.key?(:author)
          @content = args[:content] if args.key?(:content)
          @created_time = args[:created_time] if args.key?(:created_time)
          @deleted = args[:deleted] if args.key?(:deleted)
          @html_content = args[:html_content] if args.key?(:html_content)
          @id = args[:id] if args.key?(:id)
          @kind = args[:kind] if args.key?(:kind)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
        end
      end
      
      # A list of replies to a comment on a file.
      class ReplyList
        include Google::Apis::Core::Hashable
      
        # This is always drive#replyList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The page token for the next page of replies. This will be absent if the end of
        # the replies list has been reached.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The page of replies.
        # Corresponds to the JSON property `replies`
        # @return [Array<Google::Apis::DriveV3::Reply>]
        attr_accessor :replies
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @replies = args[:replies] if args.key?(:replies)
        end
      end
      
      # The metadata for a revision to a file.
      class Revision
        include Google::Apis::Core::Hashable
      
        # The ID of the revision.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Whether to keep this revision forever, even if it is no longer the head
        # revision. If not set, the revision will be automatically purged 30 days after
        # newer content is uploaded. This can be set on a maximum of 200 revisions for a
        # file.
        # This field is only applicable to files with binary content in Drive.
        # Corresponds to the JSON property `keepForever`
        # @return [Boolean]
        attr_accessor :keep_forever
        alias_method :keep_forever?, :keep_forever
      
        # This is always drive#revision.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Information about a Drive user.
        # Corresponds to the JSON property `lastModifyingUser`
        # @return [Google::Apis::DriveV3::User]
        attr_accessor :last_modifying_user
      
        # The MD5 checksum of the revision's content. This is only applicable to files
        # with binary content in Drive.
        # Corresponds to the JSON property `md5Checksum`
        # @return [String]
        attr_accessor :md5_checksum
      
        # The MIME type of the revision.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # The last time the revision was modified (RFC 3339 date-time).
        # Corresponds to the JSON property `modifiedTime`
        # @return [DateTime]
        attr_accessor :modified_time
      
        # The original filename used to create this revision. This is only applicable to
        # files with binary content in Drive.
        # Corresponds to the JSON property `originalFilename`
        # @return [String]
        attr_accessor :original_filename
      
        # Whether subsequent revisions will be automatically republished. This is only
        # applicable to Google Docs.
        # Corresponds to the JSON property `publishAuto`
        # @return [Boolean]
        attr_accessor :publish_auto
        alias_method :publish_auto?, :publish_auto
      
        # Whether this revision is published. This is only applicable to Google Docs.
        # Corresponds to the JSON property `published`
        # @return [Boolean]
        attr_accessor :published
        alias_method :published?, :published
      
        # Whether this revision is published outside the domain. This is only applicable
        # to Google Docs.
        # Corresponds to the JSON property `publishedOutsideDomain`
        # @return [Boolean]
        attr_accessor :published_outside_domain
        alias_method :published_outside_domain?, :published_outside_domain
      
        # The size of the revision's content in bytes. This is only applicable to files
        # with binary content in Drive.
        # Corresponds to the JSON property `size`
        # @return [String]
        attr_accessor :size
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @keep_forever = args[:keep_forever] if args.key?(:keep_forever)
          @kind = args[:kind] if args.key?(:kind)
          @last_modifying_user = args[:last_modifying_user] if args.key?(:last_modifying_user)
          @md5_checksum = args[:md5_checksum] if args.key?(:md5_checksum)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @modified_time = args[:modified_time] if args.key?(:modified_time)
          @original_filename = args[:original_filename] if args.key?(:original_filename)
          @publish_auto = args[:publish_auto] if args.key?(:publish_auto)
          @published = args[:published] if args.key?(:published)
          @published_outside_domain = args[:published_outside_domain] if args.key?(:published_outside_domain)
          @size = args[:size] if args.key?(:size)
        end
      end
      
      # A list of revisions of a file.
      class RevisionList
        include Google::Apis::Core::Hashable
      
        # This is always drive#revisionList.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The full list of revisions.
        # Corresponds to the JSON property `revisions`
        # @return [Array<Google::Apis::DriveV3::Revision>]
        attr_accessor :revisions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @revisions = args[:revisions] if args.key?(:revisions)
        end
      end
      
      # 
      class StartPageToken
        include Google::Apis::Core::Hashable
      
        # This is always drive#startPageToken.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The starting page token for listing changes.
        # Corresponds to the JSON property `startPageToken`
        # @return [String]
        attr_accessor :start_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @start_page_token = args[:start_page_token] if args.key?(:start_page_token)
        end
      end
      
      # Information about a Drive user.
      class User
        include Google::Apis::Core::Hashable
      
        # A plain text displayable name for this user.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # The email address of the user. This may not be present in certain contexts if
        # the user has not made their email address visible to the requester.
        # Corresponds to the JSON property `emailAddress`
        # @return [String]
        attr_accessor :email_address
      
        # This is always drive#user.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Whether this user is the requesting user.
        # Corresponds to the JSON property `me`
        # @return [Boolean]
        attr_accessor :me
        alias_method :me?, :me
      
        # The user's ID as visible in Permission resources.
        # Corresponds to the JSON property `permissionId`
        # @return [String]
        attr_accessor :permission_id
      
        # A link to the user's profile photo, if available.
        # Corresponds to the JSON property `photoLink`
        # @return [String]
        attr_accessor :photo_link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @email_address = args[:email_address] if args.key?(:email_address)
          @kind = args[:kind] if args.key?(:kind)
          @me = args[:me] if args.key?(:me)
          @permission_id = args[:permission_id] if args.key?(:permission_id)
          @photo_link = args[:photo_link] if args.key?(:photo_link)
        end
      end
    end
  end
end
