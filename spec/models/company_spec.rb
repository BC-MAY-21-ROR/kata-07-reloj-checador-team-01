require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:user) { User.create(email:'adrian.mrj.97@gmail.com', password: 'roja141197', superadmin_role: true, user_role: false) }
  subject { Company.new(name: 'Armando Paredes', address: 'Loma Bonita #875', user_id: user.id) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'address should be present' do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it 'address should not be more than 50' do
    subject.address = 'a' * 100
    expect(subject).to_not be_valid
  end
end
