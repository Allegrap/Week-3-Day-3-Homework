require('pg')
require_relative('../db/sql_runner')
require_relative('albums')

class Artists

  attr_reader :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end


end