require('pry')
require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

movie1 = Movie.new({'title' => 'Toy Story', 'genre' => 'family'})
movie1.save

star1 = Star.new({'first_name' => 'Tom', 'last_name' => "Hanks"})
star1.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 100})
casting1.save


binding.pry
nil
