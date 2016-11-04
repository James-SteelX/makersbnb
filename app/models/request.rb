require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Request

  include DataMapper::Resource

  property :id,          Serial
  property :start_date,  Date, required: true
  property :end_date,    Date, required: true
  property :status,      String, default: :for_review
  # property :user_id,     Integer, required: true
  property :availability_id,   Integer        # , required: true

  belongs_to :listing
  belongs_to :user

end
