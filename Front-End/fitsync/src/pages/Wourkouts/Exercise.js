import React, { useEffect, useState } from "react";
import "../Home.css";
import "./Workout.css";
import "./Exercise.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHeart as solidHeart } from "@fortawesome/free-solid-svg-icons";
import { faHeart as regularHeart } from "@fortawesome/free-regular-svg-icons";
import Footer from "../../components/Footer";
import HeaderProfile from "../../components/HeaderProfile";
import { useNavigate } from "react-router-dom";
import Swal from "sweetalert2";
import { toast } from "react-toastify";

const Exercise = () => {
  const [like, setLike] = useState(false);
  const link = useNavigate();

  const TimeExercise = (
    sessionStorage.getItem("TotalPlanDuration") / 6
  ).toFixed(2);
  const Exerciseplan = sessionStorage.getItem("ExercisePlan").split(",");

  const [isShowCard, setShowCard] = useState(6);
  const ShowCard = (e) => {
    setShowCard(e);
  };

  // Edit Time and Complete ############################################################
  const [timeLeft, setTimeLeft] = useState(null);
  const [complete, setComplete] = useState([
    true,
    true,
    true,
    true,
    true,
    true,
  ]);
  const startCountdown = () => {
    setTimeLeft(TimeExercise * 60); // 8.33 minutes in seconds
  };
  useEffect(() => {
    if (timeLeft === null) return;

    if (timeLeft <= 0) {
      setTimeLeft(0);
      setComplete((prevComplete) => {
        const newComplete = [...prevComplete];
        newComplete[isShowCard] = true;
        return newComplete;
      });
      return;
    }

    const intervalId = setInterval(() => {
      setTimeLeft((prevTime) => prevTime - 1);
    }, 1000);

    return () => clearInterval(intervalId);
  }, [timeLeft, isShowCard]);
  const formatTime = (seconds) => {
    const min = Math.floor(seconds / 60);
    const sec = Math.floor(seconds % 60);
    return `${min}:${sec < 10 ? "0" : ""}${sec}`;
  };
  // Complete Workout  ############################################################
  const CompleteWorkout = () => {
    Swal.fire({
      title: "Congratulations!",
      text: "You have completed the workout",
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

  //  Add favorite Workout #############################################################
  const addWorkout = async () => {
    const Calories = sessionStorage.getItem("CaloriesBurned");
    try {
      // const Calories = calories.reduce((a, b) => a + b, 0);
      const response = await fetch(
        "https://fitsync.onrender.com/api/vitalsignal/burned",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${sessionStorage
              .getItem("authToken")
              .trim()}`,
          },
          body: JSON.stringify({
            burned: Calories,
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
  const workoutString = `Exercise Plan: ${sessionStorage.getItem(
    "ExercisePlan"
  )}*Category: ${sessionStorage.getItem(
    "Category"
  )}*Impact Level: ${sessionStorage.getItem(
    "ImpactLevel"
  )}*Total Plan Duration (minutes):${sessionStorage.getItem(
    "TotalPlanDuration"
  )}*Calories Burned (Plan): ${sessionStorage.getItem(
    "CaloriesBurned"
  )}*Target Muscle Group: ${sessionStorage.getItem("TargetMuscleGroup")} `;
  // const addWorkout = async (e) => {
  //   console.log("workoutString: ", workoutString);
  //   e.preventDefault();

  //   const maxRetries = 3;
  //   let attempt = 0;
  //   let success = false;

  //   while (attempt < maxRetries && !success) {
  //     try {
  //       const response = await fetch(
  //         "https://fitsync.onrender.com/api/workout",
  //         {
  //           method: "POST",
  //           headers: {
  //             "Content-Type": "application/json",
  //             Authorization: `Bearer ${sessionStorage
  //               .getItem("authToken")
  //               .trim()}`,
  //           },
  //           body: JSON.stringify({
  //             workout: workoutString,
  //           }),
  //         }
  //       );

  //       if (!response.ok) {
  //         const responseData = await response.json();
  //         console.log("responseData", responseData);
  //         return;
  //       }

  //       const data = await response.json();
  //       console.log("data", data);
  //       toast.success("Registered successfully");
  //       success = true;
  //     } catch (err) {
  //       attempt++;
  //       console.error(`Error on attempt ${attempt}:`, err);
  //       if (attempt >= maxRetries) {
  //         console.error("Max retries reached. Failed to add workout.");
  //         toast.error("Failed to register workout. Please try again later.");
  //       }
  //     }
  //   }
  // };
  const addfavorite = async (e) => {
    console.log("workoutString: ", workoutString);
    e.preventDefault();
    try {
      const response = await fetch("https://fitsync.onrender.com/api/workout", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${sessionStorage.getItem("authToken").trim()}`,
        },
        body: JSON.stringify({
          workout: workoutString,
        }),
      });

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
    <div className="Home Workout">
      {/* Start Header   ###############################################    */}
      <HeaderProfile Workout="active" />
      {/* End Header   ###############################################    */}
      {/* Start backgroundBody   ###############################################    */}
      <div className="backgroundWorkout container position-relative p-0">
        <div className="bg-image">
          <h1>{sessionStorage.getItem("Category")}</h1>
          <img
            className="img-fluid"
            src="./images/Workout.png"
            alt="Background Body"
          />
        </div>
      </div>
      {/* End backgroundBody   ###############################################    */}
      {/* start Exercise   ###############################################    */}
      <div className="Exercise container mt-5 mb-5">
        <div className="def-exercise position-relative">
          <div className="Content">
            <h2>Exercise Content</h2>
            <div className="d-flex align-items-center justify-content-between">
              <button>
                <i className="fa-solid fa-person-running me-1"></i> 6 Exercises
              </button>
              <button>
                <i className="fa-regular fa-clock me-1"></i>
                {sessionStorage.getItem("TotalPlanDuration")}
              </button>
              <button>
                <i className="fa-solid fa-fire me-1"></i>
                {sessionStorage.getItem("CaloriesBurned")}
              </button>
            </div>
          </div>
          <button
            onClick={() => {
              link("/Workout");
            }}
          >
            Explore Excercises <i className="fa-solid fa-arrow-right ms-2"></i>
          </button>
        </div>
        <div className="plan row flex-wrap mt-3 mb-5">
          <div className="col">
            {/* Card Plan */}
            <div
              className={
                isShowCard === 6
                  ? "isShowCard-visible card"
                  : "isShowCard-hidden card"
              }
            >
              <img
                src={`./images/workouts/${sessionStorage.getItem(
                  "Category"
                )}.jpg`}
                alt="Yoga"
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              />
              <div className="card-body">
                <div className="d-flex align-items-center justify-content-between ">
                  <div className="d-flex align-items-center justify-content-between ">
                    <p className="card-text m-0 me-3">
                      Difficulty: <span className="text-black"> Hard</span>
                    </p>
                    <p className="card-text m-0 me-3">
                      Fitness Level:{" "}
                      <span className="text-black">
                        {sessionStorage.getItem("ImpactLevel")}
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
                <h5 className="card-title">
                  {sessionStorage.getItem("Category")}
                </h5>
                <button
                  className={
                    complete[0] &&
                    complete[1] &&
                    complete[2] &&
                    complete[3] &&
                    complete[4] &&
                    complete[5]
                      ? "Next-continue btn btn-primary"
                      : "Next-hidden btn btn-primary"
                  }
                  onClick={() => {
                    CompleteWorkout();
                    addWorkout();
                  }}
                >
                  Workout Complete
                </button>
              </div>
            </div>
            {/* Card Exercies */}
            <div
              className={
                isShowCard === 0
                  ? "isShowCard-visible OneExercise"
                  : "isShowCard-hidden OneExercise"
              }
            >
              <video
                controls
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              >
                <source
                  src={`./images/workouts/Video/${Exerciseplan[0].trim()}.mp4`}
                  type="video/mp4"
                ></source>
              </video>
              <div className="card-body p-3">
                <div className="d-flex align-items-center justify-content-between ">
                  <button className="start" onClick={startCountdown}>
                    Start the exercise
                  </button>
                  <h4>
                    {timeLeft !== null ? formatTime(timeLeft) : TimeExercise}{" "}
                    <span>minutes</span>
                  </h4>
                </div>
                <h5 className="card-title">{Exerciseplan[0].trim()}</h5>
                <button
                  className={
                    complete[0]
                      ? "Next-continue btn btn-primary"
                      : "Next-hidden btn btn-primary"
                  }
                  onClick={() => {
                    ShowCard((isShowCard + 1) % Exerciseplan.length);
                    setTimeLeft(null);
                  }}
                >
                  Next
                </button>
              </div>
            </div>
            <div
              className={
                isShowCard === 1
                  ? "isShowCard-visible OneExercise"
                  : "isShowCard-hidden OneExercise"
              }
            >
              <video
                controls
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              >
                <source
                  src={`./images/workouts/Video/${Exerciseplan[1].trim()}.mp4`}
                  type="video/mp4"
                ></source>
              </video>
              <div className="card-body p-3">
                <div className="d-flex align-items-center justify-content-between ">
                  <button className="start" onClick={startCountdown}>
                    Start the exercise
                  </button>
                  <h4>
                    {timeLeft !== null ? formatTime(timeLeft) : TimeExercise}{" "}
                    <span>minutes</span>
                  </h4>
                </div>
                <h5 className="card-title">{Exerciseplan[1].trim()}</h5>
                <button
                  className={
                    complete[1]
                      ? "Next-continue btn btn-primary"
                      : "Next-hidden btn btn-primary"
                  }
                  onClick={() => {
                    ShowCard((isShowCard + 1) % Exerciseplan.length);
                    setTimeLeft(null);
                  }}
                >
                  Next
                </button>
              </div>
            </div>
            <div
              className={
                isShowCard === 2
                  ? "isShowCard-visible OneExercise"
                  : "isShowCard-hidden OneExercise"
              }
            >
              <video
                controls
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              >
                <source
                  src={`./images/workouts/Video/${Exerciseplan[2].trim()}.mp4`}
                  type="video/mp4"
                ></source>
              </video>
              <div className="card-body p-3">
                <div className="d-flex align-items-center justify-content-between ">
                  <button className="start" onClick={startCountdown}>
                    Start the exercise
                  </button>
                  <h4>
                    {timeLeft !== null ? formatTime(timeLeft) : TimeExercise}{" "}
                    <span>minutes</span>
                  </h4>
                </div>
                <h5 className="card-title">{Exerciseplan[2].trim()}</h5>
                <button
                  className={
                    complete[2]
                      ? "Next-continue btn btn-primary"
                      : "Next-hidden btn btn-primary"
                  }
                  onClick={() => {
                    ShowCard((isShowCard + 1) % Exerciseplan.length);
                    setTimeLeft(null);
                  }}
                >
                  Next
                </button>
              </div>
            </div>
            <div
              className={
                isShowCard === 3
                  ? "isShowCard-visible OneExercise"
                  : "isShowCard-hidden OneExercise"
              }
            >
              <video
                controls
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              >
                <source
                  src={`./images/workouts/Video/${Exerciseplan[3].trim()}.mp4`}
                  type="video/mp4"
                ></source>
              </video>
              <div className="card-body p-3">
                <div className="d-flex align-items-center justify-content-between ">
                  <button className="start" onClick={startCountdown}>
                    Start the exercise
                  </button>
                  <h4>
                    {timeLeft !== null ? formatTime(timeLeft) : TimeExercise}{" "}
                    <span>minutes</span>
                  </h4>
                </div>
                <h5 className="card-title">{Exerciseplan[3].trim()}</h5>
                <button
                  className={
                    complete[3]
                      ? "Next-continue btn btn-primary"
                      : "Next-hidden btn btn-primary"
                  }
                  onClick={() => {
                    ShowCard((isShowCard + 1) % Exerciseplan.length);
                    setTimeLeft(null);
                  }}
                >
                  Next
                </button>
              </div>
            </div>
            <div
              className={
                isShowCard === 4
                  ? "isShowCard-visible OneExercise"
                  : "isShowCard-hidden OneExercise"
              }
            >
              <video
                controls
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              >
                <source
                  src={`./images/workouts/Video/${Exerciseplan[4].trim()}.mp4`}
                  type="video/mp4"
                ></source>
              </video>
              <div className="card-body p-3">
                <div className="d-flex align-items-center justify-content-between ">
                  <button className="start" onClick={startCountdown}>
                    Start the exercise
                  </button>
                  <h4>
                    {timeLeft !== null ? formatTime(timeLeft) : TimeExercise}{" "}
                    <span>minutes</span>
                  </h4>
                </div>
                <h5 className="card-title">{Exerciseplan[4].trim()}</h5>
                <button
                  className={
                    complete[4]
                      ? "Next-continue btn btn-primary"
                      : "Next-hidden btn btn-primary"
                  }
                  onClick={() => {
                    ShowCard((isShowCard + 1) % Exerciseplan.length);
                    setTimeLeft(null);
                  }}
                >
                  Next
                </button>
              </div>
            </div>
            <div
              className={
                isShowCard === 5
                  ? "isShowCard-visible OneExercise"
                  : "isShowCard-hidden OneExercise"
              }
            >
              <video
                controls
                className="p-3"
                style={{ width: "100%", height: "340px" }}
              >
                <source
                  src={`./images/workouts/Video/${Exerciseplan[5].trim()}.mp4`}
                  type="video/mp4"
                ></source>
              </video>
              <div className="card-body p-3">
                <div className="d-flex align-items-center justify-content-between ">
                  <button className="start" onClick={startCountdown}>
                    Start the exercise
                  </button>
                  <h4>
                    {timeLeft !== null ? formatTime(timeLeft) : TimeExercise}{" "}
                    <span>minutes</span>
                  </h4>
                </div>
                <h5 className="card-title">{Exerciseplan[5].trim()}</h5>
                <button
                  className={
                    complete[0] &&
                    complete[1] &&
                    complete[2] &&
                    complete[3] &&
                    complete[4] &&
                    complete[5]
                      ? "Next-continue btn btn-primary"
                      : "Next-hidden btn btn-primary"
                  }
                  onClick={() => {
                    ShowCard(isShowCard + 1);
                    setTimeLeft(null);
                  }}
                >
                  Done
                </button>
              </div>
            </div>
          </div>
          <div
            className="col special-exercises p-3"
            style={{ minWidth: "356px" }}
          >
            <div
              className="exercises-box d-flex align-items-center mb-2 position-relative"
              onClick={() => ShowCard(0)}
            >
              <FontAwesomeIcon icon="fa-regular fa-circle-play" />
              <img
                src={`./images/workouts/${Exerciseplan[0].trim()}.jpg`}
                alt="exercice"
                className="p-0 me-2"
                style={{ width: "80px", height: "80px" }}
              />
              <div className="text-box flex-grow-1 position-relative">
                <p className="fw-bold">{Exerciseplan[0].trim()}</p>
                <span className="text-black-50">{TimeExercise} </span>
                <img
                  className={
                    complete[0]
                      ? "isShowCard-visible complete-video"
                      : "isShowCard-hidden complete-video"
                  }
                  src="./images/true2.png"
                  alt="complete"
                ></img>
              </div>
            </div>
            <div
              className="exercises-box d-flex align-items-center mb-2 position-relative"
              onClick={() => ShowCard(1)}
            >
              <FontAwesomeIcon icon="fa-regular fa-circle-play" />
              <img
                src={`./images/workouts/${Exerciseplan[1].trim()}.jpg`}
                alt="exercice"
                className="p-0 me-2"
                style={{ width: "80px", height: "80px" }}
              />
              <div className="text-box flex-grow-1 position-relative">
                <p className="fw-bold">{Exerciseplan[1].trim()}</p>
                <span className="text-black-50">{TimeExercise} </span>
                <img
                  className={
                    complete[1]
                      ? "isShowCard-visible complete-video"
                      : "isShowCard-hidden complete-video"
                  }
                  src="./images/true2.png"
                  alt="complete"
                ></img>
              </div>
            </div>
            <div
              className="exercises-box d-flex align-items-center mb-2 position-relative"
              onClick={() => ShowCard(2)}
            >
              <FontAwesomeIcon icon="fa-regular fa-circle-play" />
              <img
                src={`./images/workouts/${Exerciseplan[2].trim()}.jpg`}
                alt="exercice"
                className="p-0 me-2"
                style={{ width: "80px", height: "80px" }}
              />
              <div className="text-box flex-grow-1 position-relative">
                <p className="fw-bold">{Exerciseplan[2].trim()}</p>
                <span className="text-black-50">{TimeExercise} </span>
                <img
                  className={
                    complete[2]
                      ? "isShowCard-visible complete-video"
                      : "isShowCard-hidden complete-video"
                  }
                  src="./images/true2.png"
                  alt="complete"
                ></img>
              </div>
            </div>
            <div
              className="exercises-box d-flex align-items-center mb-2 position-relative"
              onClick={() => ShowCard(3)}
            >
              <FontAwesomeIcon icon="fa-regular fa-circle-play" />
              <img
                src={`./images/workouts/${Exerciseplan[3].trim()}.jpg`}
                alt="exercice"
                className="p-0 me-2"
                style={{ width: "80px", height: "80px" }}
              />
              <div className="text-box flex-grow-1 position-relative">
                <p className="fw-bold">{Exerciseplan[3].trim()}</p>
                <span className="text-black-50">{TimeExercise} </span>
                <img
                  className={
                    complete[3]
                      ? "isShowCard-visible complete-video"
                      : "isShowCard-hidden complete-video"
                  }
                  src="./images/true2.png"
                  alt="complete"
                ></img>
              </div>
            </div>
            <div
              className="exercises-box d-flex align-items-center mb-2 position-relative"
              onClick={() => ShowCard(4)}
            >
              <FontAwesomeIcon icon="fa-regular fa-circle-play" />
              <img
                src={`./images/workouts/${Exerciseplan[4].trim()}.jpg`}
                alt="exercice"
                className="p-0 me-2"
                style={{ width: "80px", height: "80px" }}
              />
              <div className="text-box flex-grow-1 position-relative">
                <p className="fw-bold">{Exerciseplan[4].trim()}</p>
                <span className="text-black-50">{TimeExercise} </span>
                <img
                  className={
                    complete[4]
                      ? "isShowCard-visible complete-video"
                      : "isShowCard-hidden complete-video"
                  }
                  src="./images/true2.png"
                  alt="complete"
                ></img>
              </div>
            </div>
            <div
              className="exercises-box d-flex align-items-center mb-2 position-relative"
              onClick={() => ShowCard(5)}
            >
              <FontAwesomeIcon icon="fa-regular fa-circle-play" />
              <img
                src={`./images/workouts/${Exerciseplan[5].trim()}.jpg`}
                alt="exercice"
                className="p-0 me-2"
                style={{ width: "80px", height: "80px" }}
              />
              <div className="text-box flex-grow-1 position-relative">
                <p className="fw-bold">{Exerciseplan[5].trim()}</p>
                <span className="text-black-50">{TimeExercise} </span>
                <img
                  className={
                    complete[5]
                      ? "isShowCard-visible complete-video"
                      : "isShowCard-hidden complete-video"
                  }
                  src="./images/true2.png"
                  alt="complete"
                ></img>
              </div>
            </div>
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
export default Exercise;
