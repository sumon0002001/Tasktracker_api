class StaticPageController < ApplicationController
  def home
    render json: 'This is working'
  end
end
