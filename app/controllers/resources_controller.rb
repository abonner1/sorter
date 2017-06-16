class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    params[:course_id] ? @resource = Resource.new(course_ids: params[:course_id]) : @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to root_path
    else
      flash[:error] = @resource.errors.full_messages
      render new_resource_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @resource.update(resource_params) && correct_user
      redirect_to resource_path(@resource)
    else
      flash[:error] = @resource.errors.full_messages
      render :edit
    end
  end

  def destroy
    @resource.destroy if correct_user
    redirect_to root_path
  end

  private

    def set_resource
      @resource = Resource.find_by(id: params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :url, :description, :language_id,
      :user_id, :favorited, :course_ids => [], :topic_ids => [],
      :topics_attributes => [:name])
    end

end
