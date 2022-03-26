class HomeController < ApplicationController
  def index
    flash[:notice] = "Hi, There!"
  end
end
