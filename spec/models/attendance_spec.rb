require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:attendance) { FactoryBot.create(:attendance) }
  let(:employee) { FactoryBot.create( :employee ) }

  describe 'associations' do
    it { should belong_to(:employee) }
  end
end
