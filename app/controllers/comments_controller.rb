class CommentsController < ApplicationController

  def new
    @resource = Resource.find_by(id: params[:resource_id])
    @comment = @resource.comments.build
  end

  def create
    @resource = Resource.find_by(id: params[:resource_id])
    @comment = @resource.comments.build(comment_params)
    @comment.user = current_user
    if @resource.save
      redirect_to resource_path(@resource)
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to resource_path(@resource)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @resource = @comment.resource
    @comment.destroy if correct_user?
    redirect_to resource_path(@resource)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
