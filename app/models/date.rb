require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

 class Availability

  include DataMapper::Resource

  property :id, Serial
  property :start_date,  Date
  property :end_date,  Date
  property :is_available,  Boolean

  belongs_to :listing

end
