require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  let(:user) { User.create(email:'dumy2@example.com', password:'1234567', superadmin_role: true, user_role: false) }
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      name: "Name",
      email: "Email",
      private_number: 2,
      user_id: user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
