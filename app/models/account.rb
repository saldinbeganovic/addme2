class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  has_many :posts
    has_many :likes

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_followers
   Follower.where(following_id: self.id).count
  end

  def total_following
    Follower.where(follower_id: self.id).count
  end



end
