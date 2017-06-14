class List < ApplicationRecord
  belongs_to :user
  has_many :todo_items, dependent: :destroy

  validates_presence_of :name

  def self.by_name
    order(:name)
  end
  
end
