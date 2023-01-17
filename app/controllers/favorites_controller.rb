class FavoritesController < ApplicationController
  def create
    @video = params[:id]
  end
end
