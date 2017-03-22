require('pg')
require_relative('../console')
require_relative('artists')

class Albums

attr_reader :id, :name, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end




end