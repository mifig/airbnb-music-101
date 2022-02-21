class MusicsController < ApplicationController
  def create
    if current_user.role == "artist"
      @album = Album.find_by_id(params[:album_id])
      @music = Music.new(music_params)
      @music.album = @album

      if @music.save
        redirect_to album_path(@album)
      else
        render "albums/show"
      end
    end
  end

  def destroy 
    @music = Music.find(params[:id])
    @music.destroy

    redirect_to edit_album_path(@music.album.id)
  end

  private

  def music_params
    params.require(:music).permit(:name, :audio)
  end
end
