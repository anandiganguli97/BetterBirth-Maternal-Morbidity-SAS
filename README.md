# # 🩺 Predicting Maternal Morbidity: A SAS-Based Exploration Using BetterBirth Data


_An analysis of maternal morbidity predictors using the BetterBirth dataset and advanced model selection techniques in SAS._ 

**By Anandi Ganguli**

---

## 📌 Project Overview

This project uses SAS to explore the predictors of **maternal morbidity** using data from the BetterBirth clinical initiative. The primary goal is to identify which demographic and clinical variables are most associated with higher morbidity risk.

## 📂 About the Dataset

The dataset used in this project is based on anonymized data from the **BetterBirth Trial**, a multi-site randomized controlled study conducted in Uttar Pradesh, India, to assess the impact of the WHO Safe Childbirth Checklist. It contains maternal demographics, pregnancy history, clinical risk factors, and outcomes related to maternal morbidity.


🔬 **Methods Used:**
- Descriptive statistics and visualization
- Correlation matrix
- Full regression model using `PROC GLM`
- Variable selection via:
  - **Forward selection**
  - **Backward elimination**
  - **Stepwise regression**
- Final model estimation with `PROC GENMOD`

🛠️ **Tool Used:** SAS  


---

## 📁 File Structure

| File Name                 | Description |
|--------------------------|-------------|
| `Better_birth.sas`       | Complete SAS script (import, summary stats, regression modeling, selection steps) |
| `histo-maternal-morbidity.png` | Histogram of maternal morbidity distribution |
| `README.md`              | You're here! |

---

## 📊 Key Findings

- **Higher maternal morbidity** was associated with:
  - **Lower literacy**
  - **Higher mean gravida**
  - **District of residence (Lucknow vs others)**

- Other variables like age brackets, anemia status, and caste (OBC) were **not significant** in the final model.

- **Final model retained:**  
  `literacy`, `meangravida`, and `lucknow` (district) as predictors based on `PROC GENMOD`.

- Among the selection methods:
  - **Backward elimination and stepwise** both identified similar subsets
  - **Forward selection** retained slightly more predictors

---

## 📉 Visualization

![image](https://github.com/user-attachments/assets/b5fc77ed-82ea-465a-b70c-cee2f48b72ea)

Histogram shows a right-skewed distribution, with most observations concentrated around 10% morbidity.

---

## 📌 Data Source

This dataset is part of the **BetterBirth** public health initiative. The version used was provided in academic coursework and is used here solely for educational and research purposes.

---

## 👩‍💻 Author

**Anandi Ganguli**  
MPH – Epidemiology | University of Minnesota  



