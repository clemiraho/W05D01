# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.delete_all
User.delete_all
Potin.delete_all
Tag.delete_all
JoinTablePotinTag.delete_all
PrivateMessage.delete_all

10.times do
  city = City.create!(name: Faker::Books::Lovecraft.location, zip_code: Faker::Address.zip_code)
end

p 'Seeded cities'

10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quotes::Shakespeare.hamlet_quote, email: Faker::Internet.free_email, age: Faker::Number.within(16..75), city: City.all.sample)
end

p 'Seeded users'

20.times do
  potin = Potin.create!(title: Faker::Books::Lovecraft.tome, content: Faker::Books::Lovecraft.paragraph, user: User.all.sample)
end

p 'Seeded potins'

10.times do
  tag = Tag.create!(title: Faker::Books::Dune.title)
end

p 'Seeded tags'

30.times do
  join_table_Potin_tag = JoinTablePotinTag.create!(potin: Potin.all.sample, tag: Tag.all.sample)
end

p 'Seeded JoinTablePotinTag'

25.times do

  privatemessage = PrivateMessage.create!(sender: User.all.sample,  content: Faker::Books::Dune.quote)
  recipients = Array.new

  rand(1..5).times do
    while true
      recipient = User.all.sample
      break unless recipients.include?(recipient)
    end

    recipients << recipient

    JoinTableRecipientPm.create(received_message: privatemessage, recipient: recipient)
  end

end

p 'Seeded PrivateMessages'
