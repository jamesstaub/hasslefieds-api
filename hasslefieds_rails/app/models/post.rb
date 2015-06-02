class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies, through: :users,  dependent: :destroy

  has_attached_file :post_image,
              :styles => { :large => "510x510#", :medium => "250x250#" },
              :processors => [:thumbnail],
              storage: :s3,
              path: "/:style/:id/:filename",
              s3_credentials: {
                bucket: ENV['S3_BUCKET'],
                :access_key_id => ENV['ACCESS_KEY'],
                :secret_access_key => ENV['SECRET_KEY']
              }

# validates :post_image, presence: true
validates_attachment_content_type :post_image, :content_type => /\Aimage\/.*\Z/
validates_with AttachmentSizeValidator, :attributes => :post_image, :less_than => 100.megabytes
end

