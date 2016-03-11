require 'sinatra/base'

module Glubber
  class Server
    def initialize()
      self.find_files!
    end

    # Find all available template files
    def find_files!()
      old_directory = Dir.pwd

      template_directory = File.dirname(__FILE__) + "/../../templates/"

      Dir.chdir template_directory

      @tplFiles = Dir.glob(File.join("**", "*.html.*"))

      # Go back to the original directory, just in case
      Dir.chdir old_directory

      @tplFiles
    end

    # Start the server
    def serve!()
      tpl_files = @tplFiles

      server = Sinatra.new do

        # Home path:
        # list all the files
        get '/' do
           tpl_files.join ", "
        end

        # All other paths:
        # Try to match it to a file
        get /(.+)/ do
          path = params['captures'].first

          # Remove the slash at the start,
          # because our list of files has
          # no starting slashes
          path[0] = ''

          if tpl_files.include? path
            'Hello from ' + path
          else
            'Not found on the server: ' + path
          end
        end
      end

      server.run!
    end
  end
end
