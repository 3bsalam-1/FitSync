import React, { useEffect, useReducer, useState } from "react";
import "../Home.css";
import "./Workout.css";
import HeaderProfile from "../../components/HeaderProfile";
import Footer from "../../components/Footer";
import ErrorMessage from "../../components/ErrorMessage";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Workout = () => {
  const [recent, setrecent] = useState([]);
  const [challenges, setchallenges] = useState([]);
  const [AllData, setAllData] = useState([]);
  const [AllRecommended, setAllRecommended] = useState([]);

  const reducer = (prev, next) => ({ ...prev, ...next });
  const [{ error, message }, setErrorMessage] = useReducer(reducer, {
    error: false,
    message: "",
  });

  // Read Data
  useEffect(() => {
    const fetchData = async () => {
      try {
        const apiUrl = `https://fitsync-ai-api.onrender.com/workout?Gender=${sessionStorage.getItem(
          "gender"
        )}&Knee_pain=${sessionStorage.getItem(
          "kneePain"
        )}&Back_pain=${sessionStorage.getItem(
          "backPain"
        )}&Diabeties=${sessionStorage.getItem(
          "diabetes"
        )}&Heart_Disease=${sessionStorage.getItem(
          "heartCondition"
        )}&Hypertension=${sessionStorage.getItem("hypertension")}`;
        const response = await axios.get(apiUrl);
        setrecent(response.data);
      } catch (error) {
        console.error("Error fetching Code:", error);
      }
    };
    const fetchChallenges = async () => {
      try {
        const apiUrl = `https://fitsync-ai-api.onrender.com/challenges?Gender=${sessionStorage.getItem(
          "gender"
        )}&Knee_pain=${sessionStorage.getItem(
          "kneePain"
        )}&Back_pain=${sessionStorage.getItem(
          "backPain"
        )}&Diabeties=${sessionStorage.getItem(
          "diabetes"
        )}&Heart_Disease=${sessionStorage.getItem(
          "heartCondition"
        )}&Hypertension=${sessionStorage.getItem("hypertension")}`;
        const response = await axios.get(apiUrl);
        setchallenges(response.data);
      } catch (error) {
        console.error("Error fetching Code:", error);
      }
    };
    const fetchAllData = async () => {
      try {
        const apiUrl = "https://fitsync-ai-api.onrender.com/all_workouts";
        const response = await axios.get(apiUrl);
        setAllData(response.data);
      } catch (error) {
        console.error("Error fetching Code:", error);
      }
    };
    const fetchAllRecommended = async () => {
      try {
        const apiUrl = `https://fitsync-ai-api.onrender.com/all_recommended_workouts?${sessionStorage.getItem(
          "gender"
        )}&Knee_pain=${sessionStorage.getItem(
          "kneePain"
        )}&Back_pain=${sessionStorage.getItem(
          "backPain"
        )}&Diabeties=${sessionStorage.getItem(
          "diabetes"
        )}&Heart_Disease=${sessionStorage.getItem(
          "heartCondition"
        )}&Hypertension=${sessionStorage.getItem("hypertension")}`;
        const response = await axios.get(apiUrl);
        setAllRecommended(response.data);
      } catch (error) {
        console.error("Error fetching Code:", error);
      }
    };
    fetchData();
    fetchChallenges();
    fetchAllData();
    fetchAllRecommended();
  }, []);

  // Show Box Filter #############################################################
  function toggleFilter() {
    const boxFilter = document.getElementById("boxFilter");
    if (boxFilter) {
      boxFilter.classList.toggle("show");
    }
  }
  //Filter using my all Data #############################################################
  const [selectedCategories, setSelectedCategories] = useState([]);
  const [selectedImpactLevels, setSelectedImpactLevels] = useState([]);
  const categories = [...new Set(AllRecommended.map((plan) => plan.Category))];
  const impactLevels = [
    ...new Set(AllRecommended.map((plan) => plan["Impact Level"])),
  ];
  const handleCheckboxChange = (setSelected, value) => {
    setSelected((prevSelected) =>
      prevSelected.includes(value)
        ? prevSelected.filter((item) => item !== value)
        : [...prevSelected, value]
    );
  };
  const filteredPlans = AllRecommended.filter(
    (plan) =>
      (selectedCategories.length === 0 ||
        selectedCategories.includes(plan.Category)) &&
      (selectedImpactLevels.length === 0 ||
        selectedImpactLevels.includes(plan["Impact Level"]))
  );
  const anySelected =
    selectedCategories.length > 0 || selectedImpactLevels.length > 0;
  //Filter search using my all Data #############################################################
  const [searchTerm, setSearchTerm] = useState("");
  const [filteredData, setFilteredData] = useState([]);
  const [isBoxVisible, setIsBoxVisible] = useState(false);

  const handleSearch = (e) => {
    const searchText = e.target.value.toLowerCase();
    setSearchTerm(searchText);
    const filteredData = AllData.filter((plan) =>
      plan.Category.toLowerCase().includes(searchText)
    );
    setFilteredData(filteredData);
    setIsBoxVisible(searchText.trim() !== "");
  };

  // Name images
  let imgrecent1 = recent.length > 0 ? recent[0]["Category"] : null;
  let imgrecent2 = recent.length > 0 ? recent[1]["Category"] : null;
  let imgrecent3 = recent.length > 0 ? recent[2]["Category"] : null;

  let imgchallenges1 = challenges.length > 0 ? challenges[0]["Category"] : null;
  let imgchallenges2 = challenges.length > 0 ? challenges[1]["Category"] : null;
  let imgchallenges3 = challenges.length > 0 ? challenges[2]["Category"] : null;
  let imgchallenges4 = challenges.length > 0 ? challenges[3]["Category"] : null;
  let imgchallenges5 = challenges.length > 0 ? challenges[4]["Category"] : null;
  let imgchallenges6 = challenges.length > 0 ? challenges[5]["Category"] : null;
  let imgchallenges7 = challenges.length > 0 ? challenges[6]["Category"] : null;

  // Storage Data
  const link = useNavigate();
  const toExercise = (n) => {
    window.sessionStorage.setItem("ExercisePlan", recent[n]["Exercise Plan"]);
    window.sessionStorage.setItem("Category", recent[n]["Category"]);
    window.sessionStorage.setItem("ImpactLevel", recent[n]["Impact Level"]);
    window.sessionStorage.setItem(
      "TotalPlanDuration",
      recent[n]["Total Plan Duration (minutes)"]
    );
    window.sessionStorage.setItem(
      "CaloriesBurned",
      recent[n]["Calories Burned (Plan)"]
    );
    window.sessionStorage.setItem(
      "TargetMuscleGroup",
      recent[n]["Target Muscle Group"]
    );
    link("/Exercise");
  };
  const toExercisechallenges = (n) => {
    window.sessionStorage.setItem(
      "ExercisePlan",
      challenges[n]["Exercise Plan"]
    );
    window.sessionStorage.setItem("Category", challenges[n]["Category"]);
    window.sessionStorage.setItem("ImpactLevel", challenges[n]["Impact Level"]);
    window.sessionStorage.setItem(
      "TotalPlanDuration",
      challenges[n]["Total Plan Duration (minutes)"]
    );
    window.sessionStorage.setItem(
      "CaloriesBurned",
      challenges[n]["Calories Burned (Plan)"]
    );
    window.sessionStorage.setItem(
      "TargetMuscleGroup",
      challenges[n]["Target Muscle Group"]
    );
    link("/Exercise");
  };
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
    <div className="Home Workout">
      {error ? (
        <ErrorMessage
          message={message}
          ClosedError={(e) => setErrorMessage({ error: e, message: "" })}
        />
      ) : null}
      {/* Start Header   ###############################################    */}
      <HeaderProfile Workout="active" />
      {/* End Header   ###############################################    */}
      {/* Start backgroundBody   ###############################################    */}
      <div className="backgroundWorkout container position-relative p-0">
        <div className="bg-image">
          <h1>Workout</h1>
          <img
            className="img-fluid"
            src="./images/Workout.png"
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
              placeholder="Search min All Data (Category)"
              value={searchTerm}
              onChange={handleSearch}
            />
          </div>
        </div>
        {/* Drowp menu */}
        <div className="box-filter" id="boxFilter">
          <div className="checkbox-group  d-flex flex-wrap justify-content-evenly">
            <div className="column">
              <h3>Category</h3>
              {categories.map((category) => (
                <label key={category} className="checkbox-label">
                  <input
                    type="checkbox"
                    value={category}
                    onChange={() =>
                      handleCheckboxChange(setSelectedCategories, category)
                    }
                  />
                  <span className="custom-checkbox"></span>
                  {category}
                </label>
              ))}
            </div>
            <div className="column">
              <h3>Impact Level</h3>
              {impactLevels.map((level) => (
                <label key={level} className="checkbox-label">
                  <input
                    type="checkbox"
                    value={level}
                    onChange={() =>
                      handleCheckboxChange(setSelectedImpactLevels, level)
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
        <div className="exercise-plans Recent text-center mt-5 mb-5">
          <h2>All Plans</h2>
          <div className="container text-start">
            <div className="row row-cols-3 gap-3 justify-content-evenly">
              {filteredData.map((plan, index) => (
                <div
                  key={index}
                  className="col card"
                  onClick={() => {
                    toExerciseAll(plan);
                  }}
                >
                  <img
                    src={"./images/workouts/" + plan.Category + ".jpg"} // Modify to use appropriate image based on plan
                    className="card-img-top"
                    alt="..."
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
        </div>
      </div>
      {/* Filter checkbox */}
      {anySelected && (
        <div className="exercise-plans Recent text-center mt-5 mb-5">
          <h2>Recommended{"  "}exercises</h2>
          <div className="container text-start">
            <div className="row row-cols-3 gap-3 justify-content-evenly">
              {filteredPlans.map((plan, index) => (
                <div
                  key={index}
                  className="col card"
                  onClick={() => {
                    toExerciseAll(plan);
                  }}
                >
                  <img
                    src={"./images/workouts/" + plan.Category + ".jpg"} // Modify to use appropriate image based on plan
                    className="card-img-top"
                    alt="..."
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
        </div>
      )}

      {anySelected || isBoxVisible ? null : (
        <>
          {/* start Recent   ###############################################    */}
          <div className="Recent text-center mt-5 mb-5">
            <h2>your plans</h2>
            <div className="container text-start">
              <div className="row row-cols-3 gap-3 justify-content-evenly">
                <div
                  className="col card"
                  onClick={() => {
                    toExercise(0);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgrecent1 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {recent.length > 0
                        ? recent[0]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {recent.length > 0
                        ? recent[0]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {recent.length > 0
                        ? recent[0]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {recent.length > 0
                          ? recent[0]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercise(1);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgrecent2 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {recent.length > 0
                        ? recent[1]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {recent.length > 0
                        ? recent[1]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {recent.length > 0
                        ? recent[1]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {recent.length > 0
                          ? recent[1]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercise(2);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgrecent3 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {recent.length > 0
                        ? recent[2]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {recent.length > 0
                        ? recent[2]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {recent.length > 0
                        ? recent[2]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {recent.length > 0
                          ? recent[2]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* End Recent   ###############################################    */}
          {/* start Challenges   ###############################################    */}
          <div className="Recent text-center mt-5 mb-5">
            <h2>Challenges</h2>
            <div className="container text-start">
              <div className="row row-cols-3 gap-3 justify-content-evenly">
                <div
                  className="col card"
                  onClick={() => {
                    toExercisechallenges(0);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgchallenges1 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {challenges.length > 0
                        ? challenges[0]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {challenges.length > 0
                        ? challenges[0]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {challenges.length > 0
                        ? challenges[0]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {challenges.length > 0
                          ? challenges[0]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                      <span className="text-danger">Day 1</span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercisechallenges(1);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgchallenges2 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {challenges.length > 0
                        ? challenges[1]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {challenges.length > 0
                        ? challenges[1]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {challenges.length > 0
                        ? challenges[1]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {challenges.length > 0
                          ? challenges[1]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                      <span className="text-danger">Day 2</span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercisechallenges(2);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgchallenges3 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {challenges.length > 0
                        ? challenges[2]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {challenges.length > 0
                        ? challenges[2]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {challenges.length > 0
                        ? challenges[2]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {challenges.length > 0
                          ? challenges[2]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                      <span className="text-danger">Day 3</span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercisechallenges(3);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgchallenges4 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {challenges.length > 0
                        ? challenges[3]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {challenges.length > 0
                        ? challenges[3]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {challenges.length > 0
                        ? challenges[3]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {challenges.length > 0
                          ? challenges[3]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                      <span className="text-danger">Day 4</span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercisechallenges(4);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgchallenges5 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {challenges.length > 0
                        ? challenges[4]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {challenges.length > 0
                        ? challenges[4]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {challenges.length > 0
                        ? challenges[4]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {challenges.length > 0
                          ? challenges[4]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                      <span className="text-danger">Day 5</span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercisechallenges(5);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgchallenges6 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {challenges.length > 0
                        ? challenges[5]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {challenges.length > 0
                        ? challenges[5]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {challenges.length > 0
                        ? challenges[5]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {challenges.length > 0
                          ? challenges[5]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                      <span className="text-danger">Day 6</span>
                    </div>
                  </div>
                </div>
                <div
                  className="col card"
                  onClick={() => {
                    toExercisechallenges(6);
                  }}
                >
                  <img
                    src={"./images/workouts/" + imgchallenges7 + ".jpg"}
                    className="card-img-top"
                    alt="..."
                  />
                  <div className="card-body">
                    <h4 className="card-title">
                      {challenges.length > 0
                        ? challenges[6]["Category"]
                        : "waiting......"}
                    </h4>
                    <p className="card-text">
                      Level:{" "}
                      {challenges.length > 0
                        ? challenges[6]["Impact Level"]
                        : "waiting......"}
                    </p>
                    <div>
                      {challenges.length > 0
                        ? challenges[6]["Total Plan Duration (minutes)"]
                        : "waiting......"}{" "}
                      min
                      <span>
                        {challenges.length > 0
                          ? challenges[6]["Calories Burned (Plan)"]
                          : "waiting......"}{" "}
                        Calories
                      </span>
                      <span className="text-danger">Day 7</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* End Challenges   ###############################################    */}
        </>
      )}
      {/* Start Footer   ###############################################    */}
      <Footer />
      {/* End Footer   ###############################################    */}
    </div>
  );
};
export default Workout;
