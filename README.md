 Project Name - Insights from Failed Orders
 Gett, previously known as GetTaxi, is an Israeli-developed technology platform solely focused on corporate Ground Transportation Management (GTM)
 They have an application where clients can order taxis, and drivers can accept their rides (offers).
 At the moment, when client clicks the Order button in the application, matching system searches for the most relevant drivers & offers them the o
 In this task, we would investigate some matching metrics for orders that didn't complete successfully;the customer didn't end up getting a car.
 Tasks Accomplished
 Task 1 - Building-up distribution of orders according to reasons for failure: cancellations before and after driver assignment, & reasons for ord
 Analysing the resulting plot. Which category has the highest number of orders?
 Task 2 - Ploting the distribution of failed orders by hours.
 If there's a trend that certain hours have an abnormally high proportion of one category or another.
 Finding biggest Failed Hours & it's explaination
 Task 3 - Ploting the average time to cancellation with and without driver, by the hour.
 Finding the outliers in the data. Drawing conclusions from the plot.
 Task 4 - Ploting the distribution of average ETA by hours & explaination.
 Task 5 - Ploting the h3 & folium packages.
 Calculating how many sizes 8 hexes contain 80% of all orders from the original data sets and visualise the hexes.
 Colouring them by the number of fails on the map.
 Data Description
 Table Name - Data_orders. The data_orders data set contains the following columns:
 order_datetime - time of the order
 origin_longitude - longitude of the order
 origin_latitude - latitude of the order
 m_order_eta - time before order arrival
 order_gk - order number
 order_status_key - status, an enumeration consisting of the following mapping:
 4 - cancelled by client,
 9 - cancelled by system, i.e., a reject
 is_driver_assigned_key - whether a driver has been assigned if yes then 1 else 0
 cancellation_time_in_seconds - how many seconds passed before cancellation
