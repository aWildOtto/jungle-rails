# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

Based on the unfinished project that has most basic functionalities, added new features:
- sold out badges
- add/delete categories
- order details and email receipt
- admin mode authentication
- user reviews and ratings
- empty cart notice
- bug fixes
- UI touches

## Screenshots
![1](/screenshot/1.png)
* Main page displays all products, add to cart by clicking the add button
![2](/screenshot/2.png)
* Detail page of a product. User can also review the product here if they are logged in, or browse reviews without logging in
![3](/screenshot/3.png)
* Log in page
![4](/screenshot/4.png)
* Checkout page
![5](/screenshot/5.png)
* Paying via Stripe
![6](/screenshot/6.png)
* Detailed order page. a samilar receipt is also sent to user's email 
![7](/screenshot/7.png)
* Admin tools. Sellers can add/delete products here
![8](/screenshot/8.png)
* Seller can also add/delete categories 
![9](/screenshot/9.png)
* Only a category without products in it can be deleted 

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
