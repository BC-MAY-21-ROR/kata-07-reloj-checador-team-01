require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { User.create(email:'dumy2@example.com', password:'1234567', superadmin_role: true, user_role: false) }
  let(:employee) { Employee.create(name: 'Jose Estrada', email:'dumy2@example.com', private_number: 4125, user_id: user.id)  }
  subject { Attendance.new( user_id: user.id) }

  before :each do
    wrong_private_number = 4122
    private_number = employee.private_number
    @employee_finded = Employee.find_by_number(private_number)
    @employee_not_finded = Employee.find_by_number(wrong_private_number)
  end

  it 'employee should exist for attendance creation' do
    subject.employee_id = nil
    subject.save
    expect(subject).to_not be_valid
  end

  it 'should create attendance with employee private number' do
    attendance = Attendance.create( user_id: user.id, employee: @employee_finded )
    attendance.save
    expect(attendance).to be_valid
  end

  it 'should create attendance with employee private number' do
    attendance = Attendance.create( user_id: user.id, employee: @employee_not_finded )
    attendance.save
    expect(attendance).to_not be_valid
  end

  it 'should check-out be nil' do
    attendance = Attendance.create( user_id: user.id, employee: @employee_finded )
    attendance.save
    expect(attendance.check_out).to be_nil
  end

  it 'should check-in not be nil' do
    attendance = Attendance.create( user_id: user.id, employee: @employee_finded )
    attendance.save
    expect(attendance.check_in).to_not be_nil
  end

  it 'should exist attendence for an employee' do
    attendance_for_employee_finded = Attendance.find_by_employee(@employee_finded.id)
    expect(attendance_for_employee_finded).to be_nil
  end

  it 'should not exist attendence for an employee' do
    id = 102
    attendance_for_employee_finded = Attendance.find_by_employee(id)
    expect(attendance_for_employee_finded).to be_nil
  end
end
