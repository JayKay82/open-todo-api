class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :permissions

  def name
    object.name
  end

  def permissions
    object.permissions
  end
end
