class DirectorController < ApplicationController

  def get_youngest
    youngest = Director.where.not(dob: nil).order(dob: :desc).limit(1).first
    @name = youngest.name
    render({ :template => "misc_templates/list" })
  end

  def get_oldest
    oldest = Director.where.not(dob: nil).order(:dob).limit(1).first
    @name = oldest.name
    render({ :template => "misc_templates/list" })
  end

  def get_all
  end

  def get_director
  end
end
