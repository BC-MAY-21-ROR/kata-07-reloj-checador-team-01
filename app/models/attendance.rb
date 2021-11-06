class Attendance < ApplicationRecord
  belongs_to :employee

  before_create :set_check_in
  scope :today_attendances, -> { where("created_at >= ?", DateTime.now.beginning_of_day) }
  scope :without_check_out, -> { where(check_out: nil) }
  scope :complete, -> { where.not(check_out: nil) }
  scope :attendances_by_month, -> (begin_of_month = DateTime.now.beginning_of_month , end_of_month = DateTime.now.end_of_month) {where("created_at >= ? AND created_at <=?",begin_of_month,end_of_month)}
  scope :by_date, -> (sdate,edate) { where( "created_at >= ? AND created_at <= ? ", sdate, edate) }

  def self.attendances_by_month_complete
    self.attendances_by_month.complete.where("check_out >= check_in")
  end

  def attendance_date
    self.created_at
  end

  def self.messages
    @messages = []
  end

  def total_working_time
    check_in_time = self.check_in.to_time
    check_out_time = self.check_out.to_time
    check_out_time - check_in_time
  end

  def total_working_human_time
    check_in_time = self.check_in.to_time
    check_out_time = self.check_out.to_time
    total_time = (check_out_time - check_in_time)
    minutes = (total_time / 60 ).to_i
    hours = minutes / 60
    rest = minutes % 60
    "#{hours} hours #{rest} minutes"
  end

  def self.find_by_employee(id)
    self.find_by(employee_id: id)
    t = (check_out_time - check_in_time)
    (t / 1.hours).to_i
  end

  def set_check_in
    self.check_in = Time.now
  end

  def self.attendance_check_in_manage(employee)
    employee_attendances = employee.attendances
    return self.messages << "Check in already done" unless !employee_attendances.today_attendances.exists?
    attendance = employee_attendances.create
    return self.messages << "Check in successs" if attendance.save
  end

  def self.attendance_check_out_manage(employee)
    employee_attendances = employee.attendances
    employee_attendances_without_check_out =   employee_attendances.today_attendances.without_check_out
    return self.messages <<  "You need to check in first" unless employee_attendances.today_attendances.exists?
    unless !employee_attendances_without_check_out.exists?
      attendance = employee_attendances_without_check_out.first
      attendance.check_out = Time.now
      return self.messages << "Check out success" if attendance.save
    end
    return self.messages << "Check out already done"
  end

end
