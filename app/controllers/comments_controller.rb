class CommentsController < ApplicationController

  def new
    @resource = Resource.find_by(id: params[:resource_id])
    @comment = @resource.comments.build
  end

end
