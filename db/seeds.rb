puts "Deleting all offers, bookings and users..."
Offer.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
puts "Done"

puts "Creating 5 Users with offers and booking"
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
    gender:  %w(Homme Femme Autre).sample,
    age: rand(18..99),
    hair_color: %w(Blond Roux Noir Blanc Gris Bleu Vert Rouge Autre).sample
  )
  user.save!
  rand(0..3).times do
    offer = Offer.create(
      title: Faker::Book.title,
      description: Faker::GreekPhilosophers.quote,
      localisation: Faker::Address.city,
      user_id: user.id,
      price: rand(1.0...300.0)
    )
    rand(0..1).times do
      ids = User.ids
      unless ids.size == 1
        ids.delete(user.id)
        booking = Booking.create(
          user_id: ids.sample,
          offer_id: offer.id,
          message: Faker::Movie.quote,
          booked_on: Faker::Date.between(from: '2024-07-23', to: '2024-11-25')
        )
      end
    end
  end
end
puts "Done"
