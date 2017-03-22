require('pry')
require_relative('models/album')
require_relative('models/artist')


artist1 = Artist.new({'name' => 'James Blake'})
artist1.save()


# album1 = Album.new({
#   'name' => 'the colour in anything',
#   'genre' => 'R&B',
#   'artist_id' => 
#   })

# album1.save()
