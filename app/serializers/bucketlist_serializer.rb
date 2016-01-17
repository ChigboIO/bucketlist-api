class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_created, :date_modified, :created_by

  has_many :items
  # has_one :user

  def date_created
    # Date.parse(object.created_at).strftime("%Y-%m-%d %l:%M %P")
    object.created_at
  end

  def date_modified
    # Date.parse(object.updated_at).strftime("%Y-%m-%d %l:%M %P")
    object.updated_at
  end

  def created_by
    "#{object.user.name} (#{object.user.email})"
  end
end
