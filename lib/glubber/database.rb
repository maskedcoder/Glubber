require 'data_mapper'
require 'dm-sqlite-adapter'
require 'dm-validations'

$modelRegistry = []

module Glubber
  class Database

    def initialize()
      DataMapper::Logger.new($stdout, :debug)
      DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/pages.db")

      self.loadModels
    end

    def loadModels()
      # Load all build-in models
      Dir[File.dirname(__FILE__) + '/models/*.rb'].each do |file|
        require file
      end

      # Presumably we should load all user-created models, too

      # Perform checks and do associations
      DataMapper.finalize

      # Create tables if necessary
      $modelRegistry.each do |model|
        model.auto_upgrade!
      end
    end

  end
end
