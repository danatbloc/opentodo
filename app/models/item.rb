class Item < ApplicationRecord
  belongs_to :list

  before_save {self.completed ||= false}

  validates_presence_of :description
end
