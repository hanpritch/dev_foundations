require_relative 'stripe_keys'
require 'stripe'
require 'sqlite3'
require 'sinatra'
require 'erb'
Stripe.api_key = 'sk_test_bAKwibklKt1bPDSeMMCKgnDk'

use Rack::Static, :urls => ["/css", "/images", "/scripts"]


# html and css design

#display the available products, based on the sqlite db 
get '/' do 
	erb :thetoast
end 

get '/support' do 
	erb :thetoastpurchase, :locals => {:amount => params[:amount]}
end 


post '/purchase' do 
  token = params[:stripeToken]
  price = params[:amount]
  customer_email = params[:donor_email]

  # create the charge
  charge = Stripe::Charge.create(
    :amount => 100,
    :currency => "usd",
    :source => token,
    :receipt_email => customer_email
  )
  
  redirect '/confirmation'
end 


get '/confirmation' do 
	response = "<h1> Thank you for your donation!</h1>"
end 


