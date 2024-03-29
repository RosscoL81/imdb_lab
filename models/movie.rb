require_relative("star")
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

  def update()
    sql = "UPDATE movies SET (title, genre)
    = ($1, $2)
    WHERE
    id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def stars()
    sql = "SELECT stars.*
    FROM stars
    INNER JOIN castings
    ON stars.id = castings.star_id
    WHERE castings.movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    return stars.map{|star| Star.new(star)}
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return movies.map{|movie| Movie.new(movie)}
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end



end
