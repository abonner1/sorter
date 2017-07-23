class HomeController < ApplicationController

  def index
    @resources = Resource.all
  end

end
