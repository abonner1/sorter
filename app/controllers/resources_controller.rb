class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      render root_path
    else
      flash[:error] = @resource.errors.full_messages
      redirect_to new_resource_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @resource.update(resource_params)
      render resource_path(@resource)
    else
      flash[:error] = @resource.errors.full_messages
      redirect_to edit_resource_path(@resource)
    end
  end

  def destroy
    @resource.destroy
    redirect_to root_path
  end

  private

    def set_resource
      @resource = Resource.find_by(id: params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :url, :description, :language_id, :user_id, :topic_ids => [], :topics_attributes => [:name])
    end

end
