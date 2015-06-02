class User < ActiveRecord::Base
   has_many :posts, dependent: :destroy
   has_many :replies, through: :post, dependent: :destroy
end
