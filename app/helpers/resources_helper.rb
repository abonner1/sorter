module ResourcesHelper

  def correct_user
    !!(current_user == @resource.user)
  end

end
