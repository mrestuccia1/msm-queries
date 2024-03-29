class DirectorController < ApplicationController

  def get_youngest
    youngest = Director.where.not(dob: nil).order(dob: :desc).limit(1).first
    @name = youngest.name
    render({ :template => "misc_templates/one" })
  end

  def get_oldest
    oldest = Director.where.not(dob: nil).order(:dob).limit(1).first
    @name = oldest.name
    render({ :template => "misc_templates/one" })
  end

  def get_all
    @all = Director.pluck(:id, :name)
    @route = 'directors'
    render({ :template => "misc_templates/list" })

  end

  def get_director
    id = params["director_id"].to_i
    director = Director.find(id)
    @name = director.name
    @dob = director.dob
    @bio = director.bio
    @movies = Movie.where(director_id: id)
    render({ :template => "misc_templates/single" })
  end
end
