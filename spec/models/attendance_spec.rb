require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { User.create(email:'dumy2@example.com', password:'1234567', superadmin_role: true, user_role: false) }
  let(:employee) { Employee.create(name: 'Jose Estrada', email:'dumy2@example.com', private_number: 4125, user_id: user.id)  }
  subject { Attendance.new( user_id: user.id) }

  before :each do
    wrong_private_number = 4122
    private_number = employee.private_number
    @employee_finded = Employee.find_by private_number: private_number
    @employee_not_finded = Employee.find_by private_number: wrong_private_number 
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
  
  it 'it create an attendance for employeee and Check In Success' do 
    @attendance = Attendance.attendance_check_in_manage(@employee_finded)
    expect(@attendance[0]).to eq("Check in successs")
    expect(@employee_finded.attendances.today_attendances.exists?).to eq(true)
  end

  it 'it doesnt exist attendances for an employee' do 
    @attendances = @employee_finded.attendances.today_attendances.exists?
    expect(@attendances).to eq(false)
  end

  it 'it create an attendance for employee and later notify is already check in' do 
    @attendance = Attendance.attendance_check_in_manage(@employee_finded)
    expect(@attendance[0]).to eq("Check in successs")
    expect(@employee_finded.attendances.today_attendances.exists?).to eq(true)
    @attendance = Attendance.attendance_check_in_manage(@employee_finded)
    expect(@attendance[0]).to eq("Check in already done")
  end

  it 'it create a notify for employee not check in' do 
    @attendance = Attendance.attendance_check_out_manage(@employee_finded)
    expect(@attendance[0]).to eq("You need to check in first")
    expect(@employee_finded.attendances.today_attendances.exists?).to eq(false)
  end

  it 'it doesnt exist check out for an attendance' do 
    @attendances = @employee_finded.attendances.today_attendances.exists?
    expect(@attendances).to eq(false)
  end

  it 'it create a check out for an attendance and later notify is already check out' do 
    @attendance_check_in = Attendance.attendance_check_in_manage(@employee_finded)
    @attendance_check_out = Attendance.attendance_check_out_manage(@employee_finded)
    expect(@attendance_check_in[0]).to eq("Check in successs")
    expect(@attendance_check_out[0]).to eq("Check out success")
    expect(@employee_finded.attendances.today_attendances.exists?).to eq(true)
    @attendance_check_out = Attendance.attendance_check_out_manage(@employee_finded)
    expect(@attendance_check_out[0]).to eq("Check out already done")
  end

end
