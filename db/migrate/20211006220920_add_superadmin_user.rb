class AddSuperadminUser < ActiveRecord::Migration[6.1]
  def change
    User.create! do |u|
      u.email     = ENV['RAILS_EMAIL_ADMIN_PROYECT']
      u.password  = ENV['RAILS_PASSWORD_ADMIN_PROYECT']
      u.superadmin_role = true
			u.user_role = false
    end
  end
end
