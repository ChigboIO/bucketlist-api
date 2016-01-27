class Item < ActiveRecord::Base
  belongs_to :bucketlist

  validates :name, presence: true

  scope :in_bucketlist, ->(bucket_id) { where(bucketlist_id: bucket_id) }
end
