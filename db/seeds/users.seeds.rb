User.where.not(role: 'admin').destroy_all

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nick_name: Faker::Movies::Hobbit.character,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    role: 2,
    email: Faker::Internet.email,
    password: '123456'
  )
  print '.'.green
end
