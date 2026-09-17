create database air_quality_db;
use air_quality_db;
SELECT COUNT(*) FROM enriched_aqi;

-- null
SELECT * FROM enriched_aqi
WHERE pollutant_avg IS NULL OR AQI IS NULL;

-- min max
SELECT
    MAX(AQI) AS max_aqi,
    MIN(AQI) AS min_aqi
FROM enriched_aqi;

-- avg
SELECT city,
        ROUND(AVG(aqi),2) AS avg_aqi
FROM enriched_aqi
GROUP BY city
ORDER BY avg_aqi DESC;

-- group by
SELECT Season, AVG(AQI)
FROM enriched_aqi
GROUP BY Season;

SELECT pollutant_id,AVG(pollutant_avg), MAX(pollutant_max)
FROM enriched_aqi
GROUP BY pollutant_id
ORDER BY AVG(pollutant_avg) DESC;

SELECT city, station, AVG(AQI) AS avg_aqi
FROM enriched_aqi
GROUP BY city, station
ORDER BY avg_aqi DESC
LIMIT 5;

USE air_quality_db;
SELECT city, state, station, AQI, AQI_Bucket
FROM enriched_aqi
WHERE AQI_Bucket IN ('Severe', 'Hazardous')
ORDER BY AQI DESC
LIMIT 20

