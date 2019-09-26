require_relative("../db/sql_runner")

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies
    (title, genre)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@title, @genre]
    id_hash = SqlRunner.run(sql, values).first
    @id = id_hash['id'].to_i
  end

end
