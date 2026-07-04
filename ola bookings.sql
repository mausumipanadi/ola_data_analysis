create database ola;
use ola;
#1. Retrieve all successful bookings:
select *from bookings
where Booking_Status='success';
select * from successful_bookings;

#2. Find the average ride distance for each vehicle type:
select vehicle_type, avg(Ride_Distance)
AS Avg_distance from bookings
group by vehicle_type;
select * from average_ride_distance;

#3. Get the total number of cancelled rides by customers;
CREATE View number_of_cancelled_rides_by_customers As
SELECT Count(*) from bookings
where Booking_Status='Canceled by Customer';
select * from number_of_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
select customer_id, count(booking_id) As Total_Rides
 from bookings
 Group By customer_id
 order by total_rides desc limit 5;
 select * from top_5_customers;
 
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) from bookings
Where Canceled_Rides_by_Driver='Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select MAX(driver_ratings) as max_ratings,
MIN(driver_ratings) as min_ratings from bookings
where vehicle_type='prime sedan';

#7. Retrieve all rides where payment was made using UPI:
select * from bookings
where payment_method='UPI';

#8. Find the average customer rating per vehicle type:
select vehicle_type, avg(customer_rating) as avg_customer_ratings
from bookings group by vehicle_type;


#9. Calculate the total booking value of rides completed successfully:
select sum(booking_value)as total_booking_value from bookings
where booking_status='success';

#10. List all incomplete rides along with the reason:
select incomplete_rides_reason,booking_id from bookings 
where incomplete_rides='yes';
select * from incomplete_rides_with_reason;
#booking status distribution:
SELECT booking_status,
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bookings) AS percentage
FROM bookings
GROUP BY booking_status;