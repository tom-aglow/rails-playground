class Subject < ApplicationRecord

  acts_as_list

  has_many :pages

  scope :visible, -> { where(:visible => true) }
  scope :invisible, -> { where(:visible => false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }
  scope :search, ->(query) { where(["name like ?", "%#{query}%"]) }

  validates_presence_of :name
  validates_length_of :name, maximum: 255
end
