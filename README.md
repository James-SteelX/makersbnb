#User Stories
##Booking user stories
```
As a visitor
So that I can use the makersbnb website
I would like to sign up to the website
```
```
As a visitor
So that I can book a space
I would like to view other users spaces
```
```
As a visitor
So that I can return to a previous users space
I would like to be able to search by user
```
```
As a visitor
So that I can see available spaces
I would like to have availability information displayed
```
```
As a visitor
So that I can make a booking
I would like to make a request to stay in available slot
```
```
As a visitor
So that I know my booking was successful
I would like to get a confirmation or denial message
```
```
As a visitor
So that I can
I would like to
```

##Booking host user stories
```
As a host		
So that I can	list my home
I want to	create an account at MakersBNB
```
```
As a host		
So that I can	list my home
I want to	create a listing for my home showing the description and price per night
```
```
As a host		
So that I can	manage my properties
I want to	be able to view all my listings.
```			
```
As a host		
So that I can	list my home
I want to	show the dates that it is available
```		
```		
As a host		
So that I can	confirm a booking
I want to	view booking requests to stay at my home
```
```		
As a host		
So that I can	confirm a booking
I want to	mark the booking dates as unavailable to other customers.
```
```		
As a host		
So that I can	mange the listing
I want to	accept or reject a booking request
```
```		
As a host		
So that I can	manage the listing
I want to	be able to contact the customer
```
```		
As a host		
So that I can	manage my account
I want to	be able to list more than one property
```
```		
As a host		
So that I can	enhance my listing
I want to	be able to upload photos of my home
```

#High Level Spec
```
We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

Headline specifications

Any signed-up user can list a new space.
Users can list multiple spaces.
Users should be able to name their space, provide a short description of the space, and a price per night.
Users should be able to offer a range of dates where their space is available.
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
Nights for which a space has already been booked should not be available for users to book that space.
Until a user has confirmed a booking request, that space can still be booked for that night.
Nice-to-haves

Users should receive an email whenever one of the following happens:
They sign up
They create a space
They update a space
A user requests to book their space
They confirm a request
They request to book a space
Their request to book a space is confirmed
Their request to book a space is denied
Users should receive a text message to a provided number whenever one of the following happens:
A user requests to book their space
Their request to book a space is confirmed
Their request to book a space is denied
A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
Basic payment implementation though Stripe.
```
