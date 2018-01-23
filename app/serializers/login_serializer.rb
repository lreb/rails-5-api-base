class LoginSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :user_name, :active
end
