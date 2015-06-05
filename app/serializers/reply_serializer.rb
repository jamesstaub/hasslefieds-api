class ReplySerializer < ActiveModel::Serializer
  #explicityly list the resource attributes we want to expose via our API
  attributes :id, :body, :user, :format_date
  # this will exclude the date created columns from our api

  has_one :user

  def format_date

    object.created_at.strftime("%b %d, %Y")
  end

end
