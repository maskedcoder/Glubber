require 'sinatra/base'
require 'yaml'
require 'pp'

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

    # Find all the variables connected with a template
    def self.load_variables(template)
      # Remove file extension
      template_name = template.gsub(/(\.\w+)+$/, '')

      # Hard-coded file that contains all variable data
      # This may change in the future
      master_file = File.dirname(__FILE__) + "/../../templates/master.yml"

      all_variable_data = YAML.load_file master_file

      # Load the specific template's data and copy in global variables
      template_data = (all_variable_data[template_name] || []) + (all_variable_data['GLOBAL'] || [])

      template_data.each do |variable|
        # For now just use GlubberTitle because we
        # don't have any other models yet
        variable['model'] = GlubberTitle.new
      end

      template_data
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
            erb :edit, :locals => {
              :file => path,
              :variables => Server::load_variables(path),
              :files => tpl_files
            }
          else
            'Not found on the server: ' + path
          end
        end
      end

      server.run!
    end
  end
end
