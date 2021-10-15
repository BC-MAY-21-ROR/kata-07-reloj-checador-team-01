require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  let(:user) { User.create(email:'dumy2@example.com', password:'1234567', superadmin_role: true, user_role: false) }
  before(:each) do
    assign(:employee, Employee.new(
      name: "MyString",
      email: "MyString",
      private_number: 1,
      user_id: user.id
    ))
  end

  it "renders new employee form" do
    render

      assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[email]"

      assert_select "input[name=?]", "employee[private_number]"
    end
  end
end
