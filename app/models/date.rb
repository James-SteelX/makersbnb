require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
# require 'dm-timestamps'

 class Date

  include DataMapper::Resource

  property :id, Serial
  property :start_date,  Text
  property :end_date,  Text
  property :is_available,  Boolean

  belongs_to :listing

end
