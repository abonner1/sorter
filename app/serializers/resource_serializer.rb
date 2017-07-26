class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :description, :user_id
  has_many :tags, scaerializer: ResourceTagSerializer
end
