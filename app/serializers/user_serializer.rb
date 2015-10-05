class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password
  
  def username
    object.username
  end

  def password
    object.password
  end
end
