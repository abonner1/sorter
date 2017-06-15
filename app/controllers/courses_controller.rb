class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

    def set_course
      @course = Course.find_by(id: params[:id])
    end

end
