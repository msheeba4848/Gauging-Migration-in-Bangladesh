# Gauging Migration in Bangladesh

## Project Overview

This project examines migration patterns in Bangladesh, leveraging data from the study, *Extreme Weather and Migration: Evidence from Bangladesh* by Amanda R. Carrico and Katharine Donato. The study investigates the link between extreme weather conditions and migration in Bangladesh. Our analysis explores additional socio-economic and environmental factors that influence migration, expanding on the primary authors’ findings.

## Acknowledgements

- **Primary Data Source**: Carrico, A. R., & Donato, K. (2019). *Extreme weather and migration: evidence from Bangladesh*. *Population and Environment*, 41(1), 1–31. [DOI:10.1007/s11111-019-00322-9](https://doi.org/10.1007/s11111-019-00322-9)
- **Color Palette**: Urban Sunset by PresentationGo, available at [Urban Sunset Custom Color Palette for PowerPoint](https://www.presentationgo.com/presentation/urban-sunset-custom-color-palette-for-powerpoint/).

## Abstract

This project leverages cleaned survey data from Carrico and Donato’s study. By conducting feature selection and predictive modeling, we examined socio-economic and environmental impacts on migration patterns in Bangladesh. Key influencing factors include occupation, wages, and education level. Results highlight the complex interactions between climate-induced migration and socio-economic factors.

## Datasets

Three main datasets, derived from extensive surveys, were analyzed:

1. **Dataset 01**: Socio-economic and environmental influences on migration.
2. **Dataset 02**: Migration patterns related to education, wage levels, and job types.
3. **Dataset 03**: Health-related aspects, focusing on medical care and health status before and after migration.

## Methodology & Data Processing

The data consists primarily of categorical or binary-encoded survey responses, often without numeric values. For each dataset, we applied feature selection methods:
- **Numerical Features**: ANOVA based on F-test
- **Categorical Features**: Chi-squared test based on p-values

Each dataset was analyzed to determine migration drivers, such as the socio-economic impacts of climate change, wages, and local infrastructure.

## Modeling Approach

We used several machine learning models to analyze migration patterns, including:
- **Decision Tree** (Base Model): Best performing model for Dataset 01 with an RMSE of 0.3181, MAE of 0.1314, and R-squared of 0.9661.
- **Other Models**: Gradient Boosting, Random Forests, and Stacked Models also performed well, with RMSE values around 0.3.

### Dataset 02 Analysis
Top models for Dataset 02 were evaluated based on the ROC and AUC metrics, with **XGBoost** performing best. Significant predictors included:
- Number of trips, rent per month, remittances, wage, education level, and occupation (e.g., rickshaw driver, construction worker).

## Results & Conclusion

Our analysis shows that climate change and socio-economic factors, such as rent, remittances, and wages, significantly influence migration in Bangladesh. The **Decision Tree model** proved most effective for predictive modeling, especially for migration decisions influenced by environmental factors. Our findings underscore the importance of tailoring migration interventions to specific socio-economic and environmental conditions.

## Further Research

Future work could extend this approach to other regions affected by climate change to better understand migration patterns. The team’s analytical framework could also be applied to neighboring countries with similar demographics.

## References

- Carrico, A. R., & Donato, K. (2019). *Extreme weather and migration: evidence from Bangladesh*. *Population and Environment*, 41(1), 1–31. [DOI:10.1007/s11111-019-00322-9](https://doi.org/10.1007/s11111-019-00322-9)
- PresentationGo. (2024). *Urban Sunset: Custom Color Palette for PowerPoint*. [Link](https://www.presentationgo.com/presentation/urban-sunset-custom-color-palette-for-powerpoint/)

