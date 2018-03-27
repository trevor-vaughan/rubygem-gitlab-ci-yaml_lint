module Gitlab
  module Ci
    module YamlLint
      require "yaml"
      require "active_support"
      require "active_support/core_ext"
      require "active_support/concern"
      require "active_model"

      require "chronic_duration"

      require "gitlab/ci/config"
      require "gitlab/ci/config/loader"
      require "gitlab/ci/config/entry/legacy_validation_helpers"
      require "gitlab/ci/config/entry/node"
      require "gitlab/ci/config/entry/configurable"
      require "gitlab/ci/config/entry/validatable"
      require "gitlab/ci/config/entry/script"
      require "gitlab/ci/config/entry/factory"
      require "gitlab/ci/config/entry/image"
      require "gitlab/ci/config/entry/service"
      require "gitlab/ci/config/entry/services"
      require "gitlab/ci/config/entry/variables"
      require "gitlab/ci/config/entry/stages"
      require "gitlab/ci/config/entry/attributable"
      require "gitlab/ci/config/entry/key"
      require "gitlab/ci/config/entry/boolean"
      require "gitlab/ci/config/entry/paths"
      require "gitlab/ci/config/entry/cache"
      require "gitlab/ci/config/entry/global"
      require "gitlab/ci/config/entry/validators"
      require "gitlab/ci/config/entry/validator"
      require "gitlab/ci/config/entry/unspecified"
      require "gitlab/ci/config/entry/undefined"
      require "gitlab/ci/config/entry/commands"
      require "gitlab/ci/config/entry/stage"
      require "gitlab/ci/config/entry/simplifiable"
      require "gitlab/ci/config/entry/policy"
      require "gitlab/ci/config/entry/artifacts"
      require "gitlab/ci/config/entry/environment"
      require "gitlab/ci/config/entry/coverage"
      require "gitlab/ci/config/entry/job"
      require "gitlab/ci/config/entry/jobs"
      require "gitlab/ci/config/entry/hidden"
      require "gitlab/ci/yaml_processor"

      def self.validate(gitlab_ci_config)
        unless gitlab_ci_config
          $stderr.puts('Error: You must specify the path to a .gitlab-ci.yml')
          return 1
        end

        gitlab_ci_config = File.absolute_path(gitlab_ci_config)

        unless File.readable?(gitlab_ci_config)
          $stderr.puts("Error: Could not find file at '#{gitlab_ci_config}'")
          return 1
        end

        begin
          Gitlab::Ci::YamlProcessor.new(File.read(gitlab_ci_config))
        rescue StandardError => e
          $stderr.puts("Invalid: #{gitlab_ci_config}")
          $stderr.puts("  * #{e}")
          return 1
        end

        $stdout.puts("OK: #{gitlab_ci_config}")
        return 0
      end
    end
  end
end
