import React, { useEffect, useState } from "react";
import axios from "axios";
import "./Slider.css";
import { useNavigate } from "react-router-dom";

const SliderWotkout = () => {
  const [workouts, setWorkouts] = useState([]);
  const [slideWidth, setSlideWidth] = useState(520); // width of each slide in pixels

  useEffect(() => {
    const FavouritesWorkout = async () => {
      try {
        const response = await axios.get(
          "https://fitsync.onrender.com/api/workout",
          {
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${sessionStorage
                .getItem("authToken")
                .trim()}`,
            },
          }
        );
        const responseData = response.data;
        const parsedData = responseData.data.Data.map((item) => {
          const parts = item.split("*");
          const dataObject = parts.reduce((acc, part) => {
            const [key, value] = part.split(":").map((str) => str.trim());
            acc[key] = value;
            return acc;
          }, {});
          return dataObject;
        });

        setWorkouts(parsedData); // Save parsed data to state
      } catch (error) {
        console.error("Error fetching workout data:", error);
      }
    };

    FavouritesWorkout();

    const updateSlideWidth = () => {
      if (window.innerWidth <= 768) {
        setSlideWidth(330);
      } else {
        setSlideWidth(520);
      }
    };

    // Initial check
    updateSlideWidth();

    // Add event listener for window resize
    window.addEventListener("resize", updateSlideWidth);

    // Clean up event listener on component unmount
    return () => {
      window.removeEventListener("resize", updateSlideWidth);
    };
  }, []);

  const totalSlides = workouts.length;
  const [currentIndex, setCurrentIndex] = useState(0);

  const nextSlide = () => {
    setCurrentIndex((prevIndex) => {
      const newIndex = prevIndex - slideWidth;
      return newIndex <= -slideWidth * totalSlides ? 0 : newIndex;
    });
  };

  const prevSlide = () => {
    setCurrentIndex((prevIndex) => {
      const newIndex = prevIndex + slideWidth;
      return newIndex > 0 ? -slideWidth * (totalSlides - 1) : newIndex;
    });
  };
  const link = useNavigate();
  const toExerciseAll = (n) => {
    window.sessionStorage.setItem("ExercisePlan", n["Exercise Plan"]);
    window.sessionStorage.setItem("Category", n["Category"]);
    window.sessionStorage.setItem("ImpactLevel", n["Impact Level"]);
    window.sessionStorage.setItem(
      "TotalPlanDuration",
      n["Total Plan Duration (minutes)"]
    );
    window.sessionStorage.setItem(
      "CaloriesBurned",
      n["Calories Burned (Plan)"]
    );
    window.sessionStorage.setItem(
      "TargetMuscleGroup",
      n["Target Muscle Group"]
    );
    link("/Exercise");
  };

  return (
    <div>
      <div className="slider-container">
        <div
          className="slider-wrapper"
          style={{ transform: `translateX(${currentIndex}px)` }}
        >
          {workouts.map((plan, index) => (
            <div
              key={index}
              className="card slider-slide position-relative"
              onClick={() => {
                toExerciseAll(plan);
              }}
            >
              <img
                src={"./images/workouts/" + plan.Category + ".jpg"} // Modify to use appropriate image based on plan
                className="card-img-top"
                alt={plan.Category}
              />
              <div className="card-body">
                <h4 className="card-title">{plan.Category}</h4>
                <p className="card-text">Level: {plan["Impact Level"]}</p>
                <div>
                  {plan["Total Plan Duration (minutes)"]} min
                  <span>{plan["Calories Burned (Plan)"]} Calories</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
      <div className="slider-controls d-flex justify-content-between align-items-center">
        <button className="slider-button prev" onClick={prevSlide}>
          <i className="fa-solid fa-circle-chevron-left"></i>
        </button>
        <button className="slider-button next" onClick={nextSlide}>
          <i className="fa-solid fa-circle-chevron-right"></i>
        </button>
      </div>
    </div>
  );
};

export default SliderWotkout;
