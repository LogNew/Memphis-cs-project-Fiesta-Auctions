# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# == Schema Information
#

require 'date'


u1 = User.create!(
    name: 'Alice Johnson',
    email: 'alice@email.com',
    password: 'password',
    rating: '3',
    location: 'Memphis, TN'
)

u2 = User.create!(
    name: 'Bob Jones',
    email: 'bob@email.com',
    password: 'password',
    rating: '4',
    location: 'Nashville, TN'
)


b1 = Bid.create!(
    user: u1,
    bid_price: 100

)


b2 = Bid.create!(
    user: u2,   
    bid_price: 200

)

r1 = Review.create!(
    user:u2,
    description: 'The best',
    rating:5,
    reviewer: 'bob@email.com',
    title:'Great',
    user_reviewed:'alice@email.com'
)
r2 = Review.create!(
    user: u2, #creaded to bob
    description: 'Really Great Will buy again!',
    rating:5,
    reviewer: 'bob@email.com',
    title:'Excellent Experience',
    user_reviewed:'alice@email.com'
)
r3 = Review.create!(
    user: u1,
    description: 'Really bad bad bad BAD!',
    rating:2,
    reviewer: 'alice@email.com' ,
    title:'Poor Experience',
    user_reviewed:'bob@email.com'
)
r4 = Review.create!(
    user: u1,
    description: 'Really bad',
    rating:3,
    reviewer: 'alice@email.com',
    title:'Average Experience',
    user_reviewed:'bob@email.com'
)
a1 = Auction.create!(
    auction_start_time: DateTime.strptime("4/23/2020 07:00", "%m/%d/%Y %R"),
    auction_end_time: DateTime.strptime("4/29/2020 11:59", "%m/%d/%Y %R"),
    category: "Electronic",
    current_price: 100.0,
    highest_bid: 120.0,
    highest_bidder: "alice@email.com",
    name: "Phillips TV",
    description: "This is my old TV",
    seller: u2,
)

a2 = Auction.create!(
    auction_start_time: DateTime.strptime("4/23/2020 08:00", "%m/%d/%Y %R"),
    auction_end_time: DateTime.strptime("4/30/2020 11:59", "%m/%d/%Y %R"),
    category: "Home & Garden",
    current_price: 70.0,
    highest_bid: 100.0,
    highest_bidder: "bob@email.com",
    name: "Vacuum",
    description: "This was a good vacuum.",
    seller: u1,
)
a4 = Auction.create!(
    auction_start_time: DateTime.strptime("4/23/2020 07:00", "%m/%d/%Y %R"),
    auction_end_time: DateTime.strptime("4/24/2020 11:59", "%m/%d/%Y %R"),
    category: "Electronic",
    current_price: 100.0,
    highest_bid: 120.0,
    highest_bidder: "alice@email.com",
    name: "Phillips Remote",
    description: "This remote goes with a Phillips TV",
    seller: u2
)
a5 = Auction.create!(
    auction_start_time: DateTime.strptime("4/23/2020 07:00", "%m/%d/%Y %R"),
    auction_end_time: DateTime.strptime("4/24/2020 11:59", "%m/%d/%Y %R"),
    category: "Electronic",
    current_price: 200.0,
    highest_bid: 1000.0,
    highest_bidder: "alice@email.com",
    name: "JBL speaker",
    description: "Really good sound quality.",
    seller: u2
)
a6 = Auction.create!(
    auction_start_time: DateTime.strptime("4/23/2020 07:00", "%m/%d/%Y %R"),
    auction_end_time: DateTime.strptime("4/24/2020 11:59", "%m/%d/%Y %R"),
    category: "Food",
    current_price: 5.0,
    highest_bid: 100.0,
    highest_bidder: "bob@email.com",
    name: "Apple",
    description: "Still kind of fresh.",
    seller: u1
)