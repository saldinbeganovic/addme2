class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2]

  has_one_attached :image, dependent: :destroy

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |account|
      account.email = provider_data.info.email
      account.password = Devise.friendly_token[0, 20]
    end
  end

  has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy

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
