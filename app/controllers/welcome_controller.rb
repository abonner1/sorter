class WelcomeController < ApplicationController

  def home
    @resources = Resource.all
  end

end
