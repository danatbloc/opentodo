class List < ApplicationRecord
  belongs_to :user
  has_many :items

  validates_presence_of :name
end
