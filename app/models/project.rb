class Project < ApplicationRecord

  include RailsAdminCharts

  resourcify
  belongs_to :user
  has_many :comments, dependent: :destroy


  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories, allow_destroy: true

  # mount_uploader :project_photo, ImageUploader

  validates :project_photo, presence: true
  validates :name, presence: true
  validates :url, presence: true
  validates :lead, presence: true
  validates :description, presence: true
  validates :repository, presence: true

  #
  # paginates_per 3
  #
  # default_scope ->{ order('created_at') }

end
