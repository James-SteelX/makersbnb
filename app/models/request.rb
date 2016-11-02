require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Request
  
  include DataMapper::Resource

  property :id,          Serial
  property :start_date,  Date, required: true
  property :end_date,    Date, required: true
  property :status,      String, default: :for_review

  belongs_to :listing

end
