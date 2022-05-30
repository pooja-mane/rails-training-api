module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :name, :mobile_number
    end
  end
end
