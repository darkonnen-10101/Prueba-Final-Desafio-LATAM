class User < ApplicationRecord

  include RailsAdminCharts

  rolify

  after_initialize :set_default_role, if: :new_record?
  validates :roles, presence: true

  def set_default_role
    self.add_role(:normal)
  end

  # def self.graph_data since=30.days.ago
  # [
  #   {
  #       name: 'Users',
  #       pointInterval: point_interval = 1.day * 1000,
  #       pointStart: start_point = since.to_i * 1000,
  #       data: self.where(name: 'zxc').delta_records_since(since)
  #   },
  #   {
  #       name: 'Standard Users',
  #       pointInterval: point_interval,
  #       pointStart: start_point,
  #       data: self.where(name: nil).delta_records_since(since)
  #   }
  # ]
  # end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :projects, dependent: :destroy

end
