# Phusion Passenger Server Sent Events demo

This app demonstrates [Phusion Passenger's](https://www.phusionpassenger.com/) support for HTML5 Server Side Events. Every second, the server sends us a random number. The app repeats sends at most 5 numbers per connection, but the browser keeps querying the server so the EventStream is infinite.

## Getting started

    bundle install
    gem install passenger
    passenger start

Then visit http://127.0.0.1:3000/

## Compatibility

 * This app uses plain Rack, and thus is framework agnostic.
 * Server Side Events works on Phusion Passenger for Apache, Phusion Passenger for Nginx and Phusion Passenger Standalone.
 * At least version 4.0.0 of Phusion Passenger is required.

## Multithreading and performance

Server Side Events works great on both the open source variant of Phusion Passenger, as well as on [Phusion Passenger Enterprise](https://www.phusionpassenger.com/). For optimal performance, Phusion Passenger Enterprise with multithreading is recommended. You should use the following settings for enabling multithreading. The more concurrent users you have, the higher your thread count should be. As a rule, your thread count should be at least the number of Server Side Event sessions you have.

Apache:

    PassengerConcurrencyModel thread
    PassengerThreadCount 64

Nginx:

    passenger_concurrency_model thread
    passenger_thread_count 64
