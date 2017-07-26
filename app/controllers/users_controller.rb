class UsersController < ApplicationController
  before_action :set_user

  def show
    if !current_user == @user
      redirect_to user_resources_path(@user)
    end
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end
end
