import React, { useEffect, useMemo, useReducer, useState } from "react";
import "../Home.css";
import "./Diet.css";
import "./OverviewDiet.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHeart as solidHeart } from "@fortawesome/free-solid-svg-icons";
import { faHeart as regularHeart } from "@fortawesome/free-regular-svg-icons";
import Footer from "../../components/Footer";
import HeaderProfile from "../../components/HeaderProfile";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { toast } from "react-toastify";
import ErrorMessage from "../../components/ErrorMessage";
import Swal from "sweetalert2";

const OverviewDiet = () => {
  const [like, setLike] = useState(false);
  const link = useNavigate();

  // Error Message #############################################################
  const reducer = (prev, next) => ({ ...prev, ...next });
  const [{ error, message }, setErrorMessage] = useReducer(reducer, {
    error: false,
    message: "",
  });

  //  Read Data #############################################################
  const FoodDescription = useMemo(
    () => sessionStorage.getItem("FoodDescription").split(","),
    []
  );
  const [gmfood, setGmfood] = useState([]);
  const [weights, setWeights] = useState([]);
  const [calories, setCalories] = useState([]);
  useEffect(() => {
    const sendDescriptions = async () => {
      try {
        const foodData = [];
        const initialWeights = FoodDescription.map(() => 10);

        for (let description of FoodDescription) {
          const items = description.split(",");
          for (let item of items) {
            const response = await axios.get(
              `https://fitsync-ai-api.onrender.com/Ingredients?Ingredient=${item.trim()}`
            );

            if (response.data && response.data.length > 0) {
              const caloriesValue = response.data[0]["Calories per 100 grams"];
              foodData.push(caloriesValue);
            } else {
              foodData.push("No data available");
            }
          }
        }
        setGmfood(foodData);
        setWeights(initialWeights);
        setCalories(
          foodData.map((cal, index) =>
            cal !== "No data available"
              ? (cal * initialWeights[index]) / 100
              : 0
          )
        );
      } catch (error) {
        console.error("Error sending descriptions:", error);
      }
    };

    sendDescriptions();
  }, [FoodDescription]);
  const handleIncrease = (index) => {
    const newWeights = [...weights];
    newWeights[index] += 10;
    setWeights(newWeights);
    updateCalories(newWeights);
  };
  const handleDecrease = (index) => {
    const newWeights = [...weights];
    if (newWeights[index] > 10) {
      newWeights[index] -= 10;
      setWeights(newWeights);
      updateCalories(newWeights);
    }
  };
  const updateCalories = (weights) => {
    const updatedCalories = weights.map((weight, index) =>
      gmfood[index] !== "No data available" ? (gmfood[index] * weight) / 100 : 0
    );
    setCalories(updatedCalories);
  };

  // Complete Workout  ############################################################
  const CompleteWorkout = () => {
    Swal.fire({
      title: "Congratulations!",
      text: "You added the food to today's food",
      imageUrl: "./images/Congratulations.png",
      imageWidth: 400,
      imageHeight: 200,
      imageAlt: "Custom image",
      confirmButtonText: "Go back home",
      customClass: {
        container: "custom-swal-modal",
        title: "custom-swal-title",
        htmlContainer: "custom-swal-text",
      },
    }).then((result) => {
      if (result.isConfirmed) {
        link("/Home");
      }
    });
  };

  //  Add food to data and Add favorite #############################################################
  const addfood = async () => {
    try {
      const Calories = calories.reduce((a, b) => a + b, 0);
      const response = await fetch(
        "https://fitsync.onrender.com/api/vitalsignal/inTake",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${sessionStorage
              .getItem("authToken")
              .trim()}`,
          },
          body: JSON.stringify({
            inTake: Calories,
          }),
        }
      );

      if (!response.ok) {
        const responseData = await response.json();
        console.log("responseData", responseData);
        return;
      }

      const data = await response.json();
      console.log("data", data);
      toast.success("Registered successfully");
    } catch (err) {
      console.error("Error:", err);
    }
  };

  const DietString = `Name: ${sessionStorage.getItem(
    "FoodName"
  )}*Catagory: ${sessionStorage.getItem(
    "FoodCatagory"
  )}*Description: ${sessionStorage.getItem(
    "FoodDescription"
  )}*Veg_non:${sessionStorage.getItem(
    "FoodVeg_non"
  )}*Nutrient: ${sessionStorage.getItem(
    "FoodNutrient"
  )}*Diet: ${sessionStorage.getItem("FoodDiet")} `;

  const addfavorite = async (e) => {
    console.log("DietString: ", DietString);
    e.preventDefault();
    try {
      const response = await fetch(
        "https://fitsync.onrender.com/api/fav-meal",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${sessionStorage
              .getItem("authToken")
              .trim()}`,
          },
          body: JSON.stringify({
            favMeal: DietString,
          }),
        }
      );

      if (!response.ok) {
        const responseData = await response.json();
        console.log("responseData", responseData);
        return;
      }
      if (!like) {
        Swal.fire({
          title: "Added to favorites",
          icon: "success",
        });
      } else {
        Swal.fire({
          title: "Deleted from favorites",
          icon: "success",
        });
      }
      const data = await response.json();
      console.log("data", data);
      toast.success("Registered successfully");
    } catch (err) {
      console.error("Error:", err);
    }
  };

  return (
    <div className="Home Workout OverviewDiet">
      {error ? (
        <ErrorMessage
          message={message}
          ClosedError={(e) => setErrorMessage({ error: e, message: "" })}
        />
      ) : null}
      {/* Start Header   ###############################################    */}
      <HeaderProfile Diet="active" />
      {/* End Header   ###############################################    */}
      {/* Start backgroundBody   ###############################################    */}
      <div className="backgroundWorkout container position-relative p-0">
        <div className="bg-image">
          <h1>{sessionStorage.getItem("FoodName")}</h1>
          <img
            className="img-fluid"
            src="./images/DietbackgroundBody.png"
            alt="Background Body"
          />
        </div>
      </div>
      {/* End backgroundBody   ###############################################    */}
      {/* start Exercise   ###############################################    */}
      <div className="Exercise container mt-5 mb-5">
        <div className="def-exercise position-relative">
          <div className="Content">
            <h2>Meal Overview</h2>
            <div className="d-flex align-items-center justify-content-between">
              <button>99% Healthy</button>
              <button>{FoodDescription.length} items</button>
            </div>
          </div>
          <button
            onClick={() => {
              link("/Diet");
            }}
          >
            Explore Excercises <i className="fa-solid fa-arrow-right ms-2"></i>
          </button>
        </div>
        <div className="plan row flex-wrap mt-3 mb-5 gap-2">
          <div className="col">
            <div className="card">
              <img
                src={`./images/diet/${sessionStorage
                  .getItem("FoodName")
                  .replace("/", "")
                  .replace("&amp;", "&")}.jpg`}
                alt="Diet"
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              />
              <div className="card-body">
                <div className="d-flex align-items-center justify-content-between ">
                  <div className="d-flex flex-column align-items-start  ">
                    <p className="card-text m-0 me-3">
                      Size :{" "}
                      <span className="text-black">
                        {" "}
                        {weights.reduce((a, b) => a + b, 0).toFixed(2)}
                      </span>{" "}
                      gm
                    </p>
                    <p className="card-text m-0 me-3">
                      Calories :{" "}
                      <span className="text-black">
                        {" "}
                        {calories.reduce((a, b) => a + b, 0).toFixed(2)}
                      </span>
                    </p>
                    <p className="card-text m-0 me-3">
                      Nutrient :{" "}
                      <span className="text-black">
                        {" "}
                        {sessionStorage.getItem("FoodNutrient")}
                      </span>
                    </p>
                    <p className="card-text m-0 me-3">
                      Diet:{" "}
                      <span className="text-black">
                        {" "}
                        {sessionStorage
                          .getItem("FoodDiet")
                          .replaceAll("_", " ")}
                      </span>
                    </p>
                  </div>
                  <button
                    onClick={(e) => {
                      setLike(!like);
                      addfavorite(e);
                    }}
                  >
                    {like ? (
                      <FontAwesomeIcon icon={solidHeart} />
                    ) : (
                      <FontAwesomeIcon icon={regularHeart} />
                    )}
                  </button>
                </div>
                <h5 className="card-title text-capitalize">
                  {sessionStorage.getItem("FoodName")}
                </h5>
                <button
                  className="btn-primary"
                  onClick={() => {
                    addfood();
                    CompleteWorkout();
                  }}
                >
                  Add Meal
                </button>
              </div>
            </div>
          </div>

          <div
            className="col special-exercises p-3"
            style={{ minWidth: "356px" }}
          >
            {FoodDescription.map((description, index) => (
              <div
                key={index}
                className="exercises-box d-flex align-items-center mb-2 p-3 position-relative"
              >
                <div className="text-box flex-grow-1 position-relative  d-flex align-items-center justify-content-between">
                  <div>
                    <p className="fw-bold">{description.trim()}</p>
                    <span className="text-black-50">
                      {weights[index]} gm ={" "}
                      {gmfood[index] !== "No data available"
                        ? (gmfood[index] * weights[index]) / 100
                        : "No data available"}{" "}
                      Calories
                    </span>
                  </div>
                  <div className="d-flex">
                    <button onClick={() => handleDecrease(index)}>-</button>
                    <button onClick={() => handleIncrease(index)}>+</button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
      {/* End Worouts   ###############################################    */}
      {/* Start Footer   ###############################################    */}
      <Footer />
      {/* End Footer   ###############################################    */}
    </div>
  );
};
export default OverviewDiet;
