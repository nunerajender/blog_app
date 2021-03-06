class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :comments
has_many :posts

def self.from_omniauth(auth)
  where(:uid => auth.uid, :provider => auth.provider).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.username = auth.info.nickname
    user.email = auth.info.email
  end
end



def password_required?
  super && provider.blank?
end

def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end
end
