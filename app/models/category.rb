class Category < ApplicationRecord
  resourcify
  has_and_belongs_to_many :projects

end
