require 'yaml'

module Glubber
  class MasterParser

    def self.parse(filename)
      YAML.load_file(filename)
    end
  end
end
