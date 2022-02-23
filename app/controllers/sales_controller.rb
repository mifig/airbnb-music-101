class SalesController < ApplicationController
  def create
    @sale = Sale.new(sale_params)
    @album = Album.find(params[:album_id])

    @sale.user = current_user
    @sale.album = @album

    if @sale.save 
      redirect_to my_albums_path
    else
      render "albums/show"
    end

    authorize @sale
  end

  private

  def sale_params
    params.require(:sale).permit(:address)
  end
end
