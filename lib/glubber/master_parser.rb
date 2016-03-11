require 'yaml'

module Glubber
  class MasterParser
    def parse(filename)
      YAML.load_file(filename)
    end
  end
end
