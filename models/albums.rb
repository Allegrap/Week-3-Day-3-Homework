require('pg')
require_relative('../db/sql_runner')
require_relative('artists')

class Albums

attr_reader :id, :name, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO music_collection (
    name,
    genre,
    artist_id
    ) VALUES (
    '#{@name}'
    '#{@genre}'
    #{@artist_id})
    RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end



end