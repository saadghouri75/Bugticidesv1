ActiveAdmin.register User do
  permit_params :username, :email, :password, :password_confirmation

  index do
    column :username
    column :email
    actions
  end

  form do |f|
    inputs 'User' do
      input :username
      input :email
      input :password
      input :password_confirmation
    end
    actions
  end

end