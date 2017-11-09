class User < ApplicationRecord
	has_secure_password
	has_many :users_subscriptions
	has_many :subscriptions, through: :users_subscriptions
end
