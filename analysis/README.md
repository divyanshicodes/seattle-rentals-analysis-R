# Seattle Short-Term Rental Market Analysis

This project explores the Seattle Airbnb rental market using exploratory data analysis and visualization techniques in R. The analysis focuses on understanding rental pricing, neighborhood patterns, guest activity, room types, property types, and geospatial distribution.  
The dataset used is `seattle_rentals.csv`, which includes listing-level data such as price, reviews, availability, bedroom count, bathrooms, and host information. :contentReference[oaicite:0]{index=0}  

---

## 📍 Project Goal

To analyze the Seattle short-term rental business and uncover meaningful patterns related to pricing, demand, property characteristics, and location trends.  
This includes:

- Understanding what influences rental prices  
- Identifying high-activity neighborhoods  
- Examining review patterns  
- Studying the distribution of property types and room types  
- Visualizing geospatial rental clusters  
- Understanding feature relationships using statistical and graphical methods  

---

## 📊 Dataset Description

- The dataset contains Airbnb listings from Seattle.  
- Each observation represents one listing.  
- Key features include price, number of reviews, number of bedrooms, availability, latitude/longitude, property type, room type, and more.  
- PDF project guidelines describe expected steps for business understanding, data exploration, and visualizations. :contentReference[oaicite:1]{index=1}

---

## 🛠 Methods & Workflow

The analysis includes the following components (based on the project code): :contentReference[oaicite:2]{index=2}

### **1. Data Cleaning**
- Handled missing values using `na.omit()`  
- Removed outliers in `maximum_nights > 2000` and `minimum_nights > 50`  
- Dropped non-essential columns for clarity  

### **2. Exploratory Visualizations**
- Distribution of rental prices (histogram + density)  
- Distribution of number of reviews  
- Rating score distribution  
- Number of rentals by neighborhood  
- Number of rentals by bedroom count  
- Listings by room type & property type  

### **3. Relationship Analysis**
- Correlation heatmap of numeric features  
- Price vs accommodates  
- Reviews vs neighborhood  
- Availability vs accommodates & price  
- Bedrooms vs bathrooms vs accommodates (multi-variable scatter)

### **4. Geospatial Mapping**
- Scattermap of listings by longitude/latitude  
- Colored by property type  

---

## 📈 Key Insights

- Rental prices show a heavy right skew, indicating many affordable listings and some high-priced outliers.  
- Neighborhoods differ greatly in both listing count and pricing distribution.  
- More accommodations and larger bedrooms generally correspond to higher prices.  
- Property type and room type heavily affect availability and guest demand.  
- Strong correlations exist between property size features (accommodates, bedrooms, bathrooms).  

---

## 🧰 Tools Used

- **R / RStudio**  
- `ggplot2`, `ggthemes` for visualization  
- `corrplot` for correlation heatmaps  
- `dplyr` for data manipulation  
- `ggmap` for geospatial plotting  

---

## 📦 Files in this Repository

