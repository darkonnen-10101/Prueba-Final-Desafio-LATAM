class Comment < ApplicationRecord
  include RailsAdminCharts

  resourcify
  belongs_to :user
  belongs_to :project
  validates :content, presence: true

  paginates_per 10

end
