Challenge.all.destroy_all

after :users do
  10.times do
    Challenge.create(
      title: Faker::Game.title,
      description: Faker::Lorem.paragraph,
      status: Challenge.statuses.values.sample,
      members_count: rand(10..50),
      duration: 7,
      money_prize: (rand(10..200) / 5.0).round(0) * 5.0,
      val: rand(0..1),
      type_of_print: Challenge.type_of_prints.values.sample,
    )
    print '.'.green
  end
end
