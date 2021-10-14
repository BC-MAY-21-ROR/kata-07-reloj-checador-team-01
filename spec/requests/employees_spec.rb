 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/employees", type: :request do
  
  # Employee. As you add validations to Employee, be sure to
  # adjust the attributes here as well.
  current_user = User.first_or_create!(email: 'dean4@example.com', password: 'password', password_confirmation: 'password', superadmin_role: true, user_role: false)
  let(:user) {User.create(email: 'dean2@example.com', password: 'password', password_confirmation: 'password', superadmin_role: true, user_role: false)}
  let(:valid_attributes) {
    {
      name: "Employee name",
      email: "employee@email.test",
      private_number: 1,
      user: current_user
    }
  }

  let(:invalid_attributes) {
    {
      name: "Employee name",
      email: nil,
      private_number: nil,
      user: current_user
    }
  }
  before {login_as(user)}

  describe "GET /index" do
    it "renders a successful response" do
      employee = Employee.create(valid_attributes)
      employee.user = user
      employee.save
      get employees_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      employee = Employee.create! valid_attributes
      get employee_url(employee)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_employee_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      employee = Employee.create! valid_attributes
      get edit_employee_url(employee)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it 'creates a new Employee' do
        expect do
          employee = Employee.new(valid_attributes)
          employee.user = current_user
          employee.save
          post employees_url, params: { employee: valid_attributes }
        end.to change(Employee, :count).by(1)
      end

    end

    context "with invalid parameters" do
      it "does not create a new Employee" do
        expect {
          post employees_url, params: { employee: invalid_attributes }
        }.to change(Employee, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post employees_url, params: { employee: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
     let(:new_attributes) {
        {
          name: 'Faker Name 2',
          email: 'dummy2@test.com', 
          private_number: 294
        }
      }

      it "updates the requested employee" do
        employee = Employee.new(valid_attributes)
        employee.save
        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload
        expect(employee.name).to eql new_attributes[:name]
        expect(employee.email).to eql new_attributes[:email]
        expect(employee.private_number).to eql new_attributes[:private_number]
        expect(employee.private_number).not_to eql valid_attributes[:private_number]
      end

      it "redirects to the employee" do
        employee = Employee.create! valid_attributes
        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload
        expect(response).to redirect_to(employee_url(employee))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        employee = Employee.create! valid_attributes
        patch employee_url(employee), params: { employee: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested employee" do
      employee = Employee.create! valid_attributes
      expect {
        delete employee_url(employee)
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = Employee.create! valid_attributes
      delete employee_url(employee)
      expect(response).to redirect_to(employees_url)
    end
  end
end