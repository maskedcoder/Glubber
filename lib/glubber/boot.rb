require_relative "database"
require_relative "server"

module Glubber
  def self.go!
    # Start the database
    db = Database.new

    # Run the server
    server = Server.new
    server.serve!
  end
end
