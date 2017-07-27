class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @resources = Resource.all
  end

end
