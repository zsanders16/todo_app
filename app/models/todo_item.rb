class TodoItem < ApplicationRecord
  belongs_to :list
  
  validates_presence_of :description
end
