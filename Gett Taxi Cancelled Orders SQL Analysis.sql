create database Project;
select * from data_orders;

# Finding out the Distribution of Cancelled Orders
with cte as (
	select 
		(case when is_driver_assigned_key = 0 then "Unassigned" else "Assigned" end) "",
		sum(case when order_status_key = 4 then 1 else 0 end) as cx_cancellation,
		sum(case when order_status_key = 9 then 1 else 0 end) as sys_cancellation
		from data_orders
		group by  is_driver_assigned_key
		order by is_driver_assigned_key asc)
select * from cte
union all
select "Total", sum(cx_cancellation),sum(sys_cancellation) from cte;

# Getting the Hourly Distribution of Cancellation according to reason and driver assignment

select
	hour(order_datetime) Hours,
    sum(case when order_status_key = 4 and is_driver_assigned_key = 0 then 1 else 0 end) cx_cancel_driver_assigned,
    sum(case when order_status_key = 4 and is_driver_assigned_key = 1 then 1 else 0 end) cx_cancel_driver_unassigned,
    sum(case when order_status_key = 9 and is_driver_assigned_key = 0 then 1 else 0 end) sys_cancel_driver_assigned,
    sum(case when order_status_key = 9 and is_driver_assigned_key = 1 then 1 else 0 end) sys_cancel_driver_unassigned 
    from data_orders
group by hour(order_datetime)
order by Hours;

# Finding the Hourly Average of Cancellation Time in Seconds in accordance with Driver assignment
# Step-1 - We should find the Outliers - We consider values that are beyond 3 standard deviation away from the average as ooutliers
#          Formula = values above (Average + (3 * Standard Deviation))

select 
	ceil(avg(cancellations_time_in_seconds) + 3 * (stddev_pop(cancellations_time_in_seconds))) Outliers
    from data_orders
    where cancellations_time_in_seconds != '';
    
# step -2 - Calculating Average Cancellation Time in Seconds for every Hour along with driver assignment

select 
	hour(order_datetime) Hours,
    round(avg(case when is_driver_assigned_key = 0 then cancellations_time_in_seconds end),2) Driver_Unassigned,
    round(avg(case when is_driver_assigned_key = 1 then cancellations_time_in_seconds end),2) Driver_assigned
    from data_orders
where cancellations_time_in_seconds < (select 
	ceil(avg(cancellations_time_in_seconds) + 3 * (stddev_pop(cancellations_time_in_seconds))) Outliers
    from data_orders
    where cancellations_time_in_seconds != '') and cancellations_time_in_seconds != ""
group by Hour(order_datetime)
order by Hour(order_datetime);

# Finding the Estimated Time of Arrival (Hourly Basis)

select
	hour(order_datetime) Hours,
	round(avg(m_order_ETA),2) as average_ETA
    from data_orders
where m_order_ETA != ""
group by hour(order_datetime)
order by Hours;

