class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to course_path(@course)
    else
      flash[:error] = @course.errors.full_messages
      render new_course_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      flash[:error] = @course.errors.full_messages
      render :edit
    end

  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

    def set_course
      @course = Course.find_by(id: params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :description, language_ids: [], user_ids: [], :resource_ids => [])
    end

end
