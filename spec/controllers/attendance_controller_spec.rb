require 'rails_helper'

describe AttendancesController, type: :controller do
  let(:attendance) { FactoryBot.create(:attendance) }
  let(:employee) { FactoryBot.create( :employee ) }

  describe 'POST create' do
    subject { post :create, params: { attendance: attributes}  }

    context 'with valid params' do
      let(:attributes) { attributes_for(:attendance, employee_id: employee.id) }
      it 'Creates new attendance' do
        expect{ subject }.to change(Attendance, :count).by(1)
      end

      it 'redirect to attendance is successful with the notice' do
        expect(subject).to redirect_to(Attendance.last)
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid params' do
      let(:attributes) { attributes_for(:attendance, employee_id: nil) }

      it "It doesn't create new attendance" do
        expect(response).to be_successful
      end
    end
  end


  context 'when employee is valid' do
    it 'should check-out be nil' do
      attendance.save
      expect(attendance.check_out).to be_nil
    end

    it 'should check-in not be nil' do
      attendance.save
      expect(attendance.check_in).to_not be_nil
    end

    it 'should exist attendence for an employee' do
      attendance_for_employee = Attendance.find_by_employee(employee.id)
      expect(attendance_for_employee).to be_nil
    end

    it 'should not exist attendence for an employee' do
      id = 102
      attendance_for_employee_finded = Attendance.find_by_employee(id)
      expect(attendance_for_employee_finded).to be_nil
    end
  end

end
