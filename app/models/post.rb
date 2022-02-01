class Post < ApplicationRecord
  default_scope {order created_at: :desc}
has_one_attached :image
belongs_to :account
has_many :likes




before_create :set_active

scope :active, -> {where active: true}


def set_active
  self.active = true
end

def total_likes
  69
end
end
