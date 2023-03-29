class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :user_name, :email, :created_at
end
