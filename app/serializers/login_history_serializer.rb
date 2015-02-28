class LoginHistorySerializer < ActiveModel::Serializer
  attributes :id, :active, :user_id, :login_token
end
