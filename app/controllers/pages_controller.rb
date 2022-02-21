class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @albums = Album.all

    if user_signed_in?
      if current_user.role == "artist"
        @user_albums = current_user.albums
      else
        @sales = current_user.sales
        if !@sales.empty?
          @user_albums =  []
          @sales.each do |sale|
            @user_albums << sale.album
          end
        else
          @user_albums = []
        end
      end
    end
  end
end
