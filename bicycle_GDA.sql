
-- ------------
SELECT 
    year,
    -- Phân tách tổng số chuyến đi của 2 nhóm sang 2 cột song song
    COUNT(CASE WHEN member_casual = 'member' THEN ride_id END) AS member_trips,
    COUNT(CASE WHEN member_casual = 'casual' THEN ride_id END) AS casual_trips,
    
    -- Phân tách thời gian đi xe trung bình sang 2 cột song song
    ROUND(AVG(CASE WHEN member_casual = 'member' THEN ride_length END), 2) AS member_avg_len,
    ROUND(AVG(CASE WHEN member_casual = 'casual' THEN ride_length END), 2) AS casual_avg_len
FROM total_data
GROUP BY year
ORDER BY year;

SELECT 
    day_of_week, 
    
    -- Số chuyến đi năm 2019
    COUNT(CASE WHEN year = 2019 AND member_casual = 'member' THEN ride_id END) AS member_trips_2019,
    COUNT(CASE WHEN year = 2019 AND member_casual = 'casual' THEN ride_id END) AS casual_trips_2019,
    
    -- Số chuyến đi năm 2020
    COUNT(CASE WHEN year = 2020 AND member_casual = 'member' THEN ride_id END) AS member_trips_2020,
    COUNT(CASE WHEN year = 2020 AND member_casual = 'casual' THEN ride_id END) AS casual_trips_2020
FROM total_data
GROUP BY day_of_week
ORDER BY day_of_week;
-- ----------------
SELECT 
    EXTRACT(HOUR FROM started_at) AS hour_of_day, -- Hoặc HOUR(started_at)
    
    -- Đếm số chuyến của từng nhóm cho năm 2019
    COUNT(CASE WHEN year = 2019 AND member_casual = 'member' THEN ride_id END) AS member_trips_2019,
    COUNT(CASE WHEN year = 2019 AND member_casual = 'casual' THEN ride_id END) AS casual_trips_2019,
    
    -- Đếm số chuyến của từng nhóm cho năm 2020
    COUNT(CASE WHEN year = 2020 AND member_casual = 'member' THEN ride_id END) AS member_trips_2020,
    COUNT(CASE WHEN year = 2020 AND member_casual = 'casual' THEN ride_id END) AS casual_trips_2020
FROM total_data
GROUP BY hour_of_day
ORDER BY hour_of_day;