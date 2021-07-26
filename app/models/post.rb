class Post < ApplicationRecord
  belongs_to :customer
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :title, presence: true
	validates :keyword, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  attachment :image
end