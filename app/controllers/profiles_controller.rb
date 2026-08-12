class ProfilesController < ApplicationController

  def show
    @name = "Yogitha"
    @email = "yogithakilari@gmail.com"
  end

  def new
  end

  def create
    flash[:notice] = "Profile Created."

    redirect_to profile_path
  end

  def edit
  end

  def update
    flash[:notice] = "Profile Updated."

    redirect_to profile_path
  end

end