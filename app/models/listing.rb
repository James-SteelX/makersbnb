require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

 class Listing

  include DataMapper::Resource

  property :id, Serial
  property :street_address, String, required: true
  property :city, String, required: true
  property :description, Text, required: true
  property :price, Integer, required: true

  belongs_to :user
  has n, :availabilities
  has n, :requests


 end
