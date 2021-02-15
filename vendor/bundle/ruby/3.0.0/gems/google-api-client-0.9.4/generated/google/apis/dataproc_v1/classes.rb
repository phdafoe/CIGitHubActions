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
    module DataprocV1
      
      # Media resource.
      class Media
        include Google::Apis::Core::Hashable
      
        # Name of the media resource.
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
        end
      end
      
      # Describes the identifying information, config, and status of a cluster of
      # Google Compute Engine instances.
      class Cluster
        include Google::Apis::Core::Hashable
      
        # [Required] The Google Cloud Platform project ID that the cluster belongs to.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # [Required] The cluster name. Cluster names within a project must be unique.
        # Names of deleted clusters can be reused.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # The cluster config.
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::DataprocV1::ClusterConfig]
        attr_accessor :config
      
        # The status of a cluster and its instances.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataprocV1::ClusterStatus]
        attr_accessor :status
      
        # [Output-only] The previous cluster status.
        # Corresponds to the JSON property `statusHistory`
        # @return [Array<Google::Apis::DataprocV1::ClusterStatus>]
        attr_accessor :status_history
      
        # [Output-only] A cluster UUID (Unique Universal Identifier). Cloud Dataproc
        # generates this value when it creates the cluster.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @config = args[:config] if args.key?(:config)
          @status = args[:status] if args.key?(:status)
          @status_history = args[:status_history] if args.key?(:status_history)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
        end
      end
      
      # The cluster config.
      class ClusterConfig
        include Google::Apis::Core::Hashable
      
        # [Optional] A Google Cloud Storage staging bucket used for sharing generated
        # SSH keys and config. If you do not specify a staging bucket, Cloud Dataproc
        # will determine an appropriate Cloud Storage location (US, ASIA, or EU) for
        # your cluster's staging bucket according to the Google Compute Engine zone
        # where your cluster is deployed, and then it will create and manage this
        # project-level, per-location bucket for you.
        # Corresponds to the JSON property `configBucket`
        # @return [String]
        attr_accessor :config_bucket
      
        # Common config settings for resources of Google Compute Engine cluster
        # instances, applicable to all instances in the cluster.
        # Corresponds to the JSON property `gceClusterConfig`
        # @return [Google::Apis::DataprocV1::GceClusterConfig]
        attr_accessor :gce_cluster_config
      
        # The config settings for Google Compute Engine resources in an instance group,
        # such as a master or worker group.
        # Corresponds to the JSON property `masterConfig`
        # @return [Google::Apis::DataprocV1::InstanceGroupConfig]
        attr_accessor :master_config
      
        # The config settings for Google Compute Engine resources in an instance group,
        # such as a master or worker group.
        # Corresponds to the JSON property `workerConfig`
        # @return [Google::Apis::DataprocV1::InstanceGroupConfig]
        attr_accessor :worker_config
      
        # The config settings for Google Compute Engine resources in an instance group,
        # such as a master or worker group.
        # Corresponds to the JSON property `secondaryWorkerConfig`
        # @return [Google::Apis::DataprocV1::InstanceGroupConfig]
        attr_accessor :secondary_worker_config
      
        # Specifies the selection and config of software inside the cluster.
        # Corresponds to the JSON property `softwareConfig`
        # @return [Google::Apis::DataprocV1::SoftwareConfig]
        attr_accessor :software_config
      
        # [Optional] Commands to execute on each node after config is completed. By
        # default, executables are run on master and all worker nodes. You can test a
        # node's role metadata to run an executable on a master or worker node, as shown
        # below: ROLE=$(/usr/share/google/get_metadata_value attributes/role) if [[ "$`
        # ROLE`" == 'Master' ]]; then ... master specific actions ... else ... worker
        # specific actions ... fi
        # Corresponds to the JSON property `initializationActions`
        # @return [Array<Google::Apis::DataprocV1::NodeInitializationAction>]
        attr_accessor :initialization_actions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config_bucket = args[:config_bucket] if args.key?(:config_bucket)
          @gce_cluster_config = args[:gce_cluster_config] if args.key?(:gce_cluster_config)
          @master_config = args[:master_config] if args.key?(:master_config)
          @worker_config = args[:worker_config] if args.key?(:worker_config)
          @secondary_worker_config = args[:secondary_worker_config] if args.key?(:secondary_worker_config)
          @software_config = args[:software_config] if args.key?(:software_config)
          @initialization_actions = args[:initialization_actions] if args.key?(:initialization_actions)
        end
      end
      
      # Common config settings for resources of Google Compute Engine cluster
      # instances, applicable to all instances in the cluster.
      class GceClusterConfig
        include Google::Apis::Core::Hashable
      
        # [Required] The zone where the Google Compute Engine cluster will be located.
        # Example: `https://www.googleapis.com/compute/v1/projects/[project_id]/zones/[
        # zone]`.
        # Corresponds to the JSON property `zoneUri`
        # @return [String]
        attr_accessor :zone_uri
      
        # The Google Compute Engine network to be used for machine communications.
        # Cannot be specified with subnetwork_uri. If neither network_uri nor
        # subnetwork_uri is specified, the "default" network of the project is used, if
        # it exists. Cannot be a "Custom Subnet Network" (see https://cloud.google.com/
        # compute/docs/subnetworks for more information). Example: `https://www.
        # googleapis.com/compute/v1/projects/[project_id]/regions/global/default`.
        # Corresponds to the JSON property `networkUri`
        # @return [String]
        attr_accessor :network_uri
      
        # The Google Compute Engine subnetwork to be used for machine communications.
        # Cannot be specified with network_uri. Example: `https://www.googleapis.com/
        # compute/v1/projects/[project_id]/regions/us-east1/sub0`.
        # Corresponds to the JSON property `subnetworkUri`
        # @return [String]
        attr_accessor :subnetwork_uri
      
        # The URIs of service account scopes to be included in Google Compute Engine
        # instances. The following base set of scopes is always included: * https://www.
        # googleapis.com/auth/cloud.useraccounts.readonly * https://www.googleapis.com/
        # auth/devstorage.read_write * https://www.googleapis.com/auth/logging.write If
        # no scopes are specfied, the following defaults are also provided: * https://
        # www.googleapis.com/auth/bigquery * https://www.googleapis.com/auth/bigtable.
        # admin.table * https://www.googleapis.com/auth/bigtable.data * https://www.
        # googleapis.com/auth/devstorage.full_control
        # Corresponds to the JSON property `serviceAccountScopes`
        # @return [Array<String>]
        attr_accessor :service_account_scopes
      
        # The Google Compute Engine tags to add to all instances.
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # The Google Compute Engine metadata entries to add to all instances.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,String>]
        attr_accessor :metadata
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @zone_uri = args[:zone_uri] if args.key?(:zone_uri)
          @network_uri = args[:network_uri] if args.key?(:network_uri)
          @subnetwork_uri = args[:subnetwork_uri] if args.key?(:subnetwork_uri)
          @service_account_scopes = args[:service_account_scopes] if args.key?(:service_account_scopes)
          @tags = args[:tags] if args.key?(:tags)
          @metadata = args[:metadata] if args.key?(:metadata)
        end
      end
      
      # The config settings for Google Compute Engine resources in an instance group,
      # such as a master or worker group.
      class InstanceGroupConfig
        include Google::Apis::Core::Hashable
      
        # The number of VM instances in the instance group. For master instance groups,
        # must be set to 1.
        # Corresponds to the JSON property `numInstances`
        # @return [Fixnum]
        attr_accessor :num_instances
      
        # The list of instance names. Cloud Dataproc derives the names from `
        # cluster_name`, `num_instances`, and the instance group if not set by user (
        # recommended practice is to let Cloud Dataproc derive the name).
        # Corresponds to the JSON property `instanceNames`
        # @return [Array<String>]
        attr_accessor :instance_names
      
        # [Output-only] The Google Compute Engine image resource used for cluster
        # instances. Inferred from `SoftwareConfig.image_version`.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # The Google Compute Engine machine type used for cluster instances. Example: `
        # https://www.googleapis.com/compute/v1/projects/[project_id]/zones/us-east1-a/
        # machineTypes/n1-standard-2`.
        # Corresponds to the JSON property `machineTypeUri`
        # @return [String]
        attr_accessor :machine_type_uri
      
        # Specifies the config of disk options for a group of VM instances.
        # Corresponds to the JSON property `diskConfig`
        # @return [Google::Apis::DataprocV1::DiskConfig]
        attr_accessor :disk_config
      
        # Specifies that this instance group contains Preemptible Instances.
        # Corresponds to the JSON property `isPreemptible`
        # @return [Boolean]
        attr_accessor :is_preemptible
        alias_method :is_preemptible?, :is_preemptible
      
        # Specifies the resources used to actively manage an instance group.
        # Corresponds to the JSON property `managedGroupConfig`
        # @return [Google::Apis::DataprocV1::ManagedGroupConfig]
        attr_accessor :managed_group_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_instances = args[:num_instances] if args.key?(:num_instances)
          @instance_names = args[:instance_names] if args.key?(:instance_names)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @machine_type_uri = args[:machine_type_uri] if args.key?(:machine_type_uri)
          @disk_config = args[:disk_config] if args.key?(:disk_config)
          @is_preemptible = args[:is_preemptible] if args.key?(:is_preemptible)
          @managed_group_config = args[:managed_group_config] if args.key?(:managed_group_config)
        end
      end
      
      # Specifies the config of disk options for a group of VM instances.
      class DiskConfig
        include Google::Apis::Core::Hashable
      
        # [Optional] Size in GB of the boot disk (default is 500GB).
        # Corresponds to the JSON property `bootDiskSizeGb`
        # @return [Fixnum]
        attr_accessor :boot_disk_size_gb
      
        # [Optional] Number of attached SSDs, from 0 to 4 (default is 0). If SSDs are
        # not attached, the boot disk is used to store runtime logs and HDFS data. If
        # one or more SSDs are attached, this runtime bulk data is spread across them,
        # and the boot disk contains only basic config and installed binaries.
        # Corresponds to the JSON property `numLocalSsds`
        # @return [Fixnum]
        attr_accessor :num_local_ssds
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @boot_disk_size_gb = args[:boot_disk_size_gb] if args.key?(:boot_disk_size_gb)
          @num_local_ssds = args[:num_local_ssds] if args.key?(:num_local_ssds)
        end
      end
      
      # Specifies the resources used to actively manage an instance group.
      class ManagedGroupConfig
        include Google::Apis::Core::Hashable
      
        # [Output-only] The name of the Instance Template used for the Managed Instance
        # Group.
        # Corresponds to the JSON property `instanceTemplateName`
        # @return [String]
        attr_accessor :instance_template_name
      
        # [Output-only] The name of the Instance Group Manager for this group.
        # Corresponds to the JSON property `instanceGroupManagerName`
        # @return [String]
        attr_accessor :instance_group_manager_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @instance_template_name = args[:instance_template_name] if args.key?(:instance_template_name)
          @instance_group_manager_name = args[:instance_group_manager_name] if args.key?(:instance_group_manager_name)
        end
      end
      
      # Specifies the selection and config of software inside the cluster.
      class SoftwareConfig
        include Google::Apis::Core::Hashable
      
        # [Optional] The version of software inside the cluster. It must match the
        # regular expression `[0-9]+\.[0-9]+`. If unspecified, it defaults to the latest
        # version (see [Cloud Dataproc Versioning](/dataproc/versioning)).
        # Corresponds to the JSON property `imageVersion`
        # @return [String]
        attr_accessor :image_version
      
        # [Optional] The properties to set on daemon config files. Property keys are
        # specified in `prefix:property` format, such as `core:fs.defaultFS`. The
        # following are supported prefixes and their mappings: * core: `core-site.xml` *
        # hdfs: `hdfs-site.xml` * mapred: `mapred-site.xml` * yarn: `yarn-site.xml` *
        # hive: `hive-site.xml` * pig: `pig.properties` * spark: `spark-defaults.conf`
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @image_version = args[:image_version] if args.key?(:image_version)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # Specifies an executable to run on a fully configured node and a timeout period
      # for executable completion.
      class NodeInitializationAction
        include Google::Apis::Core::Hashable
      
        # [Required] Google Cloud Storage URI of executable file.
        # Corresponds to the JSON property `executableFile`
        # @return [String]
        attr_accessor :executable_file
      
        # [Optional] Amount of time executable has to complete. Default is 10 minutes.
        # Cluster creation fails with an explanatory error message (the name of the
        # executable that caused the error and the exceeded timeout period) if the
        # executable is not completed at end of the timeout period.
        # Corresponds to the JSON property `executionTimeout`
        # @return [String]
        attr_accessor :execution_timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @executable_file = args[:executable_file] if args.key?(:executable_file)
          @execution_timeout = args[:execution_timeout] if args.key?(:execution_timeout)
        end
      end
      
      # The status of a cluster and its instances.
      class ClusterStatus
        include Google::Apis::Core::Hashable
      
        # The cluster's state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Optional details of cluster's state.
        # Corresponds to the JSON property `detail`
        # @return [String]
        attr_accessor :detail
      
        # Time when this state was entered.
        # Corresponds to the JSON property `stateStartTime`
        # @return [String]
        attr_accessor :state_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state = args[:state] if args.key?(:state)
          @detail = args[:detail] if args.key?(:detail)
          @state_start_time = args[:state_start_time] if args.key?(:state_start_time)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the `name` should
        # have the format of `operations/some/unique/name`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Service-specific metadata associated with the operation. It typically contains
        # progress information and common metadata such as create time. Some services
        # might not provide such metadata. Any method that returns a long-running
        # operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # If the value is `false`, it means the operation is still in progress. If true,
        # the operation is completed, and either `error` or `response` is available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by [
        # gRPC](https://github.com/grpc). The error model is designed to be: - Simple to
        # use and understand for most users - Flexible enough to meet unexpected needs #
        # Overview The `Status` message contains three pieces of data: error code, error
        # message, and error details. The error code should be an enum value of google.
        # rpc.Code, but it may accept additional error codes if needed. The error
        # message should be a developer-facing English message that helps developers *
        # understand* and *resolve* the error. If a localized user-facing error message
        # is needed, put the localized message in the error details or localize it in
        # the client. The optional error details may contain arbitrary information about
        # the error. There is a predefined set of error detail types in the package `
        # google.rpc` which can be used for common error conditions. # Language mapping
        # The `Status` message is the logical representation of the error model, but it
        # is not necessarily the actual wire format. When the `Status` message is
        # exposed in different client libraries and different wire protocols, it can be
        # mapped differently. For example, it will likely be mapped to some exceptions
        # in Java, but more likely mapped to some error codes in C. # Other uses The
        # error model and the `Status` message can be used in a variety of environments,
        # either with or without APIs, to provide a consistent developer experience
        # across different environments. Example uses of this error model include: -
        # Partial errors. If a service needs to return partial errors to the client, it
        # may embed the `Status` in the normal response to indicate the partial errors. -
        # Workflow errors. A typical workflow has multiple steps. Each step may have a `
        # Status` message for error reporting purpose. - Batch operations. If a client
        # uses batch request and batch response, the `Status` message should be used
        # directly inside batch response, one for each error sub-response. -
        # Asynchronous operations. If an API call embeds asynchronous operation results
        # in its response, the status of those operations should be represented directly
        # using the `Status` message. - Logging. If some API errors are stored in logs,
        # the message `Status` could be used directly after any stripping needed for
        # security/privacy reasons.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::DataprocV1::Status]
        attr_accessor :error
      
        # The normal response of the operation in case of success. If the original
        # method returns no data on success, such as `Delete`, the response is `google.
        # protobuf.Empty`. If the original method is standard `Get`/`Create`/`Update`,
        # the response should be the resource. For other methods, the response should
        # have the type `XxxResponse`, where `Xxx` is the original method name. For
        # example, if the original method name is `TakeSnapshot()`, the inferred
        # response type is `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @metadata = args[:metadata] if args.key?(:metadata)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by [
      # gRPC](https://github.com/grpc). The error model is designed to be: - Simple to
      # use and understand for most users - Flexible enough to meet unexpected needs #
      # Overview The `Status` message contains three pieces of data: error code, error
      # message, and error details. The error code should be an enum value of google.
      # rpc.Code, but it may accept additional error codes if needed. The error
      # message should be a developer-facing English message that helps developers *
      # understand* and *resolve* the error. If a localized user-facing error message
      # is needed, put the localized message in the error details or localize it in
      # the client. The optional error details may contain arbitrary information about
      # the error. There is a predefined set of error detail types in the package `
      # google.rpc` which can be used for common error conditions. # Language mapping
      # The `Status` message is the logical representation of the error model, but it
      # is not necessarily the actual wire format. When the `Status` message is
      # exposed in different client libraries and different wire protocols, it can be
      # mapped differently. For example, it will likely be mapped to some exceptions
      # in Java, but more likely mapped to some error codes in C. # Other uses The
      # error model and the `Status` message can be used in a variety of environments,
      # either with or without APIs, to provide a consistent developer experience
      # across different environments. Example uses of this error model include: -
      # Partial errors. If a service needs to return partial errors to the client, it
      # may embed the `Status` in the normal response to indicate the partial errors. -
      # Workflow errors. A typical workflow has multiple steps. Each step may have a `
      # Status` message for error reporting purpose. - Batch operations. If a client
      # uses batch request and batch response, the `Status` message should be used
      # directly inside batch response, one for each error sub-response. -
      # Asynchronous operations. If an API call embeds asynchronous operation results
      # in its response, the status of those operations should be represented directly
      # using the `Status` message. - Logging. If some API errors are stored in logs,
      # the message `Status` could be used directly after any stripping needed for
      # security/privacy reasons.
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A developer-facing error message, which should be in English. Any user-facing
        # error message should be localized and sent in the google.rpc.Status.details
        # field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        # A list of messages that carry the error details. There will be a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @message = args[:message] if args.key?(:message)
          @details = args[:details] if args.key?(:details)
        end
      end
      
      # The list of all clusters in a project.
      class ListClustersResponse
        include Google::Apis::Core::Hashable
      
        # [Output-only] The clusters in the project.
        # Corresponds to the JSON property `clusters`
        # @return [Array<Google::Apis::DataprocV1::Cluster>]
        attr_accessor :clusters
      
        # [Optional] This token is included in the response if there are more results to
        # fetch. To fetch additional results, provide this value as the `page_token` in
        # a subsequent ListClustersRequest.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @clusters = args[:clusters] if args.key?(:clusters)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A request to collect cluster diagnostic information.
      class DiagnoseClusterRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A request to submit a job.
      class SubmitJobRequest
        include Google::Apis::Core::Hashable
      
        # A Cloud Dataproc job resource.
        # Corresponds to the JSON property `job`
        # @return [Google::Apis::DataprocV1::Job]
        attr_accessor :job
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @job = args[:job] if args.key?(:job)
        end
      end
      
      # A Cloud Dataproc job resource.
      class Job
        include Google::Apis::Core::Hashable
      
        # Encapsulates the full scoping used to reference a job.
        # Corresponds to the JSON property `reference`
        # @return [Google::Apis::DataprocV1::JobReference]
        attr_accessor :reference
      
        # Cloud Dataproc job config.
        # Corresponds to the JSON property `placement`
        # @return [Google::Apis::DataprocV1::JobPlacement]
        attr_accessor :placement
      
        # A Cloud Dataproc job for running Hadoop MapReduce jobs on YARN.
        # Corresponds to the JSON property `hadoopJob`
        # @return [Google::Apis::DataprocV1::HadoopJob]
        attr_accessor :hadoop_job
      
        # A Cloud Dataproc job for running Spark applications on YARN.
        # Corresponds to the JSON property `sparkJob`
        # @return [Google::Apis::DataprocV1::SparkJob]
        attr_accessor :spark_job
      
        # A Cloud Dataproc job for running PySpark applications on YARN.
        # Corresponds to the JSON property `pysparkJob`
        # @return [Google::Apis::DataprocV1::PySparkJob]
        attr_accessor :pyspark_job
      
        # A Cloud Dataproc job for running Hive queries on YARN.
        # Corresponds to the JSON property `hiveJob`
        # @return [Google::Apis::DataprocV1::HiveJob]
        attr_accessor :hive_job
      
        # A Cloud Dataproc job for running Pig queries on YARN.
        # Corresponds to the JSON property `pigJob`
        # @return [Google::Apis::DataprocV1::PigJob]
        attr_accessor :pig_job
      
        # A Cloud Dataproc job for running Spark SQL queries.
        # Corresponds to the JSON property `sparkSqlJob`
        # @return [Google::Apis::DataprocV1::SparkSqlJob]
        attr_accessor :spark_sql_job
      
        # Cloud Dataproc job status.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataprocV1::JobStatus]
        attr_accessor :status
      
        # [Output-only] The previous job status.
        # Corresponds to the JSON property `statusHistory`
        # @return [Array<Google::Apis::DataprocV1::JobStatus>]
        attr_accessor :status_history
      
        # [Output-only] A URI pointing to the location of the stdout of the job's driver
        # program.
        # Corresponds to the JSON property `driverOutputResourceUri`
        # @return [String]
        attr_accessor :driver_output_resource_uri
      
        # [Output-only] If present, the location of miscellaneous control files which
        # may be used as part of job setup and handling. If not present, control files
        # may be placed in the same location as `driver_output_uri`.
        # Corresponds to the JSON property `driverControlFilesUri`
        # @return [String]
        attr_accessor :driver_control_files_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @reference = args[:reference] if args.key?(:reference)
          @placement = args[:placement] if args.key?(:placement)
          @hadoop_job = args[:hadoop_job] if args.key?(:hadoop_job)
          @spark_job = args[:spark_job] if args.key?(:spark_job)
          @pyspark_job = args[:pyspark_job] if args.key?(:pyspark_job)
          @hive_job = args[:hive_job] if args.key?(:hive_job)
          @pig_job = args[:pig_job] if args.key?(:pig_job)
          @spark_sql_job = args[:spark_sql_job] if args.key?(:spark_sql_job)
          @status = args[:status] if args.key?(:status)
          @status_history = args[:status_history] if args.key?(:status_history)
          @driver_output_resource_uri = args[:driver_output_resource_uri] if args.key?(:driver_output_resource_uri)
          @driver_control_files_uri = args[:driver_control_files_uri] if args.key?(:driver_control_files_uri)
        end
      end
      
      # Encapsulates the full scoping used to reference a job.
      class JobReference
        include Google::Apis::Core::Hashable
      
        # [Required] The ID of the Google Cloud Platform project that the job belongs to.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # [Required] The job ID, which must be unique within the project. The job ID is
        # generated by the server upon job submission or provided by the user as a means
        # to perform retries without creating duplicate jobs. The ID must contain only
        # letters (a-z, A-Z), numbers (0-9), underscores (_), or hyphens (-). The
        # maximum length is 512 characters.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @project_id = args[:project_id] if args.key?(:project_id)
          @job_id = args[:job_id] if args.key?(:job_id)
        end
      end
      
      # Cloud Dataproc job config.
      class JobPlacement
        include Google::Apis::Core::Hashable
      
        # [Required] The name of the cluster where the job will be submitted.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # [Output-only] A cluster UUID generated by the Cloud Dataproc service when the
        # job is submitted.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
        end
      end
      
      # A Cloud Dataproc job for running Hadoop MapReduce jobs on YARN.
      class HadoopJob
        include Google::Apis::Core::Hashable
      
        # The HCFS URI of the jar file containing the main class. Examples: 'gs://foo-
        # bucket/analytics-binaries/extract-useful-metrics-mr.jar' 'hdfs:/tmp/test-
        # samples/custom-wordcount.jar' 'file:///home/usr/lib/hadoop-mapreduce/hadoop-
        # mapreduce-examples.jar'
        # Corresponds to the JSON property `mainJarFileUri`
        # @return [String]
        attr_accessor :main_jar_file_uri
      
        # The name of the driver's main class. The jar file containing the class must be
        # in the default CLASSPATH or specified in `jar_file_uris`.
        # Corresponds to the JSON property `mainClass`
        # @return [String]
        attr_accessor :main_class
      
        # [Optional] The arguments to pass to the driver. Do not include arguments, such
        # as `-libjars` or `-Dfoo=bar`, that can be set as job properties, since a
        # collision may occur that causes an incorrect job submission.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # [Optional] Jar file URIs to add to the CLASSPATHs of the Hadoop driver and
        # tasks.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # [Optional] HCFS (Hadoop Compatible Filesystem) URIs of files to be copied to
        # the working directory of Hadoop drivers and distributed tasks. Useful for
        # naively parallel tasks.
        # Corresponds to the JSON property `fileUris`
        # @return [Array<String>]
        attr_accessor :file_uris
      
        # [Optional] HCFS URIs of archives to be extracted in the working directory of
        # Hadoop drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, or .
        # zip.
        # Corresponds to the JSON property `archiveUris`
        # @return [Array<String>]
        attr_accessor :archive_uris
      
        # [Optional] A mapping of property names to values, used to configure Hadoop.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/hadoop/conf/*-site and classes
        # in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1::LoggingConfig]
        attr_accessor :logging_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @main_jar_file_uri = args[:main_jar_file_uri] if args.key?(:main_jar_file_uri)
          @main_class = args[:main_class] if args.key?(:main_class)
          @args = args[:args] if args.key?(:args)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @file_uris = args[:file_uris] if args.key?(:file_uris)
          @archive_uris = args[:archive_uris] if args.key?(:archive_uris)
          @properties = args[:properties] if args.key?(:properties)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
        end
      end
      
      # The runtime logging config of the job.
      class LoggingConfig
        include Google::Apis::Core::Hashable
      
        # The per-package log levels for the driver. This may include "root" package
        # name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', '
        # org.apache = DEBUG'
        # Corresponds to the JSON property `driverLogLevels`
        # @return [Hash<String,String>]
        attr_accessor :driver_log_levels
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @driver_log_levels = args[:driver_log_levels] if args.key?(:driver_log_levels)
        end
      end
      
      # A Cloud Dataproc job for running Spark applications on YARN.
      class SparkJob
        include Google::Apis::Core::Hashable
      
        # The HCFS URI of the jar file that contains the main class.
        # Corresponds to the JSON property `mainJarFileUri`
        # @return [String]
        attr_accessor :main_jar_file_uri
      
        # The name of the driver's main class. The jar file that contains the class must
        # be in the default CLASSPATH or specified in `jar_file_uris`.
        # Corresponds to the JSON property `mainClass`
        # @return [String]
        attr_accessor :main_class
      
        # [Optional] The arguments to pass to the driver. Do not include arguments, such
        # as `--conf`, that can be set as job properties, since a collision may occur
        # that causes an incorrect job submission.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # [Optional] HCFS URIs of jar files to add to the CLASSPATHs of the Spark driver
        # and tasks.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # [Optional] HCFS URIs of files to be copied to the working directory of Spark
        # drivers and distributed tasks. Useful for naively parallel tasks.
        # Corresponds to the JSON property `fileUris`
        # @return [Array<String>]
        attr_accessor :file_uris
      
        # [Optional] HCFS URIs of archives to be extracted in the working directory of
        # Spark drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, and .
        # zip.
        # Corresponds to the JSON property `archiveUris`
        # @return [Array<String>]
        attr_accessor :archive_uris
      
        # [Optional] A mapping of property names to values, used to configure Spark.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf
        # and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1::LoggingConfig]
        attr_accessor :logging_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @main_jar_file_uri = args[:main_jar_file_uri] if args.key?(:main_jar_file_uri)
          @main_class = args[:main_class] if args.key?(:main_class)
          @args = args[:args] if args.key?(:args)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @file_uris = args[:file_uris] if args.key?(:file_uris)
          @archive_uris = args[:archive_uris] if args.key?(:archive_uris)
          @properties = args[:properties] if args.key?(:properties)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
        end
      end
      
      # A Cloud Dataproc job for running PySpark applications on YARN.
      class PySparkJob
        include Google::Apis::Core::Hashable
      
        # [Required] The HCFS URI of the main Python file to use as the driver. Must be
        # a .py file.
        # Corresponds to the JSON property `mainPythonFileUri`
        # @return [String]
        attr_accessor :main_python_file_uri
      
        # [Optional] The arguments to pass to the driver. Do not include arguments, such
        # as `--conf`, that can be set as job properties, since a collision may occur
        # that causes an incorrect job submission.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # [Optional] HCFS file URIs of Python files to pass to the PySpark framework.
        # Supported file types: .py, .egg, and .zip.
        # Corresponds to the JSON property `pythonFileUris`
        # @return [Array<String>]
        attr_accessor :python_file_uris
      
        # [Optional] HCFS URIs of jar files to add to the CLASSPATHs of the Python
        # driver and tasks.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # [Optional] HCFS URIs of files to be copied to the working directory of Python
        # drivers and distributed tasks. Useful for naively parallel tasks.
        # Corresponds to the JSON property `fileUris`
        # @return [Array<String>]
        attr_accessor :file_uris
      
        # [Optional] HCFS URIs of archives to be extracted in the working directory of .
        # jar, .tar, .tar.gz, .tgz, and .zip.
        # Corresponds to the JSON property `archiveUris`
        # @return [Array<String>]
        attr_accessor :archive_uris
      
        # [Optional] A mapping of property names to values, used to configure PySpark.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf
        # and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1::LoggingConfig]
        attr_accessor :logging_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @main_python_file_uri = args[:main_python_file_uri] if args.key?(:main_python_file_uri)
          @args = args[:args] if args.key?(:args)
          @python_file_uris = args[:python_file_uris] if args.key?(:python_file_uris)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @file_uris = args[:file_uris] if args.key?(:file_uris)
          @archive_uris = args[:archive_uris] if args.key?(:archive_uris)
          @properties = args[:properties] if args.key?(:properties)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
        end
      end
      
      # A Cloud Dataproc job for running Hive queries on YARN.
      class HiveJob
        include Google::Apis::Core::Hashable
      
        # The HCFS URI of the script that contains Hive queries.
        # Corresponds to the JSON property `queryFileUri`
        # @return [String]
        attr_accessor :query_file_uri
      
        # A list of queries to run on a cluster.
        # Corresponds to the JSON property `queryList`
        # @return [Google::Apis::DataprocV1::QueryList]
        attr_accessor :query_list
      
        # [Optional] Whether to continue executing queries if a query fails. The default
        # value is `false`. Setting to `true` can be useful when executing independent
        # parallel queries.
        # Corresponds to the JSON property `continueOnFailure`
        # @return [Boolean]
        attr_accessor :continue_on_failure
        alias_method :continue_on_failure?, :continue_on_failure
      
        # [Optional] Mapping of query variable names to values (equivalent to the Hive
        # command: `SET name="value";`).
        # Corresponds to the JSON property `scriptVariables`
        # @return [Hash<String,String>]
        attr_accessor :script_variables
      
        # [Optional] A mapping of property names and values, used to configure Hive.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/
        # hive/conf/hive-site.xml, and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # [Optional] HCFS URIs of jar files to add to the CLASSPATH of the Hive server
        # and Hadoop MapReduce (MR) tasks. Can contain Hive SerDes and UDFs.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_file_uri = args[:query_file_uri] if args.key?(:query_file_uri)
          @query_list = args[:query_list] if args.key?(:query_list)
          @continue_on_failure = args[:continue_on_failure] if args.key?(:continue_on_failure)
          @script_variables = args[:script_variables] if args.key?(:script_variables)
          @properties = args[:properties] if args.key?(:properties)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
        end
      end
      
      # A list of queries to run on a cluster.
      class QueryList
        include Google::Apis::Core::Hashable
      
        # [Required] The queries to execute. You do not need to terminate a query with a
        # semicolon. Multiple queries can be specified in one string by separating each
        # with a semicolon. Here is an example of an Cloud Dataproc API snippet that
        # uses a QueryList to specify a HiveJob: "hiveJob": ` "queryList": ` "queries": [
        # "query1", "query2", "query3;query4", ] ` `
        # Corresponds to the JSON property `queries`
        # @return [Array<String>]
        attr_accessor :queries
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @queries = args[:queries] if args.key?(:queries)
        end
      end
      
      # A Cloud Dataproc job for running Pig queries on YARN.
      class PigJob
        include Google::Apis::Core::Hashable
      
        # The HCFS URI of the script that contains the Pig queries.
        # Corresponds to the JSON property `queryFileUri`
        # @return [String]
        attr_accessor :query_file_uri
      
        # A list of queries to run on a cluster.
        # Corresponds to the JSON property `queryList`
        # @return [Google::Apis::DataprocV1::QueryList]
        attr_accessor :query_list
      
        # [Optional] Whether to continue executing queries if a query fails. The default
        # value is `false`. Setting to `true` can be useful when executing independent
        # parallel queries.
        # Corresponds to the JSON property `continueOnFailure`
        # @return [Boolean]
        attr_accessor :continue_on_failure
        alias_method :continue_on_failure?, :continue_on_failure
      
        # [Optional] Mapping of query variable names to values (equivalent to the Pig
        # command: `name=[value]`).
        # Corresponds to the JSON property `scriptVariables`
        # @return [Hash<String,String>]
        attr_accessor :script_variables
      
        # [Optional] A mapping of property names to values, used to configure Pig.
        # Properties that conflict with values set by the Cloud Dataproc API may be
        # overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/
        # pig/conf/pig.properties, and classes in user code.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # [Optional] HCFS URIs of jar files to add to the CLASSPATH of the Pig Client
        # and Hadoop MapReduce (MR) tasks. Can contain Pig UDFs.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1::LoggingConfig]
        attr_accessor :logging_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_file_uri = args[:query_file_uri] if args.key?(:query_file_uri)
          @query_list = args[:query_list] if args.key?(:query_list)
          @continue_on_failure = args[:continue_on_failure] if args.key?(:continue_on_failure)
          @script_variables = args[:script_variables] if args.key?(:script_variables)
          @properties = args[:properties] if args.key?(:properties)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
        end
      end
      
      # A Cloud Dataproc job for running Spark SQL queries.
      class SparkSqlJob
        include Google::Apis::Core::Hashable
      
        # The HCFS URI of the script that contains SQL queries.
        # Corresponds to the JSON property `queryFileUri`
        # @return [String]
        attr_accessor :query_file_uri
      
        # A list of queries to run on a cluster.
        # Corresponds to the JSON property `queryList`
        # @return [Google::Apis::DataprocV1::QueryList]
        attr_accessor :query_list
      
        # [Optional] Mapping of query variable names to values (equivalent to the Spark
        # SQL command: SET `name="value";`).
        # Corresponds to the JSON property `scriptVariables`
        # @return [Hash<String,String>]
        attr_accessor :script_variables
      
        # [Optional] A mapping of property names to values, used to configure Spark SQL'
        # s SparkConf. Properties that conflict with values set by the Cloud Dataproc
        # API may be overwritten.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,String>]
        attr_accessor :properties
      
        # [Optional] HCFS URIs of jar files to be added to the Spark CLASSPATH.
        # Corresponds to the JSON property `jarFileUris`
        # @return [Array<String>]
        attr_accessor :jar_file_uris
      
        # The runtime logging config of the job.
        # Corresponds to the JSON property `loggingConfig`
        # @return [Google::Apis::DataprocV1::LoggingConfig]
        attr_accessor :logging_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_file_uri = args[:query_file_uri] if args.key?(:query_file_uri)
          @query_list = args[:query_list] if args.key?(:query_list)
          @script_variables = args[:script_variables] if args.key?(:script_variables)
          @properties = args[:properties] if args.key?(:properties)
          @jar_file_uris = args[:jar_file_uris] if args.key?(:jar_file_uris)
          @logging_config = args[:logging_config] if args.key?(:logging_config)
        end
      end
      
      # Cloud Dataproc job status.
      class JobStatus
        include Google::Apis::Core::Hashable
      
        # [Required] A state message specifying the overall job state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # [Optional] Job state details, such as an error description if the state is
        # ERROR.
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        # [Output-only] The time when this state was entered.
        # Corresponds to the JSON property `stateStartTime`
        # @return [String]
        attr_accessor :state_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state = args[:state] if args.key?(:state)
          @details = args[:details] if args.key?(:details)
          @state_start_time = args[:state_start_time] if args.key?(:state_start_time)
        end
      end
      
      # A list of jobs in a project.
      class ListJobsResponse
        include Google::Apis::Core::Hashable
      
        # [Output-only] Jobs list.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::DataprocV1::Job>]
        attr_accessor :jobs
      
        # [Optional] This token is included in the response if there are more results to
        # fetch. To fetch additional results, provide this value as the `page_token` in
        # a subsequent ListJobsRequest.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jobs = args[:jobs] if args.key?(:jobs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # A request to cancel a job.
      class CancelJobRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated empty
      # messages in your APIs. A typical example is to use it as the request or the
      # response type of an API method. For instance: service Foo ` rpc Bar(google.
      # protobuf.Empty) returns (google.protobuf.Empty); ` The JSON representation for
      # `Empty` is empty JSON object ````.
      class Empty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The response message for Operations.ListOperations.
      class ListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::DataprocV1::Operation>]
        attr_accessor :operations
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @operations = args[:operations] if args.key?(:operations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # The location of diagnostic output.
      class DiagnoseClusterResults
        include Google::Apis::Core::Hashable
      
        # [Output-only] The Google Cloud Storage URI of the diagnostic output. This is a
        # plain text file with a summary of collected diagnostics.
        # Corresponds to the JSON property `outputUri`
        # @return [String]
        attr_accessor :output_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_uri = args[:output_uri] if args.key?(:output_uri)
        end
      end
      
      # Metadata describing the operation.
      class ClusterOperationMetadata
        include Google::Apis::Core::Hashable
      
        # Name of the cluster for the operation.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # Cluster UUId for the operation.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        # The status of the operation.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataprocV1::ClusterOperationStatus]
        attr_accessor :status
      
        # [Output-only] The previous operation status.
        # Corresponds to the JSON property `statusHistory`
        # @return [Array<Google::Apis::DataprocV1::ClusterOperationStatus>]
        attr_accessor :status_history
      
        # [Output-only] The operation type.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # [Output-only] Short description of operation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
          @status = args[:status] if args.key?(:status)
          @status_history = args[:status_history] if args.key?(:status_history)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @description = args[:description] if args.key?(:description)
        end
      end
      
      # The status of the operation.
      class ClusterOperationStatus
        include Google::Apis::Core::Hashable
      
        # A message containing the operation state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # A message containing the detailed operation state.
        # Corresponds to the JSON property `innerState`
        # @return [String]
        attr_accessor :inner_state
      
        # A message containing any operation metadata details.
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        # The time this state was entered.
        # Corresponds to the JSON property `stateStartTime`
        # @return [String]
        attr_accessor :state_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state = args[:state] if args.key?(:state)
          @inner_state = args[:inner_state] if args.key?(:inner_state)
          @details = args[:details] if args.key?(:details)
          @state_start_time = args[:state_start_time] if args.key?(:state_start_time)
        end
      end
      
      # The location where output from diagnostic command can be found.
      class DiagnoseClusterOutputLocation
        include Google::Apis::Core::Hashable
      
        # [Output-only] The Google Cloud Storage URI of the diagnostic output. This will
        # be a plain text file with summary of collected diagnostics.
        # Corresponds to the JSON property `outputUri`
        # @return [String]
        attr_accessor :output_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_uri = args[:output_uri] if args.key?(:output_uri)
        end
      end
      
      # Metadata describing the operation.
      class OperationMetadata
        include Google::Apis::Core::Hashable
      
        # A message containing the operation state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # A message containing the detailed operation state.
        # Corresponds to the JSON property `innerState`
        # @return [String]
        attr_accessor :inner_state
      
        # A message containing any operation metadata details.
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        # The time that the operation was requested.
        # Corresponds to the JSON property `insertTime`
        # @return [String]
        attr_accessor :insert_time
      
        # The time that the operation was started by the server.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # The time that the operation completed.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Name of the cluster for the operation.
        # Corresponds to the JSON property `clusterName`
        # @return [String]
        attr_accessor :cluster_name
      
        # Cluster UUId for the operation.
        # Corresponds to the JSON property `clusterUuid`
        # @return [String]
        attr_accessor :cluster_uuid
      
        # The status of the operation.
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::DataprocV1::OperationStatus]
        attr_accessor :status
      
        # [Output-only] Previous operation status.
        # Corresponds to the JSON property `statusHistory`
        # @return [Array<Google::Apis::DataprocV1::OperationStatus>]
        attr_accessor :status_history
      
        # [Output-only] The operation type.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # [Output-only] Short description of operation.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state = args[:state] if args.key?(:state)
          @inner_state = args[:inner_state] if args.key?(:inner_state)
          @details = args[:details] if args.key?(:details)
          @insert_time = args[:insert_time] if args.key?(:insert_time)
          @start_time = args[:start_time] if args.key?(:start_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @cluster_name = args[:cluster_name] if args.key?(:cluster_name)
          @cluster_uuid = args[:cluster_uuid] if args.key?(:cluster_uuid)
          @status = args[:status] if args.key?(:status)
          @status_history = args[:status_history] if args.key?(:status_history)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @description = args[:description] if args.key?(:description)
        end
      end
      
      # The status of the operation.
      class OperationStatus
        include Google::Apis::Core::Hashable
      
        # A message containing the operation state.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # A message containing the detailed operation state.
        # Corresponds to the JSON property `innerState`
        # @return [String]
        attr_accessor :inner_state
      
        # A message containing any operation metadata details.
        # Corresponds to the JSON property `details`
        # @return [String]
        attr_accessor :details
      
        # The time this state was entered.
        # Corresponds to the JSON property `stateStartTime`
        # @return [String]
        attr_accessor :state_start_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @state = args[:state] if args.key?(:state)
          @inner_state = args[:inner_state] if args.key?(:inner_state)
          @details = args[:details] if args.key?(:details)
          @state_start_time = args[:state_start_time] if args.key?(:state_start_time)
        end
      end
    end
  end
end
