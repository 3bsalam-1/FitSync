import React, { useReducer, useState, useContext, useEffect } from "react";
import "./Survey.css";
import { useNavigate } from "react-router-dom";
import { Global } from "../../context/Global";
import Gender from "./Gender.js";
import Weight from "./Weight.js";
import Height from "./Height.js";
import Birth from "./Birth.js";
import Experience from "./Experience.js";
import ActivityLevel from "./ActivityLevel.js";
import Back from "./Back.js";
import NoteBack from "../notes/NoteBack.js";
import Knee from "./Knee.js";
import NoteKnee from "../notes/NoteKnee.js";
import Diabetes from "./Diabetes.js";
import SugarLevel from "./SugarLevel.js";
import NoteDiabetes from "../notes/NoteDiabetes.js";
import HeartDisease from "./HeartDisease.js";
import DiastolicBlood from "./DiastolicBlood.js";
import SystolicBlood from "./SystolicBlood.js";
import NoteHeartDisease from "../notes/NoteHeartDisease.js";
import Hypertension from "./Hypertension.js";
import LowPressure from "./LowPressure.js";
import Cholesterol from "./Cholesterol.js";
import NoteHypertension from "../notes/NoteHypertension.js";
import Sleep from "./Sleep.js";
import Water from "./Water.js";
import Vegetarian from "./Vegetarian.js";
import BMR from "./BMR.js";
import NoteFinished from "../notes/NoteFinished.js";

const Survey = () => {
  const link = useNavigate();
  const { setUser } = useContext(Global);
  const [currentPage, setCurrentPage] = useState(1);

  const reduce = (prev, next) => ({ ...prev, ...next });
  const [answers, setAnswers] = useReducer(reduce, {});

  const Continue = () => {
    setCurrentPage(currentPage + 1);
  };
  const handleNext = (e, name) => {
    setAnswers({ [name]: e });
    setCurrentPage(currentPage + 1);
  };
  const handlePrevious = () => {
    setCurrentPage(currentPage - 1);
  };
  useEffect(() => {
    setUser(answers);
  }, [answers, setUser]);

  const handleSubmit = () => {
    link("/Home");
  };

  return (
    <div className="Survey">
      <nav className="sticky-top container">
        <div className="logo d-flex align-items-center">
          <img src="./images/logo.png" alt="logo"></img>
          <p>
            Fit<span>s</span>ync
          </p>
        </div>
      </nav>
      <div className="box-card text-center">
        {currentPage === 1 ? (
          <Gender onNext={(gender) => handleNext(gender, "Gender")} />
        ) : currentPage === 2 ? (
          <Birth
            onPrevious={handlePrevious}
            onNext={(gender) => handleNext(gender, "Birth")}
          />
        ) : currentPage === 3 ? (
          <Weight
            onPrevious={handlePrevious}
            onNext={(weight) => handleNext(weight, "Weight")}
          />
        ) : currentPage === 4 ? (
          <Height
            onPrevious={handlePrevious}
            onNext={(height) => handleNext(height, "Height")}
          />
        ) : currentPage === 5 ? (
          <Experience
            onPrevious={handlePrevious}
            onNext={(Experience) => handleNext(Experience, "Experience")}
          />
        ) : currentPage === 6 ? (
          <ActivityLevel
            onPrevious={handlePrevious}
            onNext={(ActivityLevel) =>
              handleNext(ActivityLevel, "ActivityLevel")
            }
          />
        ) : currentPage === 7 ? (
          <Back
            onPrevious={handlePrevious}
            onNext={(Back) => handleNext(Back, "Back")}
          />
        ) : currentPage === 8 ? (
          <NoteBack onPrevious={handlePrevious} onNext={() => Continue()} />
        ) : currentPage === 9 ? (
          <Knee
            onPrevious={handlePrevious}
            onNext={(Knee) => handleNext(Knee, "Knee")}
          />
        ) : currentPage === 10 ? (
          <NoteKnee onPrevious={handlePrevious} onNext={() => Continue()} />
        ) : currentPage === 11 ? (
          <Diabetes
            onPrevious={handlePrevious}
            onNext={(Diabetes) => handleNext(Diabetes, "Diabetes")}
          />
        ) : currentPage === 12 ? (
          <SugarLevel
            onPrevious={handlePrevious}
            onNext={(SugarLevel) => handleNext(SugarLevel, "SugarLevel")}
          />
        ) : currentPage === 13 ? (
          <NoteDiabetes onPrevious={handlePrevious} onNext={() => Continue()} />
        ) : currentPage === 14 ? (
          <HeartDisease
            onPrevious={handlePrevious}
            onNext={(HeartDisease) => handleNext(HeartDisease, "HeartDisease")}
          />
        ) : currentPage === 15 ? (
          <SystolicBlood
            onPrevious={handlePrevious}
            onNext={(SystolicBlood) =>
              handleNext(SystolicBlood, "SystolicBlood")
            }
          />
        ) : currentPage === 16 ? (
          <DiastolicBlood
            onPrevious={handlePrevious}
            onNext={(DiastolicBlood) =>
              handleNext(DiastolicBlood, "DiastolicBlood")
            }
          />
        ) : currentPage === 17 ? (
          <NoteHeartDisease
            onPrevious={handlePrevious}
            onNext={() => Continue()}
          />
        ) : currentPage === 18 ? (
          <LowPressure
            onPrevious={handlePrevious}
            onNext={(LowPressure) => handleNext(LowPressure, "LowPressure")}
          />
        ) : currentPage === 19 ? (
          <Hypertension
            onPrevious={handlePrevious}
            onNext={(Hypertension) => handleNext(Hypertension, "Hypertension")}
          />
        ) : currentPage === 20 ? (
          <Cholesterol
            onPrevious={handlePrevious}
            onNext={(Cholesterol) => handleNext(Cholesterol, "Cholesterol")}
          />
        ) : currentPage === 21 ? (
          <NoteHypertension
            onPrevious={handlePrevious}
            onNext={() => Continue()}
          />
        ) : currentPage === 22 ? (
          <Sleep
            onPrevious={handlePrevious}
            onNext={(Sleep) => handleNext(Sleep, "Sleep")}
          />
        ) : currentPage === 23 ? (
          <Water
            onPrevious={handlePrevious}
            onNext={(Water) => handleNext(Water, "Water")}
          />
        ) : currentPage === 24 ? (
          <Vegetarian
            onPrevious={handlePrevious}
            onNext={(Vegetarian) => handleNext(Vegetarian, "Vegetarian")}
          />
        ) : currentPage === 25 ? (
          <BMR
            onPrevious={handlePrevious}
            onNext={(BMR) => handleNext(BMR, "BMR")}
          />
        ) : (
          <NoteFinished onPrevious={handlePrevious} onSubmit={handleSubmit} />
        )}
      </div>
    </div>
  );
};

export default Survey;
