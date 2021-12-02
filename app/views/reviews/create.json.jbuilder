if @review.persisted?
  json.modal json.partial!('restaurants/modal_new.html.erb',
    restaurant: @restaurant, review: Review.new)
  json.inserted_item json.partial!('restaurants/review.html.erb',
  review: @review)
else
  json.form json.partial!('restaurants/feedback_form.html.erb',
  restaurant: @restaurant, review: @review)
end
