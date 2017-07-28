class CommentsController < ApplicationController
  before_action :set_resource, only: [ :new, :create]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @comment = @resource.comments.build
  end

  def create
    @comment = @resource.comments.build(comment_params)
    @comment.user = current_user
    if @resource.save
      respond_to do |f|
        f.html {redirect_to resource_path(@resource)}
        f.json {render json: @comment}
      end

    else
      flash[:error] = @comment.errors.full_messages
      redirect_to resource_path(@resource)
    end
  end

  def edit
    if !correct_user?(@comment)
      redirect_to resource_path(@comment.resource)
    end
  end

  def update
    if @comment.update(comment_params) && correct_user?(@comment)
      redirect_to resource_path(@comment.resource)
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to edit_comment_path(@comment)
    end
  end

  def destroy
    @resource = @comment.resource
    @comment.destroy if correct_user?(@comment)
    respond_to do |f|
      f.html {redirect_to resource_path(@resource)}
      f.json {render json: @comment}
    end
  end

  private

    def set_resource
      @resource = Resource.find_by(id: params[:resource_id])
    end

    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

end
