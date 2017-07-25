class ResourcesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = @user.resources
    respond_to do |f|
      f.html {user_resources_path(@user)}
      f.json {render json: @resources}
    end
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.add_user(@user)
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

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def set_resource
      @resource = Resource.find_by(id: params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :url, :description,
      :favorited, :language_ids => [],  :tag_ids => [], :tags_attributes => [:name])
    end

end
