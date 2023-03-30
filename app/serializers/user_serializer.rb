class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :user_name, :email
end
