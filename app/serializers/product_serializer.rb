class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :price
end
