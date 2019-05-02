class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to "/artists/#{artist.id}"
  end

  def show
  end

  private

  def artist_params
    #add this for strong params/security reasons
    params.require(:artist).permit(:name)
  end
end
