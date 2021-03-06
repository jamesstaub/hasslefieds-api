class PostSerializer < ActiveModel::Serializer
  #explicityly list the resource attributes we want to expose via our API
  attributes :id, :title, :body, :reply_count, :user, :start_date, :end_date, :imgurl #, :can_delete
  # this will exclude the date created columns from our api

  has_many :replies

  def reply_count
    # object is the current post we're representing
    # this is a virtual attribute because we're not adding reviews count to our database, we just render it with logic
    # this is known as a presenter pattern
    object.replies.count
  end

  def user
    user = object.user
     {username: user.username, id: user.id, token: user.token}
  end

  def can_delete
   # current_user
    # true if scope.current_user.can_edit?(object)
    # object.user == current_user
  end

  def imgurl
# concat amazon url with image file name
  end

end

