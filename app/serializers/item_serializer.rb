class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_created, :date_modified, :done

  def date_created
    DateTime.parse(object.created_at.to_s).
      strftime("%Y-%m-%d %l:%M %P").in_time_zone
  end

  def date_modified
    DateTime.parse(object.updated_at.to_s).
      strftime("%Y-%m-%d %l:%M %P").in_time_zone
  end
end
