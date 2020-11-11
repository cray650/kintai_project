100.times do |_n|
  employee_id = Faker::Number.decimal_part(digits: 4)
  firstname = Faker::Japanese::Name.first_name
  lastname = Faker::Japanese::Name.last_name
  email = Faker::Internet.email
  User.create!(
    employee_id: employee_id,
    firstname: firstname,
    lastname: lastname,
    email: email,
    password: '1111aa',
    password_confirmation: '1111aa',
    admin: false
  )
end

User.create!(
  employee_id: '999',
  firstname: '管理者',
  lastname: '太郎',
  email: 'admin@example.jp',
  password: '1111aa',
  password_confirmation: '1111aa',
  admin: true
)
