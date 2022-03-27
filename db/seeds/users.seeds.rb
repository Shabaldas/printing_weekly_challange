User.first_or_create(
  email: 'admin@mail.com',
  role: :admin,
  password: 'password',
  password_confirmation: 'password'
)
