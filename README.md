# Air Quality Intelligence: India Air Pollution Monitoring, Operational and Risk Analysis

A SQL + Power BI project analyzing 10,521 air quality readings across 268 cities and 503 stations in India to identify pollution hotspots, track compliance, and support public health decisions.

## Tech Stack
- MySQL Workbench
- Power BI Desktop (DAX)

## Repository Contents
- `1. Project Initialization and Planning Phase/` — problem statement, proposal, project planning
- `2. Data Collection and Preprocessing Phase/` — raw data sources, data quality, preprocessing docs
- `3. Data Visualization/` — business questions & visualization report
- `4. Dashboard/` — dashboard design documentation
- `5. Report/` — report design documentation
- `6. Project Executable Files/` — `enriched_aqi.csv` (dataset) and `AQI.pbix` (Power BI file)
- `7. Project Final Report/` — final consolidated project report
- `demo_video_AQI.mp4` — project walkthrough video

## Key Features
- 7 DAX measures, Decomposition Tree, Key Influencers (AI insights)
- 30+ visuals across 5 report pages
- Two role-specific reports: Air Pollution Monitoring & Analysis, and Air Quality Patterns & Risk Analysis
- Q&A visual + interactive slicers

## Key Insight
Season is the strongest driver of AQI severity (Winter/Spring highest), and pollution is highly localized — a few specific stations drive most hazardous readings.

## How to Run
1. Import `enriched_aqi.csv` (from `6. Project Executable Files/`) into MySQL
2. Open `AQI.pbix` (from the same folder) in Power BI Desktop, connect to your database, and refresh

## Author
Rapaka Baby Varalakshmi
