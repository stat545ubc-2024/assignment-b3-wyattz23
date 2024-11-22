# 📊 **WyattAPP: MTCars Dataset Explorer**
# Student Name:

Xiang Zhang (prefered name: Wyatt Zhang)
### **Overview**
This Shiny application allows users to explore and analyze the `mtcars` dataset interactively. Users can filter cars based on key attributes like MPG, horsepower, and the number of cylinders, and view the results in both graphical and tabular formats.

🔗 **Live App Link**: [View the Shiny App](https://wyattz23.shinyapps.io/wyattapp/)

---

## **Features**

### 1. **Interactive Plot**
- The app displays a customizable scatter plot comparing two variables from the `mtcars` dataset.
- Users can select the X and Y axes to visualize relationships between metrics such as MPG, horsepower, weight, etc.

### 2. **Customizable Filters**
- A slider allows users to set a range for **Miles Per Gallon (MPG)** and **Horsepower (HP)**.
- A checkbox lets users filter cars by the number of **cylinders** (4, 6, or 8).

### 3. **Interactive Data Table**
- The app includes a searchable and sortable data table displaying filtered results.
- Users can sort the table by any column and download the filtered data as a CSV file for further analysis.

### 4. **Result Count**
- Displays the total number of cars matching the selected filters, updating dynamically as filters are adjusted.

---

## **Dataset**

This app uses the built-in **`mtcars` dataset** in R. It provides information about various car models, with the following key variables:

- **mpg**: Miles per gallon (fuel efficiency).
- **cyl**: Number of cylinders (4, 6, or 8).
- **hp**: Horsepower.
- **wt**: Weight (in 1000 lbs).
- **gear**: Number of forward gears.
- **drat**: Rear axle ratio.
- **qsec**: 1/4 mile time (seconds).
- **vs**: Engine shape (0 = V-shaped, 1 = straight).
- **am**: Transmission (0 = automatic, 1 = manual).

This dataset is ideal for exploring vehicle performance metrics.

---

## **How to Use**

1. **Filter the Data**:
   - Use the sliders to adjust ranges for **MPG** and **Horsepower**.
   - Select the number of **Cylinders** using checkboxes.

2. **View the Results**:
   - Switch between the **Table** and **Plot** tabs:
     - **Table**: View filtered data interactively in a table. Sort and search for specific entries.
     - **Plot**: Visualize the relationship between selected metrics using the customizable scatter plot.

3. **Download Data**:
   - Click the **Download Filtered Data** button to export the filtered dataset as a CSV file.

---

## **Technical Details**
This app was built using the following R packages:
- **Shiny**: For building the interactive app.
- **DT**: For rendering the interactive table.
- **Base R**: For data filtering and manipulation.

---

Feel free to reach out if you have questions or feedback about this app!
