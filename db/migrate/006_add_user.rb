class AddUser < ActiveRecord::Migration
  def change
    User.create!(:email => 'admin@mlip.ru', :password => 'password', :password_confirmation => 'password')
  end
end
