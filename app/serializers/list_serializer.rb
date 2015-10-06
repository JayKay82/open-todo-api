class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :permissions, :user

  def name
    object.name
  end

  def permissions
    object.permissions
  end

  def user
    object.user
  end
end
