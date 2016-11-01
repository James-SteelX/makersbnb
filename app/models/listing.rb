require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

 class Listing

  include DataMapper::Resource

  property :id, Serial
  property :street_address, String
  property :city, String
  property :description, Text
  property :price, Integer

  belongs_to :user


 end
