class AlbumsController < ApplicationController
  def index
    if params[:query].present?
      @albums = Album.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @albums = Album.all
    end
  end

  def my_albums
    @sales = current_user.sales

    if !@sales.empty?
      @my_albums =  []
      @sales.each do |sale|
        @my_albums << sale.album
      end
    elsif 
      @my_albums = current_user.albums
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
    @music = Music.new
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
