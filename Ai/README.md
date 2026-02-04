# FitSync AI Service

The **FitSync AI Service** is the intelligence engine behind the platform, providing personalized workout plans, dietary recommendations, and health metrics analysis using machine learning models.

## 🧠 Purpose
This service exposes a REST API built with **FastAPI** that interacts with pre-trained Machine Learning models to:
*   Cluster users for personalized workout recommendations.
*   Cluster food items for dietary suggestions.
*   Predict daily calorie needs based on biometrics.
*   Analyze heart beat data for pulse trends.

## 🛠 Technology Stack
*   **Framework**: FastAPI (Python)
*   **Data Processing**: Pandas, NumPy
*   **Machine Learning**: Scikit-learn, Transformers, Diffusers
*   **Server**: Uvicorn

## 📂 Project Structure
```bash
Ai/
├── api/
│   ├── main.py         # Application Entry Point & Endpoints
│   ├── model/          # Logic for loading and using models
│   └── requirements.txt # Python dependencies
├── data/               # Raw and processed datasets (CSV)
├── models/             # Serialized ML models (Pickle/Joblib)
└── *.ipynb             # Jupyter Notebooks for training and analysis
```

## 🚀 Getting Started

### Prerequisites
*   Python 3.8+
*   pip

### Installation
1.  Navigate to the API directory:
    ```bash
    cd api
    ```

2.  Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```

### Running the Server
Start the development server:
```bash
uvicorn main:app --reload
```
The API will be available at `http://localhost:8000`.

## 📡 API Endpoints

### Workouts
*   `GET /workout`: Get personalized workout plan based on health conditions.
*   `GET /challenges`: Get workout challenges.
*   `GET /all_recommended_workouts`: Get all recommended workouts for a profile.
*   `GET /all_workouts`: List all available workouts.

### Nutrition
*   `GET /food`: Get food recommendations based on health conditions (Diabetes, Heart Disease, etc.).
*   `GET /food_all`: Get comprehensive food list.
*   `GET /Ingredients`: Search for food items by ingredient.
*   `GET /calories`: Calculate daily calorie requirements based on biometrics (Age, Weight, Height, etc.).

### Health
*   `GET /pulse`: Predict heart rate range based on age and activity level.

## 📊 Models & Notebooks
The `Ai/` root contains Jupyter notebooks used for data collection and model training:
*   `Calories.ipynb`: Calorie prediction model training.
*   `Food_Clustering.ipynb`: K-Means clustering for food recommendation.
*   `Workout_Clustering.ipynb`: Clustering for workout plans.
*   `heart_beat.ipynb`: Heart beat analysis models.

## ⚙️ Configuration
Refrain from modifying `model/model.py` unless training new models, as it contains the logic for loading the serialized `.pkl` files located in the `models/` directory.
