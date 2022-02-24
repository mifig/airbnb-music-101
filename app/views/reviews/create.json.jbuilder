if @review.persisted?
  json.reviewform json.partial!("reviews/partials/reviewform.html.erb", album: @album, review: Review.new)
  json.review json.partial!("albums/partials/review.html.erb", review: @review)
else
  json.reviewform json.partial!("reviews/partials/reviewform.html.erb", album: @album, review: @review)
end
