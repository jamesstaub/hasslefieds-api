class ReplySerializer < ActiveModel::Serializer
  #explicityly list the resource attributes we want to expose via our API
  attributes :id, :body, :user, :created_at
  # this will exclude the date created columns from our api

  has_one :user



end
