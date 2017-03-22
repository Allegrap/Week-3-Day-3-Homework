require('pry')
require_relative('models/album')
require_relative('models/artist')

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({'name' => 'James Blake'})
artist2 = Artist.new({'name' => 'Allegra'})
artist3 = Artist.new({'name' => 'Banana'})
artist1.save()
artist2.save()
artist3.save()



album1 = Album.new({
  'name' => 'the colour in anything',
  'genre' => 'R&B',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'name' => 'fizzy water',
  'genre' => 'gangsta rap',
  'artist_id' => artist2.id
  })

album3 = Album.new({
  'name' => 'banana things',
  'genre' => 'deep house',
  'artist_id' => artist3.id
  })

album1.save()
album2.save()
album3.save()



binding.pry
nil