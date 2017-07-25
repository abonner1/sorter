class TagsController < ApplicationController
  before_action :set_tag

  def show
  end

  def destroy
    @tag.destroy
    redirect_to root_path
  end

  private

    def set_tag
      @tag = Tag.find_by(id: params[:id])
    end
end
