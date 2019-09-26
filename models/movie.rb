require_relative("../db/sql_runner")

class Movie

  attr_accessor :title, :genre
  attr_reader :id 

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

end
