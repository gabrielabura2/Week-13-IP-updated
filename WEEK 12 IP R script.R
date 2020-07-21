Advertising for Cryptography Course
DEFINE THE QUESTION
A Kenyan entrepreneur has created an online cryptography course and would want to advertise it on her blog. She currently targets audiences originating from various countries. In the past, she ran ads to advertise a related course on the same blog and collected data in the process. She would now like to employ your services as a Data Science Consultant to help her identify which individuals are most likely to click on her ads. 
METRIC OF SUCCESS
Enabling ourselves to see wgich type of and how many customers would click on the ad for a specific time period
DATA UNDERSTANDING
The dataset has 1000 entries and 10 columns. The columns include:
Daily Time Spent on Site Age Area Income Daily Internet Usage Ad Topic Line City Male Country Timestamp Clicked on Ad
DATA RELEVANCE
The data is relevant for carrying out EDA





Loading the dataset
```{r}
# Import the dataset.
install.packages("data.table")
library("data.table")

ad <- fread("http://bit.ly/IPAdvertisingData")
head(ad)
View(ad)
```
Data Cleaning

```{r}
###Check for missing values
colSums(is.na(ad))

```
We have no missing values in our columns

Next we check for outliers


```{r}
# Check for outliers for our numeric columns
# They will be represented on boxplots
#
numeric <- c(ad[, 1:4])
boxplot(numeric)
```
Dropping the outliers
```{r}
numeric_clean <- na.omit(numeric)

numeric_clean
```

# We are encouraged to drop outliers especially in cases where they are likely to distort the predictions we are trying to make

DATA ANALYSIS
# For the analysis we will carry out both Univeriet and Bivariet ,also we will try make plots to het a general overview of our factors in the dataset

We will start by analysing numerical columns

```{r}
# Univariate Analysis.
#
time_spent_on_site <- c(ad$`Daily Time Spent on Site`)
age <- c(ad$`Age`)
area_income <- c(ad$`Area Income`)
net_usage <- c(ad$`Daily Internet Usage`)
clicked_on_ad <- c(ad$`Clicked on Ad`)

# Barplots of Numerical columns.
#

hist(time_spent_on_site)
hist(age)
hist(area_income)
hist(net_usage)
hist(clicked_on_ad)

```



Bivarient Analysis
## On bivarient analysis we will checkk the covariances and correlations between our variables

```{r}
# age and clicked_on_ad
#
cor(age, clicked_on_ad)

# area_income and clicked_on_ad
#
cor(area_income, clicked_on_ad)

# net_usage and clicked_on_ad
#
cor(net_usage, clicked_on_ad)

# time_spent_on_site and clicked_on_ad
#
cor(time_spent_on_site, clicked_on_ad)


```
## From that anlysis we can infer that age and clicked on have the highest positive correlation while net usage and clicked on ad have the highest negative correlation


Next we check out the covariance

```{r}
# age and clicked_on_ad
#
cov(age, clicked_on_ad)

# area_income and clicked_on_ad
#
cov(area_income, clicked_on_ad)

# net_usage and clicked_on_ad
#
cov(net_usage, clicked_on_ad)

# time_spent_on_site and clicked_on_ad
#
cov(time_spent_on_site, clicked_on_ad)

```
Here again we see the highest covariance was between age and whether a potential customer clicked on the ad also there were extremely high negative correlations shown by net usage and whether a customer clicked on an ad

Next we visualize our factors on scatterplot to get insights from them

# age scatterplot
```{r}
# Scatterplot - Age
#

plot(clicked_on_ad, age, xlab = "Clicked Ad", ylab = "Age")
```

From the above scatter we can infer that most users who click on the adds are between the ages of 20 and 55

## Scatter for time spent
```{r}
# Scatterplot - time_spent_on_site
#

plot(clicked_on_ad, time_spent_on_site, xlab = "Clicked Ad", ylab = "Time spent on the site")
```

This proves our positive correlation between time spent on the site and clicked ads . The longer a "potential" customer stays on the site the more likely they are to Click on an add

# Next is a scatter for net usage

```{r}
# Scatterplot - net-usage
#

plot(clicked_on_ad, net_usage, xlab = "Clicked Ad", ylab = "Net Usage")
```
This factor as seen above does not affect whether a customer choses to click an add or not




