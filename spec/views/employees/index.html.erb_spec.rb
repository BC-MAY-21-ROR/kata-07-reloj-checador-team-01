require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  let(:user) { User.create(email:'dumy2@example.com', password:'1234567', superadmin_role: true, user_role: false) }
  before(:each) do
    assign(:employees, [
      Employee.create!(
        name: "Name",
        email: "employee_1@example.com",
        private_number: 2,
        user_id: user.id
      ),
      Employee.create!(
        name: "Name",
        email: "employee_2@example.com",
        private_number: 3,
        user_id: user.id
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "employee_1@example.com".to_s, count: 1
    assert_select "tr>td", text: "employee_2@example.com".to_s, count: 1
    assert_select "tr>td", text: 2.to_s, count: 1
    assert_select "tr>td", text: 3.to_s, count: 1
  end
end
