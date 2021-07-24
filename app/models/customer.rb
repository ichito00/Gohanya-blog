class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def follow(customer_id) 
    relationships.create(followed_id: customer_id)
  end
  
  def unfollow(customer_id) 
    relationships.find_by(followed_id: customer_id).destroy
  end
  
  def following?(customer) 
    followings.include?(customer)
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  attachment :image
end
