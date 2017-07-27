class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :description, :user_id
  has_many :tags, serializer: ResourceTagSerializer
  has_many :languages, serializer: ResourceLanguageSerializer
end
