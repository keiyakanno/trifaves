class HomeController < ApplicationController
  def index
    @feed_favorites = Favorite.all.limit(20)
  end

  def show
  end
end