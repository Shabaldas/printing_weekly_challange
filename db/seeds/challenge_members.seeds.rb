ChallengeMember.all.destroy_all

after :challenges do
  Challenge.all.each do |challenge|
    challenge.members_count.times do |count|
      ChallengeMember.create(
        user: User.where.not(role: 'admin').order(Arel.sql('RANDOM()')).first,
        challenge: challenge,
        link_to_instagram: Faker::Internet.url(host: 'instagram'),
        approve: 1
      )
    end
  end
  print '.'.green
end
