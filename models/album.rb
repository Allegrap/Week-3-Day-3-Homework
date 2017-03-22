require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

attr_reader :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map{|album| Album.new(album)}
  end

  def self.delete()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO albums (
    name,
    genre,
    artist_id
    ) VALUES (
    '#{@name}',
    '#{@genre}',
    #{@artist_id})
    RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

  def update()
    sql = "UPDATE albums 
    SET (
    name, 
    genre,
    artist_id) = ( 
    '#{@name}', 
    '#{@genre}',
    #{@artist_id})
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    result = SqlRunner.run(sql)
    return Artist.new(result.first)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end


end