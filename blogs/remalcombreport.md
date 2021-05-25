---
layout: page
title: RP- Vulnerability modeling for sub-Saharan Africa
---


**Replication of**
# Vulnerability modeling for sub-Saharan Africa

Original study *by* Malcomb, D. W., E. A. Weaver, and A. R. Krakowka. 2014. Vulnerability modeling for sub-Saharan Africa: An operationalized approach in Malawi. *Applied Geography* 48:17–30. DOI:[10.1016/j.apgeog.2014.01.004](https://doi.org/10.1016/j.apgeog.2014.01.004)

Replication Authors:
Alitzel Villanueva, Joseph Holler, Kufre Udoh, Open Source GIScience students of fall 2019, and group collaborators: [Drew An-Pham](https://daptx.github.io/malcomb/RP-Malcomb-Report.html), [Emma Clinton](https://emmaclinton.github.io/malcomb/RP-Malcomb-Report.html), [Jacob Freedman](https://jafreedman12.github.io/rp-malcomb-report/RP-Malcomb-Report.html), [Maja Cannavo](https://majacannavo.github.io/geog323/portfolio/malcomb/rp-malcomb), and [Nick Nonnenmacher](https://nicknonnen.github.io/malcomb/RP-Malcomb-Report.html).

Replication Materials Available at: [Re-Malcomb](https://github.com/avillanueva1005/RE-Malcomb-1)

Created: `25 May 2021`
Revised: `25 May 2021`

## Abstract

The original study is a multi-criteria analysis of vulnerability to Climate Change in Malawi, and is one of the earliest sub-national geographic models of climate change vulnerability for an African country. The study aims to be replicable, and had 40 citations in Google Scholar as of April 8, 2021.

## Original Study Information

The study region is the country of Malawi. The spatial support of input data includes DHS survey points, Traditional Authority boundaries, and raster grids of flood risk (0.833 degree resolution) and drought exposure (0.416 degree resolution).

The original study was published without data or code, but has detailed narrative description of the methodology. The methods used are feasible for undergraduate students to implement following completion of one introductory GIS course. The study states that its data is available for replication in 23 African countries.

### Data Description and Variables

This section was written collaboratively with: Maja Cannavo, Emma Clinton, Jacob Freedman, Nick Nonnenmacher, and Drew An-Pham.

#### **Assets & Access**

Demographic and Health Survey data are a product of the United States Agency for International Development (USAID). Variables contained in this dataset are used to represent adaptive capacity (access + assets) in the Malcomb et al.’s (2014) study. These data come from survey questionnaires with large sample sizes.
The DHS data used in our study were collected in 2010. In Malawi, the provenance of the DHA data dates back as far as 1992, but has not been collected consistently every year. Each point in the household dataset represents a cluster of households with each cluster corresponding to some form of census enumeration units, such as villages in rural areas or city blocks in urban areas [DHS GPS Manual](/data/metadata/DHS_GPS_Manual_English_A4_24May2013_DHSM9.pdf). This means that each household in each cluster has the same GPS data. This data is collected by trained [USAID](https://www.usaid.gov/) staff using GPS receivers.
Missing data is a common occurrence in this dataset as a result of negligence or incorrect naming. However, according to the [DHS GPS Manual](/data/metadata/DHS_GPS_Manual_English_A4_24May2013_DHSM9.pdf), these issues are easily rectified and typically sites for which data does not exist are recollected. Sometimes, however, missing information is coded in as such or assigned a proxy location.
The DHS website acknowledges the high potential for inconsistent or incomplete data in such broad and expansive survey sets. Missing survey data (responses) are never estimated or made up; they are instead coded as a special response indicating the absence of data. As well, there are clear policies in place to ensure the data’s accuracy. More information about data validity can be found on the [DHS’s Data Quality and Use site](https://www.dhsprogram.com/data/Data-Quality-and-Use.cfm).
In this analysis, we use the variables listed in **Table 1** to determine the average adaptive capacity of each TA area. Data transformations are outlined below.

*Transformations*:
- Eliminate households with null and/or missing values
- Join TA and LHZ ID data to the DHS clusters
- Pre-process the livestock data:
- Eliminate NA values for livestock
- Sum counts of all different kinds of livestock into a single variable
- Normalize each indicator variable and rescale from 1-5 (real numbers) based on percent rank
- Apply weights to normalized indicator variables to get scores for each category (assets, access)
- find the stats of the capacity of each TA (min, max, mean, sd)
- Join ta_capacity to TA based on ta_id
- Prepare breaks for mapping
- Class intervals based on capacity_2010 field
- Take the values and round them to 2 decimal places
- Put data in 4 classes based on break values

**Table 1**: DHS Variables used in Analysis

| Variable Code | Definition |
| ------------- | ------------- |
| HHID | "Case Identification" |
| HV001 | "Cluster number" |
|HV002 | Household number |
| HV246A |"Cattle own" |
|HV246D | "Goats own"|
|HV246E | "Sheep own" |
|HV246G | "Pigs own" |
| HV248 |"Number of sick people 18-59"|
| HV245 | "Hectares for agricultural land"|
|HV271 | "Wealth index factor score (5 decimals)"|
|HV251 | "Number of orphans and vulnerable children"|
|HV207 | “Has Radio” |
| HV243A | “Has a Mobile Telephone”|
|HV219 | Sex of Head of Household”|
|HV226 | “Type of Cooking Fuel” |
| HV206 |"Has electricty” |
 |HV204 |“Time to get to Water Source”|

*Demographic and Health Surveys Program*
- Source: The DHS Program—Data. (2010). The DHS Program--USAID. Retrieved April 19, 2021, from https://dhsprogram.com/Data/
- Collected by trained [USAID](https://www.usaid.gov/) staff using GPS receivers
      - GPS readings correspond to center of household cluster (one randomized point per household cluster)

*Malawi Traditional Authorities*
- Source: Download GADM data (version 2.8). (2018). Database of Global Administrative Areas. https://gadm.org/download_country_v2.html

*Major Lakes*
- Source: http://www.masdap.mw/
 Taken from OSM
 Transformations: used in EA variable to classify major lakes as such in final representation

Clara R. Burgert Blake Zachary Josh Colston — Authors of DHS document

#### **Livelihood Zones**
The Livelihood zone data is created by aggregating general regions where similar crops are grown and similar ecological patterns exist. This data exists originally at the household level and was aggregated into Livelihood Zones. To construct the aggregation used for “Livelihood Sensitivity” in this analysis, we use these household points from the FEWSnet data that had previously been aggregated into livelihood zones. The four Livelihood Sensitivity categories are 1) Percent of food from own farm (6%); 2) Percent of income from wage labor (6%); 3) Percent of income from cash crops (4%); and 4) Disaster coping strategy (4%). In the original R script, household data from the DHS survey was used as a proxy for the specific data points in the livelihood sensitivity analysis (transformation: Join with DHS clusters to apply LHZ FNID variables). With this additional FEWSnet data at the household level, we can construct these four livelihood sensitivity categories using existing variables (Table 1).
The LHZ data variables are outlined in **Table 2**. The four categories used to determine livelihood sensitivity were ranked from 1-5 based on percent rank values and then weighted using values taken from Malcomb et al. (2014).

**Table 2**: Constructing livelihood sensitivity categories

| Livelihood Sensitivity Category (LSC)  | Percent Contributing  | How LSC was constructed  |
| ------------- | ------------- | ------------- |
| Percent of food from own farm  |  6%  | Sources of food: crops + livestock  |
| Percent of income from wage labor  | 6%  | Sources of cash: labour etc. / total * 100  |
| Percent of income from cash crops  | 4%  | sources of cash (Crops): (tobacco + sugar + tea + coffee) + / total sources of cash * 100  |
| Disaster coping strategy  | 4%  | Self-employment & small business and trade: (firewood + sale of wild food + grass + mats + charcoal) / total sources of cash * 100  |

*Variables*
- *17 livelihood zones*
    - Livelihood zones created through: “The approach is to identify those factors (such as climate, soil, proximity to rivers, access to markets etc.) that determine the basic food and income options (the crops that will grow, the livestock that can be raised, the wild plants that can be collected, the fish that can be caught, and so on) and then to group similar areas together. In the case of Malawi, the exercise was one of updating an earlier food economy zone map prepared by Save the Children dating from 1996.” (2)
    - The data we used is just to extract the geometries of the livelihood zone data and basically create the geometry boundaries of Malawi for processing to determine park boundaries
- *FEWSnet data*
    - Percent of food from own farm (6%)
    - Percent of income from wage labor (6%)
      - Payment in cash: labour, employment, and remittances
    - Percent of income from cash crops (4%)
      - Crop = tobacco-burley, tobacco-oriental, cotton, sugar cane, maize, tea, coffee
    - Disaster coping strategy (4%)

*Transformations*
- Join with DHS clusters to apply LHZ FNID variables
- Clip TA boundaries to Malawi (st_buffer of LHZ to .01 m)
- Create ecological areas: LHZ boundaries intersected with TA boundaries to clip out park/conservation boundaries and rename those park areas with the park information from TA data), combined with lake data to remove environmental areas from the analysis

- Source: Download https://fews.net/data_portal_download/download?data_file_path=http%3A//shapefiles.fews.net.s3.amazonaws.com/LHZ/MW_LHZ_2009.zip
- Sources: Malawi Baseline Livelihood Profiles, Version 1* (September 2005). Made by Malawi National Vulnerability Assessment Committee in collaboration with the SADC FANR Vulnerability Assessment Committee -- file in metadata called mw_baseline_rural_en_2005.pdf

#### **Physical Exposure**

*Physical Exposure: Floods*
- Dataset title: “Global estimated risk index for flood hazard”
- “This dataset includes an estimate of the global risk induced by flood hazard. Unit is estimated risk index from 1 (low) to 5 (extreme). This product was designed by UNEP/GRID-Europe for the Global Assessment Report on Risk Reduction (GAR). It was modeled using global data. Credit: UNEP/GRID-Europe.”

This dataset stems from work collected by multiple agencies and funneled into the PREVIEW Global Risk Data Platform, “an effort to share spatial information on global risk from natural hazards.” The dataset was designed by UNEP/GRID-Europe for the Global Assessment Report on Risk Reduction (GAR), using global data. A flood estimation value is assigned via an index of 1 (low) to 5 (extreme).

*Physical Exposure: Physical exposition to droughts events 1980-2001*

This dataset uses the Standardized Precipitation Index to measure annual drought exposure across the globe. The Standardized Precipitation Index draws on data from a “global monthly gridded precipitation dataset” from the University of East Anglia’s Climatic Research Unit, and was modeled in GIS using methodology from Brad Lyon at Columbia University. The dataset draws on 2010 population information from the LandScanTM Global Population Database at the Oak Ridge National Laboratory.  Drought exposure is reported as the expected average annual (2010) population exposed. The data were compiled by UNEP/GRID-Europe for the Global Assessment Report on Risk Reduction (GAR). The data use the WGS 1984 datum, span the years 1980-2001, and are reported in raster format with spatial resolution 1/24 degree x 1/24 degree.

*Variables*
- Estimated risk for flood hazard
- Exposition to drought events

*Transformations*
- Load in UNEP raster
  - Set CRS for drought to EPSG:4326
  - Set CRS for flood to EPSG:4326
  - Reproject, clip, and resample based on bounding box (dimensions: xmin = 35.9166666666658188, xmax = 32.6666666666658330,  ymin = -9.3333333333336554, ymax = -17.0833333333336270) and resolution of blank raster we created: resolution is 1/24 degree x 1/24 degree
    - use bilinear resampling for drought to average continuous population exposure values
    - use nearest-neighbor resampling for flood risk to preserve integer values

- Sources: [UNEP/GRID-Europe](https://preview.grid.unep.ch)
Global Risk Data Platform: Data-Download. (2013). Global Risk Data Platform. https://preview.grid.unep.ch/index.php?preview=data&lang=eng
Drought: Physical exposition to droughts events 1980-2001
https://preview.grid.unep.ch/index.php?preview=data&events=droughts&evcat=4&lang=eng
Global estimated risk index for flood hazard
https://preview.grid.unep.ch/index.php?preview=data&events=floods&evcat=5&lang=eng

### Analytical Specification

The original study was conducted using ArcGIS and STATA, but does not state which versions of these software were used.
The replication study will use R.

## Materials and Procedure

#### Process Adaptive Capacity
1. Bring in DHS Data [Households Level] (vector)
2. Bring in TA (Traditional Authority boundaries) and LHZ (livelihood zones) data
3. Get rid of unsuitable households (eliminate NULL and/or missing values)
3. Join TA and LHZ ID data to the DHS clusters
4. Pre-process the livestock data
	Filter for NA livestock data
	Update livestock data (summing different kinds)
5. FIELD CALCULATOR: Normalize each indicator variable and rescale from 1-5 (real numbers) based on percent rank
6. FIELD CALCULATOR / ADD FIELD: Apply weights to normalized indicator variables to get scores for each category (assets, access)
7. SUMMARIZE/AGGREGATE: find the stats of the capacity of each TA (min, max, mean, sd)
8. Join ta_capacity to TA based on ta_id
	(Multiply by 20
9. Prepare breaks for mapping
      - Class intervals based on capacity_2010 field
      - Take the values and round them to 2 decimal places
      - Put data in 4 classes based on break values
10. Save the adaptive capacity scores

#### Process Livelihood Sensitivity
1. Load in LHZ csv into R
2. Join LHZ sensitivity data into R code
3. Create livelihood sensitivity score data based on breakdown provided in report (Table 2)

#### Process Physical Exposure
1. Load in UNEP rasterSet CRS for drought
2. Set CRS for flood
3. Clean and reproject rasters
4. Create a bounding box at extent of Malawi Where does this info come from
5. Add geometry info and precision (st_as_sfc)
      - For Drought: use bilinear to avg continuous population exposure values
      - For Flood: use nearest neighbor to preserve integer values
6. CLIP the traditional authorities with the LHZs to cut out the lake
7. RASTERIZE the ta_capacity data with pixel data corresponding to capacity_2010 field
8. RASTERIZE the livelihood sensitivity score with pixel data corresponding to capacity_2010 field
9. RASTER CALCULATOR:
      - Create a mask
      - Reclassify the flood layer (quintiles, currently binary)
      - Reclassify the drought values (quantile [from 0 - 1 in intervals of 0.2 =5])
      - Add component rasters for final weighted score of drought + flood

11. AGGREGATE: Create final vulnerability layer using envi. vulnerability score and ta_capacity

## Replication Results

For each output from the original study (mainly figure 4 and figure 5), present separately the results of the replication attempt.

2.	State whether the original study was or was not supported by the replication
3.	State whether any hypothesis linked to a planned deviation from the original study was supported. Provide key statistics and related reasoning.

![map of resilience by traditional authority in 2010, analagous to figure 4 of the original study](RE-Malcomb/ac_2010.png)
![map of vulnerability in Malawi, analagous to figure 5 of the original study](RE-Malcomb/vulnerability_full.png)
![map of difference between your figure 4 and the original figure 4](RE-Malcomb/fig4_diff_map.png)
![map of difference between your figure 5 and the original figure 5](RE-Malcomb/fig5_diff_map.png)

## Unplanned Deviations from the Protocol

Summarize changes and uncertainties between
- your interpretation and plan for the workflow based on reading the paper
- your final workflow after accessing the data and code and completing the code

## Discussion

Provide a summary and interpretation of the key findings of the replication *vis-a-vis* the original study results. If the attempt was a failure, discuss possible causes of the failure. In this replication, any failure is probably due to practical causes, which may include:
- lack of data
- lack of code
- lack of details in the original analysis
- uncertainties due to manner in which data has been used

## Conclusion

Restate the key findings and discuss their broader societal implications or contributions to theory.
Do the research findings suggest a need for any future research?

## References

Malcomb, D. W., E. A. Weaver, and A. R. Krakowka. 2014. Vulnerability modeling for sub-Saharan Africa: An operationalized approach in Malawi. *Applied Geography* 48:17–30. DOI:[10.1016/j.apgeog.2014.01.004](https://doi.org/10.1016/j.apgeog.2014.01.004)

####  Report Template References & License

This template was developed by Peter Kedron and Joseph Holler with funding support from HEGS-2049837. This template is an adaptation of the ReScience Article Template Developed by N.P Rougier, released under a GPL version 3 license and available here: https://github.com/ReScience/template. Copyright © Nicolas Rougier and coauthors. It also draws inspiration from the pre-registration protocol of the Open Science Framework and the replication studies of Camerer et al. (2016, 2018). See https://osf.io/pfdyw/ and https://osf.io/bzm54/

Camerer, C. F., A. Dreber, E. Forsell, T.-H. Ho, J. Huber, M. Johannesson, M. Kirchler, J. Almenberg, A. Altmejd, T. Chan, E. Heikensten, F. Holzmeister, T. Imai, S. Isaksson, G. Nave, T. Pfeiffer, M. Razen, and H. Wu. 2016. Evaluating replicability of laboratory experiments in economics. Science 351 (6280):1433–1436. https://www.sciencemag.org/lookup/doi/10.1126/science.aaf0918.

Camerer, C. F., A. Dreber, F. Holzmeister, T.-H. Ho, J. Huber, M. Johannesson, M. Kirchler, G. Nave, B. A. Nosek, T. Pfeiffer, A. Altmejd, N. Buttrick, T. Chan, Y. Chen, E. Forsell, A. Gampa, E. Heikensten, L. Hummer, T. Imai, S. Isaksson, D. Manfredi, J. Rose, E.-J. Wagenmakers, and H. Wu. 2018. Evaluating the replicability of social science experiments in Nature and Science between 2010 and 2015. Nature Human Behaviour 2 (9):637–644. http://www.nature.com/articles/s41562-018-0399-z.
