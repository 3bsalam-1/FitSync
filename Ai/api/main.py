import random
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from model.model import food_prediction, calories_prediction, heart_beat_prediction, workout_prediction, __version__ as model_version
import pandas as pd
import datetime

random_state = 48
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def home():
    return {"health_check": "OK", "model_version": model_version}


@app.get('/workout')
def workout(Gender: int,
    Knee_pain: int,
    Back_pain: int,
    Diabeties: int,
    Heart_Disease: int,
    Hypertension: int):
    global random_state

    input_list = [0, Gender, Knee_pain, Back_pain, Diabeties, Heart_Disease, Hypertension]
    prediction = workout_prediction(input_list)
    df = pd.read_csv('Clusterd_Workout_Data.csv')
    df = df[df['Cluster'] == prediction]
    df = df.rename(columns={"ExerciseType": "Category", "Difficulty": "Impact Level"})

    current_time = datetime.datetime.now().time()
    if current_time.hour == 0 and current_time.minute <= 1 :  # 12:00 AM to 1:00 AM
        random_state = random.randint(1, 100)  # generate a random integer between 1 and 100

    random_records = df[['Exercise Plan','Category','Impact Level','Total Plan Duration (minutes)','Calories Burned (Plan)','Target Muscle Group']].sample(n=3, random_state=random_state)
    return [{k: str(v).strip() for k, v in record.items()} for record in random_records.to_dict(orient='records')]

@app.get('/challenges')
def challenges(Gender: int,
    Knee_pain: int,
    Back_pain: int,
    Diabeties: int,
    Heart_Disease: int,
    Hypertension: int):
    global random_state
    
    input_list = [0, Gender, Knee_pain, Back_pain, Diabeties, Heart_Disease, Hypertension]
    prediction = workout_prediction(input_list)
    df = pd.read_csv('Clusterd_Workout_Data.csv')
    df = df[df['Cluster'] == prediction]
    df = df.rename(columns={"ExerciseType": "Category", "Difficulty": "Impact Level"})
    
    current_time = datetime.datetime.now().time()
    if current_time.hour == 0 and current_time.minute <= 1 :  # 12:00 AM to 1:00 AM
        random_state = random.randint(1, 100)  # generate a random integer between 1 and 100

    random_records = df[['Exercise Plan','Category','Impact Level','Total Plan Duration (minutes)','Calories Burned (Plan)','Target Muscle Group']].sample(n=7, random_state=random_state+1)
    # Convert DataFrame to list of dictionaries
    return [{k: str(v).strip() for k, v in record.items()} for record in random_records.to_dict(orient='records')]

@app.get('/all_recommended_workouts')
def all_recommended_workouts(Gender: int,
    Knee_pain: int,
    Back_pain: int,
    Diabeties: int,
    Heart_Disease: int,
    Hypertension: int):
    input_list = [0, Gender, Knee_pain, Back_pain, Diabeties, Heart_Disease, Hypertension]
    prediction = workout_prediction(input_list)
    df = pd.read_csv('Clusterd_Workout_Data.csv')
    df = df[df['Cluster'] == prediction]
    df = df.rename(columns={"ExerciseType": "Category", "Difficulty": "Impact Level"})
    # Randomly select 3 records from the DataFrame
    random_records = df[['Exercise Plan','Category','Impact Level','Total Plan Duration (minutes)','Calories Burned (Plan)','Target Muscle Group']]
    # Convert DataFrame to list of dictionaries
    return [{k: str(v).strip() for k, v in record.items()} for record in random_records.to_dict(orient='records')]


@app.get('/all_workouts')
def all_workouts():
    
    df = pd.read_csv('Clusterd_Workout_Data.csv')
    df = df.rename(columns={"ExerciseType": "Category", "Difficulty": "Impact Level"})
    # Randomly select 3 records from the DataFrame
    random_records = df[['Exercise Plan','Category','Impact Level','Total Plan Duration (minutes)','Calories Burned (Plan)','Target Muscle Group']]
    # Convert DataFrame to list of dictionaries
    return [{k: str(v).strip() for k, v in record.items()} for record in random_records.to_dict(orient='records')]

@app.get('/Ingredients')
def Ingredients(Ingredient:str):
    
    df = pd.read_csv('Calories.csv')
    df = df.drop(columns=['Unnamed: 0'])
    df = df.drop_duplicates()
    
    n = df["Ingredient"].isin([Ingredient.title()])
    random_records = df[n]
    # Convert DataFrame to list of dictionaries
    return [{k: str(v).strip() for k, v in record.items()} for record in random_records.to_dict(orient='records')]

@app.get('/food')
def food(Diabeties: int,
    Heart_Disease: int,
    Hypertension: int):
    global random_state
    input_list = [0, Diabeties, Heart_Disease, Hypertension]
    prediction = food_prediction(input_list)
    df = pd.read_csv('Clusterd_Food_Data.csv')
    df = df[df['Cluster'] == prediction].drop(columns=["Unnamed: 0", "id", "Cluster"])
    
    current_time = datetime.datetime.now().time()
    if current_time.hour == 0 and current_time.minute <= 1 :  # 12:00 AM to 1:00 AM
        random_state = random.randint(1, 100)  # generate a random integer between 1 and 100

    random_records = df.sample(n=3, random_state=random_state)
    # Convert DataFrame to list of dictionaries
    return [{k: str(v).strip() for k, v in record.items()} for record in random_records.to_dict(orient='records')]

@app.get('/food_all')
def food(Diabeties: int,
    Heart_Disease: int,
    Hypertension: int):
    input_list = [0, Diabeties, Heart_Disease, Hypertension]
    prediction = food_prediction(input_list)
    df = pd.read_csv('Clusterd_Food_Data.csv')
    df = df[df['Cluster'] == prediction].drop(columns=["Unnamed: 0", "id", "Cluster"])
    
    random_records = df
    # Convert DataFrame to list of dictionaries
    return [{k: str(v).strip() for k, v in record.items()} for record in random_records.to_dict(orient='records')]

@app.get('/calories')
def calories(Age: int,
    Gender: int,
    Weight: int,
    Height: int,
    Activity_Level: int,
    Systolic_BP: int,
    Diastolic_BP: int,
    Cholesterol_Level:int,
    Blood_Sugar: int,
    Hypertension: int,
    Low_Pressure: int,
    Diabetes: int,
    Heart_Condition: int,
    BMR: int):

    input_list = [Age,Gender,Weight,Height,Activity_Level,Systolic_BP,Diastolic_BP,Cholesterol_Level,Blood_Sugar,Hypertension,Low_Pressure,Diabetes,Heart_Condition,BMR]
    prediction = calories_prediction(input_list)
    return {"Total Daily Calories": prediction.round()}

@app.get('/pulse')
def pulse(Age: int, 
        Activity_level: int,
        Active: bool):

    input_data = pd.DataFrame({'Age': [Age], 'Intenisty level': [Activity_level], 'Active': [Active]})
    pred = heart_beat_prediction(input_data)
    prediction = pred[0].split("-")
    return {"Min": prediction[0], "Max": prediction[1]}
