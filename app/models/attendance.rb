class Attendance < ApplicationRecord
  attr_accessor :set_check_out
  belongs_to :employee
  belongs_to :user
  before_create :set_check_in
  def set_check_in
    self.check_in = Time.now
  end

  def self.find_by_employee(id)
    attendance = self.find_by(employee_id: id)
  end

  def set_check_out
    self.check_out = Time.now
  end
end
