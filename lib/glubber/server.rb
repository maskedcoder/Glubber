require 'sinatra/base'

module Glubber
  class Server

    def initialize()
      self.findFiles!
    end

    # Find all available template files
    def findFiles!()
      oldDirectory = Dir.pwd

      templateDirectory = File.dirname(__FILE__) + "/../../templates/"

      Dir.chdir templateDirectory

      @tplFiles = Dir.glob(File.join("**", "*.html.*"))

      # Go back to the original directory, just in case
      Dir.chdir oldDirectory

      @tplFiles
    end

    # Start the server
    def serve!()
      tplFiles = @tplFiles

      server = Sinatra.new do

        # Home path:
        # list all the files
        get '/' do
           tplFiles.join ", "
        end

        # All other paths:
        # Try to match it to a file
        get /(.+)/ do

          path = params['captures'].first

          # Remove the slash at the start,
          # because our list of files has
          # no starting slashes
          path[0] = ''

          if tplFiles.include? path
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
