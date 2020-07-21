













## Installing Packages

```{r}
install.packages("tidyverse")
install.packages("modelr")
install.packages("broom")
```


# Loading the packages

```{r}
library(tidyverse) 
library(modelr)     
library(broom)      

```

# Loading the dataset
```{r}
retail <- read.csv("C:/Users/guest1/Downloads/online_shoppers_intention.csv")
head(retail)
```
# Get a preview of the top of the dataset and understand the data structure
# Then we also check the colnmn names in our dataset
```{r}
head(retail)
class(retail)
names(retail)
```
DATA CLEANING

## Tidying data
Find Null values
```{r}
sum(is.na(retail))
```
```{r}
which(is.na(retail))
```

We see that our dataset has 112 missing/nulll values hence we have to deal with them.


## splitting numeric and categorical columns


```{r}
library(dplyr)
```



```{r}
numeric <- select_if(retail, is.numeric)
numeric
```
Categorical data

```{r}
categoric <- select_if(retail, is.factor)
categoric
```

```{r}
boxplot(numeric, horizontal=FALSE)
```


#label encoding categorical variables so we can carry out different analysis



```{r}
le = function(vec){
    levels = sort(unique(vec))
    function(x){
        match(x, levels)
    }
}
```




UNIVARIENT ANALYSIS
# here we shall visualize the specicific colmns on histogram plots to get an idead of what insights they give



```{r}
ad_dur <- c(retail$Administrative_Duration)
hist(ad_dur)
```

```{r}
inform <- c(retail$Informational)
hist(inform)
```

```{r}
inform_dur <- c(retail$Informational_Duration)
hist(inform_dur)
```
```{r}
prod_r <- c(retail$ProductRelated)
hist(prod_r)
```

```{r}
prod_r_d<- c(retail$ProductRelated_Duration)
hist(prod_r_d)
```



```{r}
E_rates <- c(retail$ExitRates)
hist(E_rates)
```

```{r}
Pagvalues <- c(retail$PageValues)
hist(Pagvalues)
```

```{r}
spday <- c(retail$SpecialDay)
hist(spday)
```

Bivarient Analysis
## We shall plot Productrelateddruration against Region

```{r}
prodxreg <- c(retail$Revenue)
plot(prod_r_d, region)
```


Impliment the solution using the Clustering modles learnt this week
## In this case we used Hierichal clustering








```{r}
d <- dist(retail, method = "euclidean")
```
```{r}
res.hc <- hclust(d, method = "ward.D2" )
```


```{r}
plot(res.hc, cex = 0.6, hang = -1)
```

