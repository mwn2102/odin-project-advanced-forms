class PassengerMailer < ApplicationMailer
    def welcome_email(booking)
        @emails = booking.passengers.map {|p| p.email} #to email address is an array
        @passengers = booking.passengers
        @flight  = booking.flight
        mail(to: @emails, subject: 'Your Flight Confirmation')
    end
end
