class BookingsController < ApplicationController
    def new
        @flight = Flight.find_by(params[:id]) #don't need id: params[:id]
        # @passenger = Passenger.new        #don't need to create new passenger separately!
        
        # @tickets = params[:num_tickets]
        # x = @tickets.to_i
        
        @booking = Booking.new
        params[:num_tickets].to_i.times {@booking.passengers.build}     # @booking.passenger_bookings.build
    end
    
    def create
        # Unnecessary - all you need is to build new Booking with booking_params!!!
        # @passenger = Passenger.create(params[:booking][:passenger_attributes]) #params[:booking][:passenger] ?
        # @passenger = Booking.passengers.create(id: params[:booking][:passenger_attributes])
        # @booking = Booking.new(flight_id: params[:booking][:flight_id], passenger_id: @passenger.id)
        # @booked_flight = @passenger.bookings.build(flight_id: @flight.id)
        
        @booking = Booking.new(booking_params)
        if @booking.save
            # @booking.update_attributes(flight_id: params[:booking][:flight_id])
            PassengerMailer.welcome_email(@booking).deliver_now
            redirect_to @booking
        end
    end
    
    def show
        @booking = Booking.find(params[:id])
        # @flight = Flight.find_by(id: @booking.flight_id) #same as below
        # @passenger = Passenger.find_by(id: @booking.passenger_id) #same as below
        @flight = @booking.flight
        @passengers = @booking.passengers
        
    end
    
    private
    
    def booking_params
        params.require(:booking).permit(:flight_id, :passengers_attributes => [:id, :name, :email]) #don't need :flight_id?
        #simple error - correct pluralization of passengers_attributes
    end
end
