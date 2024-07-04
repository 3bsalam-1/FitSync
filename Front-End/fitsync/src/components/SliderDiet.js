import React, { useEffect, useState } from "react";
import axios from "axios";
import "./Slider.css";
import { useNavigate } from "react-router-dom";

const SliderWotkout = () => {
  const [Diet, setDiet] = useState([]);
  const [slideWidth, setSlideWidth] = useState(520); // width of each slide in pixels

  useEffect(() => {
    const FavouritesWorkout = async () => {
      try {
        const response = await axios.get(
          "https://fitsync.onrender.com/api/fav-meal",
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

        setDiet(parsedData); // Save parsed data to state
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

  const totalSlides = Diet.length;
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
  const toFoodAll = (n) => {
    window.sessionStorage.setItem(
      "FoodName",
      n["Name"].replace("/", "").replace("&amp;", "&")
    );
    window.sessionStorage.setItem("FoodCatagory", n["Catagory"]);
    window.sessionStorage.setItem("FoodDescription", n["Description"]);
    window.sessionStorage.setItem("FoodVeg_non", n["Veg_non"]);
    window.sessionStorage.setItem("FoodNutrient", n["Nutrient"]);
    window.sessionStorage.setItem("FoodDiet", n["Diet"]);

    link("/OverviewDiet");
  };

  return (
    <div>
      <div className="slider-container">
        <div
          className="slider-wrapper"
          style={{ transform: `translateX(${currentIndex}px)` }}
        >
          {Diet.map((plan, index) => (
            <div
              key={index}
              className="card slider-slide position-relative"
              onClick={() => {
                toFoodAll(plan);
              }}
            >
              <img
                src={`./images/diet/${
                  plan ? plan.Name.replace("/", "").replace("&amp;", "&") : ""
                }.jpg`} // Modify to use appropriate image based on plan
                className="card-img-top"
                alt="..."
              />
              <div className="card-body">
                <h4 className="card-title">
                  {plan.Name.replace("/", "").replace("&amp;", "&")}
                </h4>
                <p className="card-text">
                  {plan.Veg_non ? "Vigetarian" : " Not Vigetarian"}
                </p>
                <div className="Diet-card-text  d-flex flex-row justify-content-between">
                  <h5>
                    Catagory: <span> {plan.Catagory}</span>
                  </h5>
                  <h5>
                    Nutrient: <span> {plan.Nutrient}</span>
                  </h5>
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
