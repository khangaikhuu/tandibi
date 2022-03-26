class HomeController < ApplicationController
  def index
    flash[:alert] = "Hi, There!"
  end
end
