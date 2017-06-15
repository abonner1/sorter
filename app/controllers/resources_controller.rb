class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.all
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
    @resource.destroy
    redirect_to root_path
  end

  private

    def set_resource
      @resource = Resource.find_by(params[:id])
    end

end
