class Employee < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_many :attendances
  validates :name, :email, :private_number, presence: true
  validates :email, :private_number, uniqueness: true
  validates :private_number, numericality: { only_integer: true }
  scope :with_private_number, ->(number) { where(private_number: number) }

  def get_total_avg_time
    total_working_time = 0
    self.attendances.attendances_by_month_complete.includes(:employee).each do |attendance|
      total_working_time += attendance.total_working_time
    end
    minutes = ((total_working_time / 60 ) / self.attendances.attendances_by_month_complete.count).round(0)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours} hours #{rest} minutes"
  end
end
