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
    module DataprocV1
      # Google Cloud Dataproc API
      #
      # An API for managing Hadoop-based clusters and jobs on Google Cloud Platform.
      #
      # @example
      #    require 'google/apis/dataproc_v1'
      #
      #    Dataproc = Google::Apis::DataprocV1 # Alias the module
      #    service = Dataproc::DataprocService.new
      #
      # @see https://cloud.google.com/dataproc/
      class DataprocService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://dataproc.googleapis.com/', '')
        end
        
        # Method for media upload. Upload is supported on the URI `/upload/v1/media/`+
        # name``.
        # @param [String] resource_name
        #   Name of the media that is being downloaded. See ByteStream.ReadRequest.
        #   resource_name.
        # @param [Google::Apis::DataprocV1::Media] media_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [IO, String] upload_source
        #   IO stream or filename containing content to upload
        # @param [String] content_type
        #   Content type of the uploaded content.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Media] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Media]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def upload_medium(resource_name, media_object = nil, fields: nil, quota_user: nil, upload_source: nil, content_type: nil, options: nil, &block)
          if upload_source.nil?
            command =  make_simple_command(:post, 'v1/media/{+resourceName}', options)
          else
            command = make_upload_command(:post, 'v1/media/{+resourceName}', options)
            command.upload_source = upload_source
            command.upload_content_type = content_type
          end
          command.request_representation = Google::Apis::DataprocV1::Media::Representation
          command.request_object = media_object
          command.response_representation = Google::Apis::DataprocV1::Media::Representation
          command.response_class = Google::Apis::DataprocV1::Media
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Method for media download. Download is supported on the URI `/v1/media/`+name`?
        # alt=media`.
        # @param [String] resource_name
        #   Name of the media that is being downloaded. See ByteStream.ReadRequest.
        #   resource_name.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [IO, String] download_dest
        #   IO stream or filename to receive content download
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Media] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Media]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def download_medium(resource_name, fields: nil, quota_user: nil, download_dest: nil, options: nil, &block)
          if download_dest.nil?
            command =  make_simple_command(:get, 'v1/media/{+resourceName}', options)
          else
            command = make_download_command(:get, 'v1/media/{+resourceName}', options)
            command.download_dest = download_dest
          end
          command.response_representation = Google::Apis::DataprocV1::Media::Representation
          command.response_class = Google::Apis::DataprocV1::Media
          command.params['resourceName'] = resource_name unless resource_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a cluster in a project.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the cluster
        #   belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [Google::Apis::DataprocV1::Cluster] cluster_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_cluster(project_id, region, cluster_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/projects/{projectId}/regions/{region}/clusters', options)
          command.request_representation = Google::Apis::DataprocV1::Cluster::Representation
          command.request_object = cluster_object
          command.response_representation = Google::Apis::DataprocV1::Operation::Representation
          command.response_class = Google::Apis::DataprocV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates a cluster in a project.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project the cluster belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [String] cluster_name
        #   [Required] The cluster name.
        # @param [Google::Apis::DataprocV1::Cluster] cluster_object
        # @param [String] update_mask
        #   [Required] Specifies the path, relative to Cluster, of the field to update.
        #   For example, to change the number of workers in a cluster to 5, the
        #   update_mask parameter would be specified as config.worker_config.num_instances,
        #   and the `PATCH` request body would specify the new value, as follows: ` "
        #   config":` "workerConfig":` "numInstances":"5" ` ` ` Note: Currently, config.
        #   worker_config.num_instances is the only field that can be updated.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def patch_cluster(project_id, region, cluster_name, cluster_object = nil, update_mask: nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:patch, 'v1/projects/{projectId}/regions/{region}/clusters/{clusterName}', options)
          command.request_representation = Google::Apis::DataprocV1::Cluster::Representation
          command.request_object = cluster_object
          command.response_representation = Google::Apis::DataprocV1::Operation::Representation
          command.response_class = Google::Apis::DataprocV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.params['clusterName'] = cluster_name unless cluster_name.nil?
          command.query['updateMask'] = update_mask unless update_mask.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a cluster in a project.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the cluster
        #   belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [String] cluster_name
        #   [Required] The cluster name.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_cluster(project_id, region, cluster_name, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'v1/projects/{projectId}/regions/{region}/clusters/{clusterName}', options)
          command.response_representation = Google::Apis::DataprocV1::Operation::Representation
          command.response_class = Google::Apis::DataprocV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.params['clusterName'] = cluster_name unless cluster_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the resource representation for a cluster in a project.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the cluster
        #   belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [String] cluster_name
        #   [Required] The cluster name.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Cluster] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Cluster]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_cluster(project_id, region, cluster_name, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/projects/{projectId}/regions/{region}/clusters/{clusterName}', options)
          command.response_representation = Google::Apis::DataprocV1::Cluster::Representation
          command.response_class = Google::Apis::DataprocV1::Cluster
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.params['clusterName'] = cluster_name unless cluster_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all regions/`region`/clusters in a project.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the cluster
        #   belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [Fixnum] page_size
        #   The standard List page size.
        # @param [String] page_token
        #   The standard List page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::ListClustersResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::ListClustersResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_clusters(project_id, region, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/projects/{projectId}/regions/{region}/clusters', options)
          command.response_representation = Google::Apis::DataprocV1::ListClustersResponse::Representation
          command.response_class = Google::Apis::DataprocV1::ListClustersResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets cluster diagnostic information. After the operation completes, the
        # Operation.response field contains `DiagnoseClusterOutputLocation`.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the cluster
        #   belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [String] cluster_name
        #   [Required] The cluster name.
        # @param [Google::Apis::DataprocV1::DiagnoseClusterRequest] diagnose_cluster_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def diagnose_cluster(project_id, region, cluster_name, diagnose_cluster_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/projects/{projectId}/regions/{region}/clusters/{clusterName}:diagnose', options)
          command.request_representation = Google::Apis::DataprocV1::DiagnoseClusterRequest::Representation
          command.request_object = diagnose_cluster_request_object
          command.response_representation = Google::Apis::DataprocV1::Operation::Representation
          command.response_class = Google::Apis::DataprocV1::Operation
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.params['clusterName'] = cluster_name unless cluster_name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Submits a job to a cluster.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the job belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [Google::Apis::DataprocV1::SubmitJobRequest] submit_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def submit_job(project_id, region, submit_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/projects/{projectId}/regions/{region}/jobs:submit', options)
          command.request_representation = Google::Apis::DataprocV1::SubmitJobRequest::Representation
          command.request_object = submit_job_request_object
          command.response_representation = Google::Apis::DataprocV1::Job::Representation
          command.response_class = Google::Apis::DataprocV1::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the resource representation for a job in a project.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the job belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [String] job_id
        #   [Required] The job ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_job(project_id, region, job_id, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/projects/{projectId}/regions/{region}/jobs/{jobId}', options)
          command.response_representation = Google::Apis::DataprocV1::Job::Representation
          command.response_class = Google::Apis::DataprocV1::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists regions/`region`/jobs in a project.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the job belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [Fixnum] page_size
        #   [Optional] The number of results to return in each response.
        # @param [String] page_token
        #   [Optional] The page token, returned by a previous call, to request the next
        #   page of results.
        # @param [String] cluster_name
        #   [Optional] If set, the returned jobs list includes only jobs that were
        #   submitted to the named cluster.
        # @param [String] job_state_matcher
        #   [Optional] Specifies enumerated categories of jobs to list.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::ListJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::ListJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_jobs(project_id, region, page_size: nil, page_token: nil, cluster_name: nil, job_state_matcher: nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/projects/{projectId}/regions/{region}/jobs', options)
          command.response_representation = Google::Apis::DataprocV1::ListJobsResponse::Representation
          command.response_class = Google::Apis::DataprocV1::ListJobsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['clusterName'] = cluster_name unless cluster_name.nil?
          command.query['jobStateMatcher'] = job_state_matcher unless job_state_matcher.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts a job cancellation request. To access the job resource after
        # cancellation, call [regions/`region`/jobs.list](/dataproc/reference/rest/v1/
        # projects.regions.jobs/list) or [regions/`region`/jobs.get](/dataproc/reference/
        # rest/v1/projects.regions.jobs/get).
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the job belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [String] job_id
        #   [Required] The job ID.
        # @param [Google::Apis::DataprocV1::CancelJobRequest] cancel_job_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_job(project_id, region, job_id, cancel_job_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/projects/{projectId}/regions/{region}/jobs/{jobId}:cancel', options)
          command.request_representation = Google::Apis::DataprocV1::CancelJobRequest::Representation
          command.request_object = cancel_job_request_object
          command.response_representation = Google::Apis::DataprocV1::Job::Representation
          command.response_class = Google::Apis::DataprocV1::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes the job from the project. If the job is active, the delete fails, and
        # the response returns `FAILED_PRECONDITION`.
        # @param [String] project_id
        #   [Required] The ID of the Google Cloud Platform project that the job belongs to.
        # @param [String] region
        #   [Required] The Cloud Dataproc region in which to handle the request.
        # @param [String] job_id
        #   [Required] The job ID.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_job(project_id, region, job_id, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'v1/projects/{projectId}/regions/{region}/jobs/{jobId}', options)
          command.response_representation = Google::Apis::DataprocV1::Empty::Representation
          command.response_class = Google::Apis::DataprocV1::Empty
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['region'] = region unless region.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the latest state of a long-running operation. Clients can use this method
        # to poll the operation result at intervals as recommended by the API service.
        # @param [String] name
        #   The name of the operation resource.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Operation] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Operation]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::DataprocV1::Operation::Representation
          command.response_class = Google::Apis::DataprocV1::Operation
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists operations that match the specified filter in the request. If the server
        # doesn't support this method, it returns `UNIMPLEMENTED`. NOTE: the `name`
        # binding below allows API services to override the binding to use different
        # resource name schemes, such as `users/*/operations`.
        # @param [String] name
        #   The name of the operation collection.
        # @param [String] filter
        #   The standard list filter.
        # @param [Fixnum] page_size
        #   The standard list page size.
        # @param [String] page_token
        #   The standard list page token.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::ListOperationsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::ListOperationsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_operations(name, filter: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1/{+name}', options)
          command.response_representation = Google::Apis::DataprocV1::ListOperationsResponse::Representation
          command.response_class = Google::Apis::DataprocV1::ListOperationsResponse
          command.params['name'] = name unless name.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Starts asynchronous cancellation on a long-running operation. The server makes
        # a best effort to cancel the operation, but success is not guaranteed. If the
        # server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`.
        # Clients can use Operations.GetOperation or other methods to check whether the
        # cancellation succeeded or whether the operation completed despite cancellation.
        # @param [String] name
        #   The name of the operation resource to be cancelled.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def cancel_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1/{+name}:cancel', options)
          command.response_representation = Google::Apis::DataprocV1::Empty::Representation
          command.response_class = Google::Apis::DataprocV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Deletes a long-running operation. This method indicates that the client is no
        # longer interested in the operation result. It does not cancel the operation.
        # If the server doesn't support this method, it returns `google.rpc.Code.
        # UNIMPLEMENTED`.
        # @param [String] name
        #   The name of the operation resource to be deleted.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataprocV1::Empty] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataprocV1::Empty]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def delete_operation(name, fields: nil, quota_user: nil, options: nil, &block)
          command =  make_simple_command(:delete, 'v1/{+name}', options)
          command.response_representation = Google::Apis::DataprocV1::Empty::Representation
          command.response_class = Google::Apis::DataprocV1::Empty
          command.params['name'] = name unless name.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
