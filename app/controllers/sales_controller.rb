class SalesController < ApplicationController
  def create
    @sale = Sale.new
    @album = Album.find(params[:album_id])

    @sale.user = current_user
    @sale.album = @album

    if @sale.save 
      redirect_to :root
    else
      render "albums/show"
    end
  end
end
