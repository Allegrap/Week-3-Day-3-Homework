require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}')RETURNING *"
    @id = SqlRunner.run(sql).first()['artist_id'].to_i
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run(sql)
    return Album.new(result.first)
  end

end