class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_created, :date_modified, :created_by

  has_many :items

  def date_created
    DateTime.parse(object.created_at.to_s).
      strftime("%Y-%m-%d %l:%M %P").in_time_zone
  end

  def date_modified
    DateTime.parse(object.updated_at.to_s).
      strftime("%Y-%m-%d %l:%M %P").in_time_zone
  end

  def created_by
    "#{object.user.name} (#{object.user.email})"
  end
end
