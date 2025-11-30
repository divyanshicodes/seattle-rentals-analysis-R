# Seattle Short-Term Rentals Analysis
# Author: Divyanshi Mishra

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrplot)
library(ggmap)

# Load data
data <- read.csv("seattle_rentals.csv", header = TRUE)

# Missing values
sum(is.na(data))

# Remove NA rows
clean_data <- na.omit(data)

# Remove outliers
clean_data <- clean_data %>% 
  filter(maximum_nights < 2000,
         minimum_nights < 50)

# Drop unnecessary columns
clean_data <- clean_data[, c(-4, -6, -7, -8)]

summary(clean_data)

# -----------------------------
# Price Distribution
# -----------------------------
ggplot(clean_data, aes(price)) +
  geom_histogram(bins = 30, fill = "blue", color = "black") +
  theme_minimal() +
  ggtitle("Distribution of Rental Prices")

ggplot(clean_data, aes(price)) +
  geom_density(fill = "lightblue", alpha = 0.6) +
  theme_minimal() +
  ggtitle("Price Density Plot")

# -----------------------------
# Review Distributions
# -----------------------------
ggplot(clean_data, aes(number_of_reviews)) +
  geom_histogram(fill = "green", color = "black") +
  theme_minimal() +
  ggtitle("Distribution of Number of Reviews")

ggplot(clean_data, aes(review_scores_rating)) +
  geom_histogram(fill = "gold", color = "black") +
  theme_minimal() +
  ggtitle("Distribution of Review Score Ratings")

# -----------------------------
# Bar Charts
# -----------------------------
ggplot(clean_data, aes(neighbourhood_group_cleansed)) +
  geom_bar(fill = "orange", color = "black") +
  coord_flip() +
  theme_minimal() +
  ggtitle("Number of Rentals by Neighborhood")

ggplot(clean_data, aes(factor(bedrooms))) +
  geom_bar(fill = "purple", color = "black") +
  theme_minimal() +
  ggtitle("Number of Rentals by Bedrooms")

ggplot(clean_data, aes(room_type)) +
  geom_bar(fill = "red", color = "black") +
  theme_minimal() +
  ggtitle("Listings by Room Type")

ggplot(clean_data, aes(property_type)) +
  geom_bar(fill = "yellow", color = "black") +
  coord_flip() +
  theme_minimal() +
  scale_y_log10() +
  ggtitle("Listings by Property Type (Log Scale)")

# -----------------------------
# Correlation Heatmap
# -----------------------------
numeric_data <- clean_data %>% select_if(is.numeric)
cor_matrix <- cor(numeric_data, use = "complete.obs")

corrplot(cor_matrix,
         method = "color",
         tl.cex = 0.7,
         addCoef.col = "darkblue")

# -----------------------------
# Price vs Accommodates
# -----------------------------
ggplot(clean_data, aes(factor(accommodates), price)) +
  geom_boxplot(fill = "orange") +
  theme_minimal() +
  ggtitle("Price vs Accommodates")

# -----------------------------
# Geospatial Map
# -----------------------------
ggplot(clean_data, aes(longitude, latitude, color = property_type)) +
  geom_point() +
  theme_minimal() +
  ggtitle("Geospatial Distribution of Rentals")

# -----------------------------
# Multi-Variable Scatter
# -----------------------------
ggplot(clean_data, aes(accommodates, bedrooms)) +
  geom_point(aes(color = bathrooms), size = 4) +
  theme_minimal() +
  scale_color_gradient(low = "gold", high = "red") +
  ggtitle("Accommodates vs Bedrooms Colored by Bathrooms")

# -----------------------------
# Availability vs Accommodates
# -----------------------------
ggplot(clean_data, aes(availability_365, accommodates)) +
  geom_point(aes(color = price)) +
  theme_minimal() +
  scale_color_gradient(low = "red", high = "black") +
  ggtitle("Availability vs Accommodates Colored by Price")
