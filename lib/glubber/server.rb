require 'sinatra/base'

module Glubber
  class Server
    # Find all available template files
    def self.find_files()
      old_directory = Dir.pwd

      template_directory = File.dirname(__FILE__) + "/../../templates/"

      Dir.chdir template_directory

      tpl_files = Dir.glob(File.join("**", "*.html.*"))

      # Go back to the original directory, just in case
      Dir.chdir old_directory

      tpl_files
    end

    # Start the server
    def serve!()
      server = Sinatra.new do

        # Home path:
        # list all the files
        get '/' do
          erb :index, :locals => {:tpl_files => Server::find_files}
        end

        # All other paths:
        # Try to match it to a file
        get /(.+)/ do
          path = params['captures'].first

          # Remove the slash at the start,
          # because our list of files has
          # no starting slashes
          path[0] = ''

          tpl_files = Server::find_files

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
