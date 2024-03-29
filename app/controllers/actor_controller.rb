class ActorController < ApplicationController

  def get_all
    @all = Actor.pluck(:id, :name)
    @route = 'actors'
    render({ :template => "misc_templates/list" })

  end

  def get_actor
    id = params["actor_id"].to_i
    actor = Actor.find(id)
    @name = actor.name
    @dob = actor.dob

    characters = Character.where(actor_id: id)
    @names = []
    @directors = []
    for char in characters
      @names.push(char.name)
      movie = Movie.where(id: char.movie_id)[0]
      director = Director.where(id: movie.director_id)[0].name
      @directors.push(director)
    end

    render({ :template => "misc_templates/single_actor" })
  end
end
