import React, { useCallback, useEffect, useReducer, useState } from "react";
import "../Home.css";
import "./Diet.css";
// import Datafood from "./food.json";
// import DataAll from "./foodall.json";
import HeaderProfile from "../../components/HeaderProfile";
import Footer from "../../components/Footer";
import ErrorMessage from "../../components/ErrorMessage";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Diet = () => {
  // Error Message #############################################################
  const reducer = (prev, next) => ({ ...prev, ...next });
  const [{ error, message }, setErrorMessage] = useReducer(reducer, {
    error: false,
    message: "",
  });
  // Data #############################################################
  const [recent, setrecent] = useState([]);
  const [DataAll, setDataAll] = useState([]);
  // Read Data
  const getApiUrl = (endpoint) => {
    const diabetes = sessionStorage.getItem("diabetes");
    const heartCondition = sessionStorage.getItem("heartCondition");
    const hypertension = sessionStorage.getItem("hypertension");

    return `https://fitsync-ai-api.onrender.com/${endpoint}?Diabeties=${diabetes}&Heart_Disease=${heartCondition}&Hypertension=${hypertension}`;
  };
  const fetchData = useCallback(async () => {
    try {
      const [recentResponse, DataAllResponse] = await Promise.all([
        axios.get(getApiUrl("food")),
        axios.get(getApiUrl("food_all")),
      ]);
      setrecent(recentResponse.data);
      setDataAll(DataAllResponse.data);
    } catch (error) {
      setErrorMessage({
        error: true,
        message: "An error occurred while fetching data",
      });
    }
  }, []); // empty array means this function is memoized once

  useEffect(() => {
    fetchData();
  }, [fetchData]); // include fetchData as a dependency

  // Show Box Filter #############################################################
  function toggleFilter() {
    const boxFilter = document.getElementById("boxFilter");
    if (boxFilter) {
      boxFilter.classList.toggle("show");
    }
  }
  //Filter using my all Data #############################################################
  const [selectedCategories, setSelectedCategories] = useState([]);
  const [selectedName, setSelectedName] = useState([]);
  const categories = [...new Set(DataAll.map((plan) => plan.Catagory))];
  const Namefood = [...new Set(DataAll.map((plan) => plan.Name))];
  const handleCheckboxChange = (setSelected, value) => {
    setSelected((prevSelected) =>
      prevSelected.includes(value)
        ? prevSelected.filter((item) => item !== value)
        : [...prevSelected, value]
    );
  };
  const filteredPlans = DataAll.filter(
    (plan) =>
      (selectedCategories.length === 0 ||
        selectedCategories.includes(plan.Catagory)) &&
      (selectedName.length === 0 || selectedName.includes(plan.Name))
  );
  const anySelected = selectedCategories.length > 0 || selectedName.length > 0;
  //Filter search using my all Data #############################################################

  const [searchTerm, setSearchTerm] = useState("");
  const [filteredData, setFilteredData] = useState([]);
  const [isBoxVisible, setIsBoxVisible] = useState(false);

  const handleSearch = (e) => {
    const searchText = e.target.value.toLowerCase();
    setSearchTerm(searchText);
    const filteredData = DataAll.filter((plan) =>
      plan.Name.toLowerCase().includes(searchText)
    );
    setFilteredData(filteredData);
    setIsBoxVisible(searchText.trim() !== "");
  };

  // Storage Data
  const link = useNavigate();
  const toFood = (n) => {
    window.sessionStorage.setItem(
      "FoodName",
      recent[n]["Name"].replace("/", "").replace("&amp;", "&")
    );
    window.sessionStorage.setItem("FoodCatagory", recent[n]["Catagory"]);
    window.sessionStorage.setItem("FoodDescription", recent[n]["Description"]);
    window.sessionStorage.setItem("FoodVeg_non", recent[n]["Veg_non"]);
    window.sessionStorage.setItem("FoodNutrient", recent[n]["Nutrient"]);
    window.sessionStorage.setItem("FoodDiet", recent[n]["Diet"]);

    link("/OverviewDiet");
  };
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
    <div className="Home Workout Diet">
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
          <h1>Diet</h1>
          <img
            className="img-fluid"
            src="./images/DietbackgroundBody.png"
            alt="Background Body"
          />
        </div>
      </div>
      {/* End backgroundBody   ###############################################    */}

      {/* Start Filters   ###############################################    */}
      <div className="Filters container p-0 mt-5 mb-5 ">
        <div className="flex-wrap d-flex align-items-center position-relative">
          <button onClick={toggleFilter} id="filterButton">
            <img
              className="img-fluid"
              src="./images/Filters.png"
              alt="Filters"
            />
            <span className="ms-2 me-2">Filters</span>
            <i className="fa-solid fa-caret-down"></i>
          </button>
          <div className="form-group has-search position-relative">
            <i className="fa-solid fa-magnifying-glass"></i>
            <input
              type="text"
              className="form-control"
              placeholder="Search using Name Diet"
              value={searchTerm}
              onChange={handleSearch}
            />
          </div>
        </div>
        {/* Drowp menu */}
        <div className="box-filter" id="boxFilter">
          <div className="checkbox-group  d-flex flex-wrap justify-content-evenly">
            <div className="column">
              <h3>Catagory</h3>
              {categories.map((Catagory) => (
                <label key={Catagory} className="checkbox-label">
                  <input
                    type="checkbox"
                    value={Catagory}
                    onChange={() =>
                      handleCheckboxChange(setSelectedCategories, Catagory)
                    }
                  />
                  <span className="custom-checkbox"></span>
                  {Catagory}
                </label>
              ))}
            </div>
            <div className="column">
              <h3>Name Diet</h3>
              {Namefood.map((level) => (
                <label key={level} className="checkbox-label">
                  <input
                    type="checkbox"
                    value={level}
                    onChange={() =>
                      handleCheckboxChange(setSelectedName, level)
                    }
                  />
                  <span className="custom-checkbox"></span>
                  {level}
                </label>
              ))}
            </div>
          </div>
        </div>
      </div>
      {/* End Filters   ###############################################    */}
      {/* Filter search */}
      <div className="box" style={{ display: isBoxVisible ? "block" : "none" }}>
        <div className="exercise-plans Recent Diet-Plan text-center mt-5 mb-5">
          <h2>Recommended{"  "}Diet</h2>
          <div className="container text-start">
            <div className="row row-cols-3 gap-3 justify-content-evenly">
              {filteredData.map((plan, index) => (
                <div
                  key={index}
                  className="col card"
                  onClick={() => {
                    toFoodAll(plan);
                  }}
                >
                  <img
                    src={`./images/diet/${
                      plan
                        ? plan.Name.replace("/", "").replace("&amp;", "&")
                        : ""
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
                        Catagory: <span>{plan.Catagory}</span>
                      </h5>
                      <h5>
                        Nutrient:
                        <span> {plan.Nutrient}</span>
                      </h5>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
      {/* Filter checkbox */}
      {anySelected && (
        <div className="exercise-plans Recent Diet-Plan text-center mt-5 mb-5">
          <h2>All Plans</h2>
          <div className="container text-start">
            <div className="row row-cols-3 gap-3 justify-content-evenly">
              {filteredPlans.map((plan, index) => (
                <div
                  key={index}
                  className="col card"
                  onClick={() => {
                    toFoodAll(plan);
                  }}
                >
                  <img
                    src={`./images/diet/${
                      plan
                        ? plan.Name.replace("/", "").replace("&amp;", "&")
                        : ""
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
        </div>
      )}

      {anySelected || isBoxVisible ? null : (
        <>
          {/* start Recent Diet Plan   ###############################################    */}
          <div className="Recent Diet-Plan text-center mt-5 mb-5">
            <h2>Diet Plan</h2>
            <div className="container text-start">
              <div className="row row-cols-3 gap-3 justify-content-evenly">
                <div
                  className="col card"
                  onClick={() => {
                    toFood(0);
                  }}
                >
                  <img
                    src={`./images/diet/${
                      recent[0]
                        ? recent[0].Name.replace("/", "").replace("&amp;", "&")
                        : ""
                    }.jpg`}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {recent.length > 0
                        ? recent[0].Name.replace("/", "").replace("&amp;", "&")
                        : "------"}
                    </h4>
                    <p className="card-text">
                      {recent.length > 0
                        ? recent[0].Veg_non
                          ? "Vigetarian"
                          : " Not Vigetarian"
                        : "------"}
                    </p>
                    <div className="Diet-card-text  d-flex flex-row justify-content-between">
                      <h5>
                        Catagory:{" "}
                        <span>
                          {recent.length > 0 ? recent[0].Catagory : "------"}
                        </span>
                      </h5>
                      <h5>
                        Nutrient:{" "}
                        <span>
                          {recent.length > 0 ? recent[0].Nutrient : "------"}
                        </span>
                      </h5>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toFood(1);
                  }}
                >
                  <img
                    src={`./images/diet/${
                      recent[1]
                        ? recent[1].Name.replace("/", "").replace("&amp;", "&")
                        : ""
                    }.jpg`}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {recent.length > 0
                        ? recent[1].Name.replace("/", "").replace("&amp;", "&")
                        : "------"}
                    </h4>
                    <p className="card-text">
                      {recent.length > 0
                        ? recent[1].Veg_non
                          ? "Vigetarian"
                          : " Not Vigetarian"
                        : "------"}
                    </p>
                    <div className="Diet-card-text  d-flex flex-row justify-content-between">
                      <h5>
                        Catagory:{" "}
                        <span>
                          {recent.length > 0 ? recent[1].Catagory : "------"}
                        </span>
                      </h5>
                      <h5>
                        Nutrient:{" "}
                        <span>
                          {recent.length > 0 ? recent[1].Nutrient : "------"}
                        </span>
                      </h5>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toFood(2);
                  }}
                >
                  <img
                    src={`./images/diet/${
                      recent[2]
                        ? recent[2].Name.replace("/", "").replace("&amp;", "&")
                        : ""
                    }.jpg`}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {recent.length > 0
                        ? recent[2].Name.replace("/", "").replace("&amp;", "&")
                        : "------"}
                    </h4>
                    <p className="card-text">
                      {recent.length > 0
                        ? recent[2].Veg_non
                          ? "Vigetarian"
                          : " Not Vigetarian"
                        : "------"}
                    </p>
                    <div className="Diet-card-text  d-flex flex-row justify-content-between">
                      <h5>
                        Catagory:{" "}
                        <span>
                          {recent.length > 0 ? recent[2].Catagory : "------"}
                        </span>
                      </h5>
                      <h5>
                        Nutrient:{" "}
                        <span>
                          {recent.length > 0 ? recent[2].Nutrient : "------"}
                        </span>
                      </h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* End Recent Diet Plan   ###############################################    */}
          {/* start Popular Meals Diet Plan   ###############################################    */}
          <div className="Recent Diet-Plan text-center mt-5 mb-5">
            <h2>Popular Meals</h2>
            <div className="container text-start">
              <div className="row row-cols-3 gap-3 justify-content-evenly">
                {DataAll.map((plan, index) => (
                  <div
                    key={index}
                    className="col card"
                    onClick={() => {
                      toFoodAll(plan);
                    }}
                  >
                    <img
                      src={`./images/diet/${
                        plan
                          ? plan.Name.replace("/", "").replace("&amp;", "&")
                          : ""
                      }.jpg`}
                      className="card-img-top"
                      alt="..."
                    />
                    <div className="card-body">
                      <h4 className="card-title">
                        {plan.Name
                          ? plan.Name.replace("/", "").replace("&amp;", "&")
                          : "------"}
                      </h4>
                      <p className="card-text">
                        {plan.Veg_non !== undefined
                          ? plan.Veg_non
                            ? "Vegetarian"
                            : "Not Vegetarian"
                          : "------"}
                      </p>
                      <div className="Diet-card-text d-flex flex-row justify-content-between">
                        <h5>
                          Category:{" "}
                          <span>
                            {plan.Catagory ? plan.Catagory : "------"}
                          </span>
                        </h5>
                        <h5>
                          Nutrient:{" "}
                          <span>
                            {plan.Nutrient ? plan.Nutrient : "------"}
                          </span>
                        </h5>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
          {/* End Popular Meals Diet Plan   ###############################################    */}
        </>
      )}
      {/* Start Footer   ###############################################    */}
      <Footer />
      {/* End Footer   ###############################################    */}
    </div>
  );
};
export default Diet;
