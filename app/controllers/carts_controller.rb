class CartsController < ApplicationController
  def create
    song = Song.find(params[:song_id])
    song_id_string = params[:song_id].to_s

    session[:cart] ||= {}
    session[:cart][song_id_string] ||= 0
    session[:cart][song_id_string] = session[:cart][song_id_string] + 1
    quantity = session[:cart][song_id_string]
    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{song.title} in your cart."
    redirect_to songs_path
  end
end
