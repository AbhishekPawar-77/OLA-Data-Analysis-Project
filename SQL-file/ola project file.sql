use ola;

#1. Retrieve all successful bookings:
create view Successful_Bookings as 
select * from bookings where Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type:
create view	ride_distance_for_each_vehicle as
select vehicle_type, avg(Ride_Distance) as avg_distance 
from bookings group by vehicle_type;

#3. Get the total number of canceled rides by customers:
create view canceled_ride_by_customer as 
select count(Canceled_Rides_by_Customer) from bookings;

#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
select Booking_ID,count(Customer_ID) as total_ride
from bookings 
group by Booking_ID
order by total_ride DESC limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issue:
create view	rides_canceled_by_drivers_due_to_personal_and_car_related_issue as
select COUNT(*) FROM bookings

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_Driver_Ratings as
select max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_ratings from bookings
where Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
select * from bookings where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
create view avg_customer_rating as 
select Vehicle_Type,avg(Customer_Rating) as avg_customer_ratings
from bookings group by Vehicle_type;

#9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_ride_value 
from bookings where Booking_status = 'Success';

#10. List all incomplete rides along with the reason:
Create View incomplete_rides_reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes'