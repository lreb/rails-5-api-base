class User < ApplicationRecord
	has_secure_password
	validates_presence_of :email, :password, :password_confirmation
	has_many :users_subscriptions
	has_many :subscriptions, through: :users_subscriptions
end
