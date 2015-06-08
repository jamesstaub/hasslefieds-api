class ReplySerializer < ActiveModel::Serializer
  #explicityly list the resource attributes we want to expose via our API
  attributes :id, :body, :format_date, :username, :user_id, :post_id
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

  def user_id
    ui = User.find_by id: object.user_id
    ui.id
  end

  #attaching each users id to their respective posts and comments is probably a bad idea but i can't get the current_user in the scope of the serializer so it's a hack!

end
