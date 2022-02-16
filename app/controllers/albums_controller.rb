class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @user = current_user

    @album.user = @user
  end

  def create
    @album = Album.new(album_params)
    @user = current_user

    @album.user = @user

    if @album.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  def destroy
    @album = Album.find(:id)

    @album.destroy

    redirect_to :root
  end

  private

  def album_params
    params.require(:album).permit(:title, :price, :photo, :user_id)
  end
end
