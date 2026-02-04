# FitSync AI Service

The **FitSync AI Service** is the intelligence engine behind the platform, responsible for generating personalized workout plans, dietary recommendations, calorie estimates, and health metric analysis using machine learning models.

## 🧠 Core Capabilities

This service exposes a REST API built with **FastAPI** that interacts with pre-trained Machine Learning models:

1.  **Workout Recommendation**: Clustering users based on health conditions and demographics to suggest appropriate exercise plans.
2.  **Diet Recommendation**: Clustering food items to suggest meals compatible with user health conditions.
3.  **Calorie Estimation**: Regression models to predict daily calorie maintenance needs based on comprehensive biometrics.
4.  **Heart Rate Analysis**: Classification models to predict healthy heart rate ranges based on age and activity intensity.

## 🛠 Technology Stack

*   **API Framework**: FastAPI
*   **Server**: Uvicorn
*   **Data Manipulation**: Pandas, NumPy
*   **Machine Learning**: Scikit-Learn (K-Means, Random Forest, etc.)
*   **Model Serialization**: Joblib/Pickle

## 📂 Project Structure

```bash
Ai/
├── api/
│   ├── main.py          # FastAPI Application & Route Definitions
│   ├── model/           # Model loading and inference logic
│   └── requirements.txt # Python dependencies
├── data/                # Datasets for training and lookup
│   ├── workout/         # Workout datasets
│   ├── food/            # Food/Diet datasets
│   └── heartbeat/       # Heart rate datasets
├── models/              # Saved binary model files (.pkl)
└── *.ipynb              # Jupyter Notebooks for EDA and Model Training
```

## 🚀 Getting Started

### Prerequisites
*   Python 3.8+
*   pip

### Installation

1.  Navigate to the `api` directory:
    ```bash
    cd api
    ```

2.  Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

### Running the Server

Start the live development server:
```bash
uvicorn main:app --reload
```
The API will be accessible at `http://localhost:8000`.

*   **Swagger UI**: `http://localhost:8000/docs` (Interactive documentation)
*   **ReDoc**: `http://localhost:8000/redoc`

## 📡 API Endpoints

### 🏋️ Workouts

#### `GET /workout`
Returns a personalized workout plan consisting of 3 randomized exercises from the user's assigned cluster.

*   **Parameters**:
    *   `Gender` (int): 0 for Male, 1 for Female (or grouped encoding)
    *   `Knee_pain` (int): 0 (No), 1 (Yes)
    *   `Back_pain` (int): 0 (No), 1 (Yes)
    *   `Diabeties` (int): 0 (No), 1 (Yes)
    *   `Heart_Disease` (int): 0 (No), 1 (Yes)
    *   `Hypertension` (int): 0 (No), 1 (Yes)

*   **Response**: List of workout objects.
    ```json
    [
      {
        "Exercise Plan": "Plank, Lunges...",
        "Category": "Strength",
        "Impact Level": "Beginner",
        "Total Plan Duration (minutes)": "30",
        "Calories Burned (Plan)": "200",
        "Target Muscle Group": "Core"
      }
    ]
    ```

#### `GET /challenges`
Returns a set of 7 workout challenges suitable for the user's profile.
*   **Parameters**: Same as `/workout`.

#### `GET /all_recommended_workouts`
Returns all workout plans available in the user's assigned cluster.
*   **Parameters**: Same as `/workout`.

#### `GET /all_workouts`
Returns the entire database of workout plans without filtering.

### 🥗 Nutrition

#### `GET /food`
Returns 3 recommended food items based on health conditions.

*   **Parameters**:
    *   `Diabeties` (int): 0 or 1
    *   `Heart_Disease` (int): 0 or 1
    *   `Hypertension` (int): 0 or 1

*   **Response**: List of food objects.

#### `GET /food_all`
Returns all recommended food items for the user's health profile cluster.
*   **Parameters**: Same as `/food`.

#### `GET /Ingredients`
Search for food items containing a specific ingredient.
*   **Parameters**:
    *   `Ingredient` (str): Name of the ingredient (e.g., "Chicken").

### ⚕️ Health & Biometrics

#### `GET /calories`
Predicts the Total Daily Energy Expenditure (TDEE) / Calorie Needs.

*   **Parameters**:
    *   `Age` (int)
    *   `Gender` (int)
    *   `Weight` (int): in kg
    *   `Height` (int): in cm
    *   `Activity_Level` (int): 1-5 scale
    *   `Systolic_BP`, `Diastolic_BP`, `Cholesterol_Level`, `Blood_Sugar` (int): Health metrics
    *   `Hypertension`, `Low_Pressure`, `Diabetes`, `Heart_Condition` (int): Conditions (0/1)
    *   `BMR` (int): Basal Metabolic Rate

*   **Response**:
    ```json
    {
      "Total Daily Calories": 2500.0
    }
    ```

#### `GET /pulse`
Predicts the expected heart rate range for a given activity level.

*   **Parameters**:
    *   `Age` (int)
    *   `Activity_level` (int): Intensity of activity
    *   `Active` (bool): User activity status

*   **Response**:
    ```json
    {
      "Min": "60",
      "Max": "100"
    }
    ```

## 📊 Model Details

The AI services rely on models trained using **Scikit-Learn** in Jupyter Notebooks.

| Feature | Notebook | Algorithm | Input Features | Value to Predict |
| :--- | :--- | :--- | :--- | :--- |
| **Workouts** | `Workout_Clustering.ipynb` | K-Means Clustering | Gender, Knee/Back Pain, Health Conditions | `Cluster` (Group of users with similar needs) |
| **Diet** | `Food_Clustering.ipynb` | K-Means Clustering | Health Conditions (Diabetes, Heart, BP) | `Cluster` (Group of suitable foods) |
| **Calories** | `Calories.ipynb` | Regression (RandomForest/XGBoost) | Age, Weight, Height, Activity, BMR, Health Metrics | `Total Daily Calories` |
| **Heart Rate** | `heart_beat.ipynb` | Classification (KNN) | Age, Intensity Level, Active Status | `Heart Beat Range` (Classified) |


## 📈 Model Performance

The following metrics were achieved during model training and validation:

| Feature | Model Type | Metric | Score | Details |
| :--- | :--- | :--- | :--- | :--- |
| **Workout Recommendation** | K-Means Clustering | Silhouette Score | 0.6904 | Indicates good cluster separation and density. |
| **Diet Recommendation** | K-Means Clustering | Silhouette Score | 0.7130 | Indicates strong grouping of food items. |
| **Calorie Prediction** | Random Forest Regressor | R² Score | 91.70% | High variance explanation on test data. |
| **Heart Rate Analysis** | Support Vector Classifier | Accuracy | 95.91% | High classification accuracy on validation set. |

## 📝 development

To train new models or update existing ones:
1.  Open the relevant `.ipynb` file in Jupyter/VS Code.
2.  Run the training logic.
3.  Save the trained model (usually via `joblib.dump`) to the `models/` directory.
4.  Update `api/model/model.py` to load the new model file.
