require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:private_number) }
  end

  let(:employee) { FactoryBot.create(:employee)  }
  let(:employees) { FactoryBot.create_list(:employee, 10)  }
  let(:user) { User.create(email:'dumy2@example.com', password:'1234567', superadmin_role: true, user_role: false) }
  subject { Employee.new(name: 'Jose Estrada', email:'dumy@example.com', private_number: 4123, user_id: user.id) }

  before :each do
    with_repeated_data = Employee.new(name: 'Juan', email:'dumy@example.com', private_number: 4123, user_id: user.id)
    with_repeated_data.save
  end

  it 'private number should allow only integer numbers' do
    subject.private_number = 'A'
    subject.save
    expect(subject).to_not be_valid
  end

  it 'email should be unique' do
    subject.save
    expect(subject).to_not be_valid
  end

  it 'private number should be unique' do
    subject.save
    expect(subject).to_not be_valid
  end

  it 'should return 2 hours 0 minutes of avg time check in/outs for the employee attendances' do
    expect(employee.get_total_avg_time).to eq("2 hours 0 minutes")
  end

  it 'should have absenses for employee' do
    attendances = employee.attendances.count
    month_dates = employee.current_month_dates
    absences = month_dates - attendances
    expect(employee.absences).to eq(absences)
  end

end
