class LanguageSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :resources, Serializer: ResourceSerializer
end
