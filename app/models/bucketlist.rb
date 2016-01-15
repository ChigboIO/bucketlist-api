class Bucketlist < ActiveRecord::Base
  validates :name, presence: true
end
