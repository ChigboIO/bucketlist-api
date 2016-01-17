class Token < ActiveRecord::Base
  validates :value, presence: true
end
