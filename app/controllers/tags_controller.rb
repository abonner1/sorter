class TagsController < ApplicationController
  def show
    @topic = Tag.find_by(id: params[:id])
  end
end
