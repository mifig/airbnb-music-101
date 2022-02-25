class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @album = Album.find(params[:album_id])
    
    @review.user = current_user
    @review.album = @album
    
    authorize @review

    respond_to do |format|
      if @review.save
        format.html { redirect_to albums_path(@album, anchor: "review-#{@review.id}") }
        format.json
      else
        format.html { render "albums/show" }
        format.json
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @album = @review.album

    authorize @review

    @review.destroy

    redirect_to album_path(@album)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
