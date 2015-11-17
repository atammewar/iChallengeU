class ExercisesController < ApplicationController

  layout false

  def index
    @exercises = Exercise.newest_first.paginate(:page => params[:page])
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end
end
