class AuthorsController < ApplicationController

  def index
    render plain: "Authors Page using Scope"
  end

end