class Project < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories, allow_destroy: true
end
