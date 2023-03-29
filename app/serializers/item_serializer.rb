class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :category, :imgURL
end
