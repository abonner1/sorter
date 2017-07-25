class CommentsController < ApplicationController

  def new
    @resource = Resource.find_by(id: params[:resource_id])
    @comment = @resource.comments.build
  end

  def create
    @resource = Resource.find_by(id: params[:resource_id])
    @comment = @resource.comments.build(comment_params)
    @comment.user = current_user
    raise @comment.inspect
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
