
class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :replies, through: :posts

  has_secure_password #adds :authenticate to the model

  before_create :set_token
  # before create completes, ie, before a new user get's created, set the secure token
  after_find :fix_up_token

  validates :email, uniqueness: true

  def authenticate_with_new_token(password)
    authenticate_without_new_token(password) && new_token
  end

  alias_method_chain :authenticate, :new_token
  # calling :authenticate in the above line first invokes the authenticate_with_new_token method on line 10

  private
  # potential bug! it's possible that the same number gets generated twice. to fix you could set a validation "until !exist generate random"
  def set_token
    self.token = SecureRandom.hex(16)
  end

# unconditionally create and set a new token
# this will invalid an existing users token and creaete a new one
  def new_token
    update_columns(token: set_token)
  end

# expire old token every day
  def fix_up_token
# FIX THIS: token age should be configurable
    new_token if updated_at < 1.day.ago
  end

end
