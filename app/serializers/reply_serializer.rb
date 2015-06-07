class ReplySerializer < ActiveModel::Serializer
  #explicityly list the resource attributes we want to expose via our API
  attributes :id, :body, :format_date, :username
  # this will exclude the date created columns from our api

  # has_one :user
  # has_one :post

  def format_date
    object.created_at.strftime("%b %d, %Y")
  end

  def username
    un = User.find_by id: object.user_id
    un.username
  end

end
