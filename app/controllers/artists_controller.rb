class ArtistsController < ApplicationController
  def new
  end

  def create
  end

  private

  def artist_params
    #add this for strong params/security reasons
    params.require(:artist).permit(:name)
  end
end
