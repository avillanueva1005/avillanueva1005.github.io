---
layout: page
title: Gravity Model Spatial Interaction
---

Deliverables:
- [Web Map of Results](assets/gravity)
- [Gravity Model](gravitymodel.model3)
- [Hospital Preprocessing Model](preprocessing.model3)

A gravity model is an incredibly useful tool that can address issues of accessibility and distance between two objects. In this case, we are looking at the accessibility of hospitals within Vermont to analyze the service area of different hospitals in different towns throughout the state. Using two different input point layers, we can examine

![Hospital data preprocessed model](preprocessing.png)

![Gravity model](gravitymodelmap.png)

Data sources:
- Hospital Data: [Homeland Security](https://hifld-geoplatform.opendata.arcgis.com/datasets/6ac5e325468c4cb9b905f1728d6fbf0f_0)
- [Dartmouth Atlas of Health Care boundary files](https://atlasdata.dartmouth.edu/downloads/supplemental#boundaries)
- Town Data: [American Community Survey 2018 5-year Average](netown.gpkg), complied by Prof. Holler.
