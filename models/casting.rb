require_relative("../db/sql_runner")

class Casting

  attr_accessor :movie_id, :star_id, :fee
  attr_reader :id


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee'].to_i
  end

end
