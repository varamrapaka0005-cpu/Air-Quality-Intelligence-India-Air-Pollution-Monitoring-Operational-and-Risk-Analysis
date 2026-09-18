# Air Quality Intelligence: India Air Pollution Monitoring

An end-to-end SQL + Power BI analytics project that converts raw, station-level air pollution and weather data into actionable intelligence for data analysts, policy/compliance officers, and public health researchers across India.

## 📌 Problem Statement

India's air pollution monitoring infrastructure generates large volumes of station-level data, but converting it into clear, actionable insight is difficult without a structured analytical pipeline. This project answers three core questions:

- Which cities and stations have the highest-risk air quality, and what's driving it?
- How is AQI severity distributed across official AQI_Bucket compliance categories?
- How do meteorological conditions (temperature, humidity, wind speed) relate to pollution severity?

## 🗂️ Dataset — `enriched_aqi.csv`

- **Size:** 10,521 records × 22 fields
- **Coverage:** 503 monitoring stations across 268 cities in 30 Indian states
- **Pollutants:** PM2.5, PM10, NO2, SO2, CO, OZONE, NH3
- **Other fields:** AQI, AQI_Bucket, Temperature (°C), Humidity (%), Wind Speed (km/h), latitude/longitude, and time breakdowns (Year, Month, Day, Hour, Day_of_Week, Season)

## 🛠️ Tech Stack

- **Database:** MySQL / MySQL Workbench
- **BI & Visualization:** Power BI Desktop
- **Languages:** SQL, DAX

## 📁 Repository Contents

| File | Description |
|---|---|
| `AQI.pbix` | Power BI project file — full dashboard and reports |
| `enriched_aqi.csv` | Source dataset |
| `sql_queries.sql` | SQL queries used for data validation and exploratory analysis in MySQL |
| `README.md` | This file |

## ▶️ How to Run

1. Create a MySQL database and import `enriched_aqi.csv` (via MySQL Workbench's Table Data Import Wizard) into a table named `enriched_aqi`.
2. Run `sql_queries.sql` in MySQL Workbench to validate the load and reproduce the exploratory analysis.
3. Open `AQI.pbix` in Power BI Desktop.
4. If prompted, reconnect the data source to your local MySQL instance and refresh.

## 🔍 SQL Analysis (`sql_queries.sql`)

- Row count and null checks on `pollutant_avg` and `AQI` to verify data quality
- Min/max AQI across the dataset
- Average AQI by city, ranked descending, to identify pollution hotspots
- Average AQI by season
- Average and max pollutant concentration by `pollutant_id`, ranked descending
- Top 5 city/station combinations by average AQI
- Top 20 individual readings classified as `Severe` or `Hazardous`

## 📊 Power BI Report Pages (`AQI.pbix`)

1. **KPI & Decomposition Analysis** — KPI cards (Total Records, States Covered, Cities Monitored, Monitoring Stations, Average AQI, Maximum AQI), a Decomposition Tree (Average AQI by state → city → Season → pollutant_id), and a Key Influencers visual
2. **Dashboard Review** — Map, AQI trend line, top-cities bar chart, AQI_Bucket donut chart, pollutant-share pie chart, seasonal column chart, two scatter charts (Temperature vs AQI, Wind Speed vs AQI), a Q&A visual, and a slicer
3. **Interactive Dashboard** — consolidated single-page summary combining top KPIs, key charts, and the Decomposition Tree with written insights
4. **Air Pollution Monitoring & Analysis Report** — KPI cards (Temperature, Humidity, pollutant_min, Wind Speed averages), state/season slicers, and charts covering AQI by season & state, AQI_Bucket distribution, station coverage by season, AQI trend by year, and minimum wind speed by station
5. **Air Quality Patterns & Risk Analysis Report** — KPI cards (Cities Observed, High AQI Readings, Max Wind Speed), AQI_Bucket/Day_of_Week slicers, and charts covering AQI by hour, AQI by day of week, AQI by state, and pollutant averages by season

## 🧮 Key DAX Measures

```dax
Total Records = COUNTROWS('enriched_aqi')
States Covered = DISTINCTCOUNT('enriched_aqi'[state])
Cities Monitored = DISTINCTCOUNT('enriched_aqi'[city])
Monitoring Stations = DISTINCTCOUNT('enriched_aqi'[station])
Average AQI = AVERAGE('enriched_aqi'[AQI])
Maximum AQI = MAX('enriched_aqi'[AQI])
High AQI Readings = CALCULATE(COUNTROWS('enriched_aqi'), 'enriched_aqi'[AQI_Bucket] = "Hazardous")
```

## 💡 Key Insights

- **Pollution is highly localized** — a small number of stations and cities (e.g. Purnia in Sikkim) drive extreme hazardous readings, rather than pollution being uniformly moderate nationwide.
- **Season is the strongest single driver of AQI severity** — Winter and Spring both substantially raise average AQI (Key Influencers: Winter +41.55, Spring +39.25).
- **Mid-sized/industrial cities top the pollution ranking** (e.g. Cuddalore, Karwar, Bathinda) — not the usual major metros.
- **Particulate matter dominates** — PM10 and PM2.5 average higher than gas-phase pollutants like SO2 and OZONE, indicating particulate control matters most.

## 🎥 Demo


## 👤 Author

Rapaka Baby Varalakshmi
