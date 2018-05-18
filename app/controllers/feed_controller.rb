class FeedController < ApplicationController
  def feed
    @recipes = Recipe.all
  end
end
