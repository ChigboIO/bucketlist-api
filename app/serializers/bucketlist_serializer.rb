class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_created, :date_modified

  has_many :items

  def date_created
    # Date.parse(object.created_at).strftime("%Y-%m-%d %l:%M %P")
    object.created_at
  end

  def date_modified
    # Date.parse(object.updated_at).strftime("%Y-%m-%d %l:%M %P")
    object.updated_at
  end
end
