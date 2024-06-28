import pickle
import re 
from pathlib import Path
import joblib
import os

__version__="1.0.1"

foodpath = os.path.join('model', 'Food.pkl')
food_model = joblib.load(foodpath)

workoutpath = os.path.join('model', 'Workouts.pkl')
workout_model = joblib.load(workoutpath)

caloriespath = os.path.join('model', 'Calories.pkl')
calories_model = joblib.load(caloriespath)

heartpath = os.path.join('model', 'Heart_Beat.pkl')
heart_beat_model = joblib.load(heartpath)

def food_prediction(input_data):
    prediction = food_model.predict([input_data])
    return prediction[0]

def workout_prediction(input_data):
    prediction = workout_model.predict([input_data])
    return prediction[0]

def calories_prediction(input_data):
    prediction = calories_model.predict([input_data])
    return prediction[0]

def heart_beat_prediction(input_data):
    prediction = heart_beat_model.predict(input_data)
    return prediction