class Subscription < ApplicationRecord
	has_many :users_subscriptions
	has_many :users, through: :users_subscriptions
end
