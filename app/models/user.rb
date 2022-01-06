class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    enum role: {
       admin: 0,
       seller: 1,
       buyer: 2 
      }
    has_many :products, dependent: :destroy
    has_many :product_variants, dependent: :destroy
    has_many :orders, as: :ordered, dependent: :destroy
    has_many :services, dependent: :destroy
    validates_uniqueness_of :email
    has_many :wishlists




end
