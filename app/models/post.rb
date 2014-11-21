class Post < ActiveRecord::Base
  has_many :comments
belongs_to :user
  validates :title,   presence: false
  validates :body, presence: false

end
