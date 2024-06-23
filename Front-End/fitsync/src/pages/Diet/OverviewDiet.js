import React, { useState } from "react";
import "../Home.css";
import "./Diet.css";
import "./OverviewDiet.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHeart as solidHeart } from "@fortawesome/free-solid-svg-icons";
import { faHeart as regularHeart } from "@fortawesome/free-regular-svg-icons";
import Footer from "../../components/Footer";
import HeaderProfile from "../../components/HeaderProfile";
import { useNavigate } from "react-router-dom";

const OverviewDiet = () => {
  const [like, setLike] = useState(false);
  const link = useNavigate();

  const FoodDescription = sessionStorage.getItem("FoodDescription").split(",");

  return (
    <div className="Home Workout">
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
        <div className="plan row flex-wrap mt-3 mb-5">
          <div className="col">
            <div className="card">
              <img
                src={`./images/Diet.png`}
                alt="Diet"
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              />
              <div className="card-body">
                <div className="d-flex align-items-center justify-content-between ">
                  <div className="d-flex flex-column align-items-start  ">
                    <p className="card-text m-0 me-3">
                      Size : <span className="text-black"> 300</span>
                    </p>
                    <p className="card-text m-0 me-3">
                      Calories : <span className="text-black"> 61</span>
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
                        {sessionStorage.getItem("FoodDiet")}
                      </span>
                    </p>
                  </div>
                  <button
                    onClick={(e) => {
                      setLike(!like);
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
                <button className="btn-primary">Add Meal</button>
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
                className="exercises-box d-flex align-items-center mb-2 position-relative"
              >
                <img
                  src={`./images/Dite.png`}
                  alt="Dite"
                  className="p-0 me-2"
                  style={{ width: "80px", height: "80px" }}
                />
                <div className="text-box flex-grow-1 position-relative">
                  <p className="fw-bold">{description.trim()}</p>
                  <span className="text-black-50">"100gr" </span>
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
