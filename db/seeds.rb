# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
   require "faker"
    200.times do 
       name = Faker::Commerce.product_name #=> "Practical Granite Shirt"
       desc = Faker::Commerce.material #=> "Plastic"
        product = Product.create(
            category_id: rand(1..2),
            name: name,
            desc: desc,
            user_id: 5
        )

        rand(1..4).times do


         product.product_variants.create(

            batch_no: Faker::Name.unique.name.first,
            weight:   rand(1..100),
            price: Faker::Commerce.price(range: 0..10000.0, as_string: true), #=> "2.18"
            user_id: 5,
            quantity: rand(1..500),
            expiry: Faker::Date.between(from: '2021-12-27', to: '2030-01-01') #=> #<Date: 2014-09-24>
          
         )
       end




     end