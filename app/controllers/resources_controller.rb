class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @user = current_user
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.add_user(current_user)
    if @resource.save
      redirect_to root_path
    else
      flash[:error] = @resource.errors.full_messages
      redirect_to new_user_resource_path
    end
  end

  def show
    @comment = @resource.comments.build
  end

  def edit
    if !correct_user?(@resource)
      flash[:alert] = "You are not allowed to edit this resource!"
      redirect_to resource_path(@resource)
    end
  end

  def update
    if @resource.update(resource_params) && correct_user?(@resource)
      redirect_to resource_path(@resource)
    else
      flash[:error] = @resource.errors.full_messages
      redirect_to edit_resource_path(@resource)
    end
  end

  def destroy
    @resource.destroy if correct_user?(@resource)
    redirect_to root_path
  end

  private

    def set_resource
      @resource = Resource.find_by(id: params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :url, :description,
      :favorited, :language_ids => [],  :tag_ids => [], :tags_attributes => [:name])
    end

end
