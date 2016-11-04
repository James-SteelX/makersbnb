require 'pony'

class Email

  def self.sign_up(email)
    Pony.mail(:to => email, :subject => 'Welcome to MakersBnB',
    :body => 'You have successfully signed up to MakersBnB!')
  end

  def self.send_request(email, start_date, city)
    Pony.mail(:to => email, :subject => 'Your reservation has been sent',
    :body => "Your reservation from #{start_date} in #{city} has been sent to the owner")
  end

  def self.accepted_request(email, start_date, city)
    Pony.mail(:to => email, :subject => 'Your reservation has been Accepted',
    :body => "Your reservation from #{start_date} in #{city} has been confirmed and accepted by the owner!")
  end

  def self.rejected_request(email, start_date, city)
    Pony.mail(:to => email, :subject => 'Your reservation has been turned down',
    :body => "Your reservation from #{start_date} in #{city} has been unfortunately been turned down by the owner")
  end

  def self.created_space(email, city)
    Pony.mail(:to => email, :subject => 'Your property has been listed',
    :body => "Your property in #{city} has been listed, go to your profile to add available dates")
  end

  def self.updated_date(email, start_date, end_date, city)
    Pony.mail(:to => email, :subject => 'Your availability has been updated',
    :body => "Your property in #{city} have been updated with a start date from #{start_date} and an end date #{end_date}")
  end



  Pony.options = {:via => :smtp,
                  :via_options =>
                  { :address              => 'smtp.gmail.com',
                    :port                 => '587',
                    :enable_starttls_auto => true,
                    :user_name            => 'teamfivebnb',
                    :password             => 'JJLGbnb.',
                    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
                    :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
                  }
                }

end
