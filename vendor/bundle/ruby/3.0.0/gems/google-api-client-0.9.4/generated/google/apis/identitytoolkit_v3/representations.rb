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
    module IdentitytoolkitV3
      
      class CreateAuthUriResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteAccountResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DownloadAccountResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EmailTemplate
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetAccountInfoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetOobConfirmationCodeResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetRecaptchaParamResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateAuthUriRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DeleteAccountRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DownloadAccountRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetAccountInfoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class GetProjectConfigResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResetPasswordRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetAccountInfoRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetProjectConfigRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdentitytoolkitRelyingpartySetProjectConfigResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SignOutUserRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SignOutUserResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SignupNewUserRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UploadAccountRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyAssertionRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyCustomTokenRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyPasswordRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class IdpConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Relyingparty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ResetPasswordResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SetAccountInfoResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ProviderUserInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SignupNewUserResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UploadAccountResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Error
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UserInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class ProviderUserInfo
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyAssertionResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyCustomTokenResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VerifyPasswordResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CreateAuthUriResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :all_providers, as: 'allProviders'
          property :auth_uri, as: 'authUri'
          property :captcha_required, as: 'captchaRequired'
          property :for_existing_provider, as: 'forExistingProvider'
          property :kind, as: 'kind'
          property :provider_id, as: 'providerId'
          property :registered, as: 'registered'
          property :session_id, as: 'sessionId'
        end
      end
      
      class DeleteAccountResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
        end
      end
      
      class DownloadAccountResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          collection :users, as: 'users', class: Google::Apis::IdentitytoolkitV3::UserInfo, decorator: Google::Apis::IdentitytoolkitV3::UserInfo::Representation
      
        end
      end
      
      class EmailTemplate
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :body, as: 'body'
          property :format, as: 'format'
          property :from, as: 'from'
          property :from_display_name, as: 'fromDisplayName'
          property :reply_to, as: 'replyTo'
          property :subject, as: 'subject'
        end
      end
      
      class GetAccountInfoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          collection :users, as: 'users', class: Google::Apis::IdentitytoolkitV3::UserInfo, decorator: Google::Apis::IdentitytoolkitV3::UserInfo::Representation
      
        end
      end
      
      class GetOobConfirmationCodeResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :kind, as: 'kind'
          property :oob_code, as: 'oobCode'
        end
      end
      
      class GetRecaptchaParamResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :recaptcha_site_key, as: 'recaptchaSiteKey'
          property :recaptcha_stoken, as: 'recaptchaStoken'
        end
      end
      
      class CreateAuthUriRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :app_id, as: 'appId'
          property :client_id, as: 'clientId'
          property :context, as: 'context'
          property :continue_uri, as: 'continueUri'
          property :identifier, as: 'identifier'
          property :oauth_consumer_key, as: 'oauthConsumerKey'
          property :oauth_scope, as: 'oauthScope'
          property :openid_realm, as: 'openidRealm'
          property :ota_app, as: 'otaApp'
          property :provider_id, as: 'providerId'
        end
      end
      
      class DeleteAccountRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delegated_project_number, as: 'delegatedProjectNumber'
          property :id_token, as: 'idToken'
          property :local_id, as: 'localId'
        end
      end
      
      class DownloadAccountRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delegated_project_number, as: 'delegatedProjectNumber'
          property :max_results, as: 'maxResults'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class GetAccountInfoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delegated_project_number, as: 'delegatedProjectNumber'
          collection :email, as: 'email'
          property :id_token, as: 'idToken'
          collection :local_id, as: 'localId'
        end
      end
      
      class GetProjectConfigResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_password_user, as: 'allowPasswordUser'
          property :api_key, as: 'apiKey'
          collection :authorized_domains, as: 'authorizedDomains'
          property :change_email_template, as: 'changeEmailTemplate', class: Google::Apis::IdentitytoolkitV3::EmailTemplate, decorator: Google::Apis::IdentitytoolkitV3::EmailTemplate::Representation
      
          collection :idp_config, as: 'idpConfig', class: Google::Apis::IdentitytoolkitV3::IdpConfig, decorator: Google::Apis::IdentitytoolkitV3::IdpConfig::Representation
      
          property :project_id, as: 'projectId'
          property :reset_password_template, as: 'resetPasswordTemplate', class: Google::Apis::IdentitytoolkitV3::EmailTemplate, decorator: Google::Apis::IdentitytoolkitV3::EmailTemplate::Representation
      
          property :use_email_sending, as: 'useEmailSending'
          property :verify_email_template, as: 'verifyEmailTemplate', class: Google::Apis::IdentitytoolkitV3::EmailTemplate, decorator: Google::Apis::IdentitytoolkitV3::EmailTemplate::Representation
      
        end
      end
      
      class ResetPasswordRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :new_password, as: 'newPassword'
          property :old_password, as: 'oldPassword'
          property :oob_code, as: 'oobCode'
        end
      end
      
      class SetAccountInfoRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :captcha_challenge, as: 'captchaChallenge'
          property :captcha_response, as: 'captchaResponse'
          property :delegated_project_number, as: 'delegatedProjectNumber'
          collection :delete_attribute, as: 'deleteAttribute'
          collection :delete_provider, as: 'deleteProvider'
          property :disable_user, as: 'disableUser'
          property :display_name, as: 'displayName'
          property :email, as: 'email'
          property :email_verified, as: 'emailVerified'
          property :id_token, as: 'idToken'
          property :instance_id, as: 'instanceId'
          property :local_id, as: 'localId'
          property :oob_code, as: 'oobCode'
          property :password, as: 'password'
          property :photo_url, as: 'photoUrl'
          collection :provider, as: 'provider'
          property :return_secure_token, as: 'returnSecureToken'
          property :upgrade_to_federated_login, as: 'upgradeToFederatedLogin'
          property :valid_since, as: 'validSince'
        end
      end
      
      class SetProjectConfigRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_password_user, as: 'allowPasswordUser'
          property :api_key, as: 'apiKey'
          property :change_email_template, as: 'changeEmailTemplate', class: Google::Apis::IdentitytoolkitV3::EmailTemplate, decorator: Google::Apis::IdentitytoolkitV3::EmailTemplate::Representation
      
          property :delegated_project_number, as: 'delegatedProjectNumber'
          collection :idp_config, as: 'idpConfig', class: Google::Apis::IdentitytoolkitV3::IdpConfig, decorator: Google::Apis::IdentitytoolkitV3::IdpConfig::Representation
      
          property :reset_password_template, as: 'resetPasswordTemplate', class: Google::Apis::IdentitytoolkitV3::EmailTemplate, decorator: Google::Apis::IdentitytoolkitV3::EmailTemplate::Representation
      
          property :use_email_sending, as: 'useEmailSending'
          property :verify_email_template, as: 'verifyEmailTemplate', class: Google::Apis::IdentitytoolkitV3::EmailTemplate, decorator: Google::Apis::IdentitytoolkitV3::EmailTemplate::Representation
      
        end
      end
      
      class IdentitytoolkitRelyingpartySetProjectConfigResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :project_id, as: 'projectId'
        end
      end
      
      class SignOutUserRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_id, as: 'instanceId'
          property :local_id, as: 'localId'
        end
      end
      
      class SignOutUserResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :local_id, as: 'localId'
        end
      end
      
      class SignupNewUserRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :captcha_challenge, as: 'captchaChallenge'
          property :captcha_response, as: 'captchaResponse'
          property :display_name, as: 'displayName'
          property :email, as: 'email'
          property :id_token, as: 'idToken'
          property :instance_id, as: 'instanceId'
          property :password, as: 'password'
          property :return_secure_token, as: 'returnSecureToken'
        end
      end
      
      class UploadAccountRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delegated_project_number, as: 'delegatedProjectNumber'
          property :hash_algorithm, as: 'hashAlgorithm'
          property :memory_cost, as: 'memoryCost'
          property :rounds, as: 'rounds'
          property :salt_separator, :base64 => true, as: 'saltSeparator'
          property :signer_key, :base64 => true, as: 'signerKey'
          collection :users, as: 'users', class: Google::Apis::IdentitytoolkitV3::UserInfo, decorator: Google::Apis::IdentitytoolkitV3::UserInfo::Representation
      
        end
      end
      
      class VerifyAssertionRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :delegated_project_number, as: 'delegatedProjectNumber'
          property :id_token, as: 'idToken'
          property :instance_id, as: 'instanceId'
          property :pending_id_token, as: 'pendingIdToken'
          property :post_body, as: 'postBody'
          property :request_uri, as: 'requestUri'
          property :return_refresh_token, as: 'returnRefreshToken'
          property :return_secure_token, as: 'returnSecureToken'
          property :session_id, as: 'sessionId'
        end
      end
      
      class VerifyCustomTokenRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :instance_id, as: 'instanceId'
          property :return_secure_token, as: 'returnSecureToken'
          property :token, as: 'token'
        end
      end
      
      class VerifyPasswordRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :captcha_challenge, as: 'captchaChallenge'
          property :captcha_response, as: 'captchaResponse'
          property :delegated_project_number, as: 'delegatedProjectNumber'
          property :email, as: 'email'
          property :id_token, as: 'idToken'
          property :instance_id, as: 'instanceId'
          property :password, as: 'password'
          property :pending_id_token, as: 'pendingIdToken'
          property :return_secure_token, as: 'returnSecureToken'
        end
      end
      
      class IdpConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :client_id, as: 'clientId'
          property :enabled, as: 'enabled'
          property :experiment_percent, as: 'experimentPercent'
          property :provider, as: 'provider'
        end
      end
      
      class Relyingparty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :captcha_resp, as: 'captchaResp'
          property :challenge, as: 'challenge'
          property :email, as: 'email'
          property :id_token, as: 'idToken'
          property :kind, as: 'kind'
          property :new_email, as: 'newEmail'
          property :request_type, as: 'requestType'
          property :user_ip, as: 'userIp'
        end
      end
      
      class ResetPasswordResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :email, as: 'email'
          property :kind, as: 'kind'
        end
      end
      
      class SetAccountInfoResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :email, as: 'email'
          property :expires_in, as: 'expiresIn'
          property :id_token, as: 'idToken'
          property :kind, as: 'kind'
          property :new_email, as: 'newEmail'
          property :photo_url, as: 'photoUrl'
          collection :provider_user_info, as: 'providerUserInfo', class: Google::Apis::IdentitytoolkitV3::SetAccountInfoResponse::ProviderUserInfo, decorator: Google::Apis::IdentitytoolkitV3::SetAccountInfoResponse::ProviderUserInfo::Representation
      
          property :refresh_token, as: 'refreshToken'
        end
        
        class ProviderUserInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :photo_url, as: 'photoUrl'
            property :provider_id, as: 'providerId'
          end
        end
      end
      
      class SignupNewUserResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :email, as: 'email'
          property :expires_in, as: 'expiresIn'
          property :id_token, as: 'idToken'
          property :kind, as: 'kind'
          property :local_id, as: 'localId'
          property :refresh_token, as: 'refreshToken'
        end
      end
      
      class UploadAccountResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :error, as: 'error', class: Google::Apis::IdentitytoolkitV3::UploadAccountResponse::Error, decorator: Google::Apis::IdentitytoolkitV3::UploadAccountResponse::Error::Representation
      
          property :kind, as: 'kind'
        end
        
        class Error
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :index, as: 'index'
            property :message, as: 'message'
          end
        end
      end
      
      class UserInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :disabled, as: 'disabled'
          property :display_name, as: 'displayName'
          property :email, as: 'email'
          property :email_verified, as: 'emailVerified'
          property :local_id, as: 'localId'
          property :password_hash, :base64 => true, as: 'passwordHash'
          property :password_updated_at, as: 'passwordUpdatedAt'
          property :photo_url, as: 'photoUrl'
          collection :provider_user_info, as: 'providerUserInfo', class: Google::Apis::IdentitytoolkitV3::UserInfo::ProviderUserInfo, decorator: Google::Apis::IdentitytoolkitV3::UserInfo::ProviderUserInfo::Representation
      
          property :salt, :base64 => true, as: 'salt'
          property :valid_since, as: 'validSince'
          property :version, as: 'version'
        end
        
        class ProviderUserInfo
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :display_name, as: 'displayName'
            property :email, as: 'email'
            property :federated_id, as: 'federatedId'
            property :photo_url, as: 'photoUrl'
            property :provider_id, as: 'providerId'
            property :raw_id, as: 'rawId'
          end
        end
      end
      
      class VerifyAssertionResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :action, as: 'action'
          property :app_installation_url, as: 'appInstallationUrl'
          property :app_scheme, as: 'appScheme'
          property :context, as: 'context'
          property :date_of_birth, as: 'dateOfBirth'
          property :display_name, as: 'displayName'
          property :email, as: 'email'
          property :email_recycled, as: 'emailRecycled'
          property :email_verified, as: 'emailVerified'
          property :expires_in, as: 'expiresIn'
          property :federated_id, as: 'federatedId'
          property :first_name, as: 'firstName'
          property :full_name, as: 'fullName'
          property :id_token, as: 'idToken'
          property :input_email, as: 'inputEmail'
          property :kind, as: 'kind'
          property :language, as: 'language'
          property :last_name, as: 'lastName'
          property :local_id, as: 'localId'
          property :need_confirmation, as: 'needConfirmation'
          property :need_email, as: 'needEmail'
          property :nick_name, as: 'nickName'
          property :oauth_access_token, as: 'oauthAccessToken'
          property :oauth_authorization_code, as: 'oauthAuthorizationCode'
          property :oauth_expire_in, as: 'oauthExpireIn'
          property :oauth_request_token, as: 'oauthRequestToken'
          property :oauth_scope, as: 'oauthScope'
          property :oauth_token_secret, as: 'oauthTokenSecret'
          property :original_email, as: 'originalEmail'
          property :photo_url, as: 'photoUrl'
          property :provider_id, as: 'providerId'
          property :refresh_token, as: 'refreshToken'
          property :time_zone, as: 'timeZone'
          collection :verified_provider, as: 'verifiedProvider'
        end
      end
      
      class VerifyCustomTokenResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :expires_in, as: 'expiresIn'
          property :id_token, as: 'idToken'
          property :kind, as: 'kind'
          property :refresh_token, as: 'refreshToken'
        end
      end
      
      class VerifyPasswordResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :display_name, as: 'displayName'
          property :email, as: 'email'
          property :expires_in, as: 'expiresIn'
          property :id_token, as: 'idToken'
          property :kind, as: 'kind'
          property :local_id, as: 'localId'
          property :oauth_access_token, as: 'oauthAccessToken'
          property :oauth_authorization_code, as: 'oauthAuthorizationCode'
          property :oauth_expire_in, as: 'oauthExpireIn'
          property :photo_url, as: 'photoUrl'
          property :refresh_token, as: 'refreshToken'
          property :registered, as: 'registered'
        end
      end
    end
  end
end
