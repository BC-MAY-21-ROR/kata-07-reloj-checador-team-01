require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  let(:user) { User.create(email:'dumy2@example.com', password:'1234567', superadmin_role: true, user_role: false) }
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      name: "MyString",
      email: "MyString",
      private_number: 1,
      user_id: user.id
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[private_number]"

    end
  end
end
