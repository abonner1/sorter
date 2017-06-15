class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :destroy]

  def new
    @language = Language.new
  end

  def create
    @language = Language.create(language_params)
    redirect_to(@language)
  end

  def show
  end

  def destroy
    @language.destroy
    redirect_to root_path
  end

  private

    def set_language
      @language = Language.find_by(id: params[:id])
    end

    def language_params
      params.require(:langauge).permit(:name)
    end

end
