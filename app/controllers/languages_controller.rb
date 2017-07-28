class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :destroy]

  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      redirect_to(@language)
    else
      flash[:error] = @language.errors.full_messages
      render new_language_path
    end
  end

  def show
    respond_to do |f|
      f.html {@language}
      f.json {render json: @language, include: {resources: [languages: [] , tags: []]}}
    end
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
      params.require(:language).permit(:name, :description)
    end

end
