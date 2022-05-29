class CamperSerializer < ActiveModel::Serializer
  attributes :name, :age
  has_many :activities
end
