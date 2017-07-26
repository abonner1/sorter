class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :resource_id
  belongs_to :user, serializer: CommentUserSerializer
end
