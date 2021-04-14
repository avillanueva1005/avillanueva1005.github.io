ADAPTIVE CAPACITY WORKFLOW [ASSETS & ACCESS]

Bring in DHS Data [Households Level] (vector)
FIELD CALCULATOR: Normalize each indicator variable into quintiles (0 is lowest, 5 is highest--we understand this doesn’t make sense if there are only 5 categories, but this is what the authors said they did)
FIELD CALCULATOR / ADD FIELD: Apply weights to normalized indicator variables to get scores for each category (assets, access, livelihood sensitivity, physical exposure)
FIELD CALCULATOR / ADD FIELD: Combine assets and access into adaptive capacity
AGGREGATE: Aggregate into villages
AGGREGATE: Aggregate into TA geometries, calculate average adaptive capacity score (Assets + Access) for each TA

**Results: Figs. 3 & 4 (for us, only most recent data will be used - equivalent to Fig. 4)**


HOUSEHOLD RESILIENCE & RASTER WORKFLOW [FINAL DELIVERABLE]

RASTERIZE: turn household resilience at TA level into raster data at pixel size (30m? 90m?) of FEWSNET and UNEP
Bring in FEWSNET data (raster) and UNEP/GRID data (raster)
RASTER CALCULATOR: quintile (assign scores 0-5) and weight FEWSNET & UNEP/GRID data
RASTER CALCULATOR: Using FEWSNET, UNEP/GRID, and rasterized DHS resilience data; Calculate household resilience using the following formula:
Household Resilience = Adaptive Capacity + Livelihood Sensitivity - Physical Exposure

**Results: Fig. 5**
