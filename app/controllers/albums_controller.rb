class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = policy_scope(Album)

    if params[:query].present?
      # @albums = Album.where("title ILIKE ?", "%#{params[:query]}%")
      @albums = Album.search_by_title(params[:query])
    end
  end

  def my_albums
    @sales = current_user.sales
    @my_albums = Album.new

    if @sales.empty? || current_user.role == "artist"
      @my_albums = current_user.albums
    end

    authorize @my_albums
  end

  def show
    @sale = Sale.new
  end

  def edit
    @music = Music.new
  end

  def update
      if @album.update(album_params)
        redirect_to @album, notice: 'Album updated!'
      else
        render :edit
      end
  end

  def new
    @album = Album.new
    @user = current_user

    @album.user = @user

    authorize @album
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

    authorize @album
  end

  def destroy
    @album.destroy

    redirect_to :root
  end

  private

  def set_album
    @album = Album.find(params[:id])

    authorize @album
  end

  def album_params
    params.require(:album).permit(:title, :price, :photo)
  end
end
