import React, { useEffect, useState } from "react";
import "./LandingPage.css";
import "./Home.css";
import Barchart from "../components/BarChart";
import CirclePercentage from "../components/CirclePercentage";
import ProgressCard from "../components/ProgressCard";
import CircleNumber from "../components/CircleNumber";
import HeaderProfile from "../components/HeaderProfile";
import Footer from "../components/Footer";
import axios from "axios";

const Home = () => {
  // User Data
  useEffect(() => {
    const fetchData = async () => {
      try {
        const apiUrl = "https://fitsync.onrender.com/api/userInfo";
        const response = await axios.get(apiUrl, {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${sessionStorage
              .getItem("authToken")
              .trim()}`,
          },
        });
        window.sessionStorage.setItem("weight", response.data.data.weight);
        window.sessionStorage.setItem("height", response.data.data.height);
        window.sessionStorage.setItem(
          "birthdate",
          response.data.data.birthdate
        );
        window.sessionStorage.setItem("gender", response.data.data.gender);
        window.sessionStorage.setItem(
          "activityLevel",
          response.data.data.activityLevel
        );
        window.sessionStorage.setItem(
          "systolicBP",
          response.data.data.systolicBP
        );
        window.sessionStorage.setItem(
          "diastolicBP",
          response.data.data.diastolicBP
        );
        window.sessionStorage.setItem(
          "cholesterolLevel",
          response.data.data.cholesterolLevel
        );
        window.sessionStorage.setItem(
          "bloodsugar",
          response.data.data.bloodsugar
        );
        window.sessionStorage.setItem(
          "hypertension",
          response.data.data.diseases.hypertension
        );
        window.sessionStorage.setItem(
          "diabetes",
          response.data.data.diseases.diabetes
        );
        window.sessionStorage.setItem(
          "heartCondition",
          response.data.data.diseases.heartCondition
        );
        window.sessionStorage.setItem(
          "LowPressure",
          response.data.data.diseases.LowPressure
        );
        window.sessionStorage.setItem("BMR", response.data.data.BMR);
        window.sessionStorage.setItem(
          "kneePain",
          response.data.data.diseases.kneePain
        );
        window.sessionStorage.setItem(
          "backPain",
          response.data.data.diseases.backPain
        );
        window.sessionStorage.setItem("isActive", response.data.data.isActive);
        window.sessionStorage.setItem("__v", response.data.data.diseases.__v);
      } catch (error) {
        console.error("Error fetching Code:", error);
      }
    };
    fetchData();
  }, []);
  // Graph
  const [chartGraph, setChartGraph] = useState(1);
  const viewGraph = (n, event) => {
    setChartGraph(n);
  };
  // Water Percentage
  const [WaterPercentage, setWaterPercentage] = useState(0);
  useEffect(() => {
    if (WaterPercentage < 0) {
      setWaterPercentage(0);
    }
    if (WaterPercentage > 100) {
      setWaterPercentage(100);
    }
  }, [WaterPercentage]);
  const increaseWaterPercentage = () => {
    setWaterPercentage(WaterPercentage + 1);
  };
  const decreaseWaterPercentage = () => {
    setWaterPercentage(WaterPercentage - 1);
  };

  return (
    <div className="Home">
      {/* Start Header   ###############################################    */}
      <HeaderProfile Home="active" />
      {/* End Header   ###############################################    */}
      {/* Start backgroundBody   ###############################################    */}
      <div className="backgroundBody container">
        <img
          className="img-fluid"
          src="./images/backgroundBody.png"
          alt="Background Body"
        />
      </div>
      {/* End backgroundBody   ###############################################    */}
      {/* Start Record data   ###############################################    */}
      <div className="Recorddata container gap-4 d-flex flex-wrap justify-content-evenly mt-5 mb-5">
        <div
          className={`box ${chartGraph === 1 ? "active-Recorddata" : ""}`}
          onClick={(event) => viewGraph(1, event)}
        >
          <h2>13,100</h2>
          <p>Calories Eaten</p>
          <img src="./images/Calories.png" alt="Calories"></img>
        </div>
        <div
          className={`box ${chartGraph === 2 ? "active-Recorddata" : ""}`}
          onClick={(event) => viewGraph(2, event)}
        >
          <h2>52,100</h2>
          <p>Steps Taken</p>
          <img src="./images/Steps.png" alt="Steps"></img>
        </div>
        <div
          className={`box ${chartGraph === 3 ? "active-Recorddata" : ""}`}
          onClick={(event) => viewGraph(3, event)}
        >
          <h2>0.75 L</h2>
          <p>Water Consumed</p>
          <img src="./images/Water.png" alt="Water"></img>
        </div>
        <div
          className={`box ${chartGraph === 4 ? "active-Recorddata" : ""}`}
          onClick={(event) => viewGraph(4, event)}
        >
          <h2>82 BPM</h2>
          <p>Heart Measured </p>
          <img src="./images/Heart.png" alt="Heart"></img>
        </div>
      </div>
      {/* End Record data   ###############################################    */}
      {/* Start Chart   ###############################################    */}
      {chartGraph === 1 && (
        <div className="Chartgraph container Graph1">
          <div className="mt-5 mb-5 d-flex align-items-center gap-5 justify-content-center">
            <Barchart
              title="Calories Eaten"
              num="700 kcal"
              DATA={[6578, 6787, 3245, 9876, 2324, 5123, 2435]}
            />

            <div className="Return-ratio position-relative">
              <h2>Sunday Activity</h2>
              <CirclePercentage
                Dashoffset={80}
                iconlogo={<i className="fa-solid fa-fire"></i>}
              />
              <div className="row">
                <div className="col text-center">
                  <h2>700 </h2>
                  <div className="d-flex align-items-center justify-content-center">
                    <i className="fa-solid fa-fire"></i>
                    <span>Consumed</span>
                  </div>
                </div>
                <div className="col text-center">
                  <h2>1820 </h2>
                  <div className="d-flex align-items-center justify-content-center ">
                    <i className="fa-solid fa-fire"></i>
                    <span>Intake</span>
                  </div>
                </div>
                <div className="col text-center">
                  <h2>5 </h2>
                  <div className="d-flex align-items-center justify-content-center">
                    <i className="fa-solid fa-clock"></i>
                    <span>Active Hours</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
      {chartGraph === 2 && (
        <div className="Chartgraph container Graph2">
          <div className="mt-5 mb-5 d-flex flex-wrap align-items-center justify-content-evenly">
            <Barchart
              title="Steps Taken"
              num="3.2 km"
              DATA={[6578, 6787, 3245, 9876, 2324, 5123, 2435]}
            />
            <div className="Return-ratio position-relative">
              <h2>Sunday Activity</h2>
              <CircleNumber
                Dashoffset={8000}
                iconlogo={<i className="fa-solid fa-fire"></i>}
              />
              <div className="Steps d-flex flex-row ">
                <div className="d-flex flex-column align-items-center justify-content-center">
                  <i className="fa-solid fa-fire"></i>
                  <span> 31 kcal</span>
                </div>
                <div className="d-flex flex-column align-items-center justify-content-center">
                  <i className="fa-solid fa-location-dot"></i>
                  <span> 2 km</span>
                </div>
                <div className="d-flex flex-column align-items-center justify-content-center">
                  <i className="fa-solid fa-clock"></i>
                  <span> 50 min</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
      {chartGraph === 3 && (
        <div className="Chartgraph container Graph3">
          <div className="mt-5 mb-5 d-flex flex-wrap align-items-center justify-content-evenly">
            <Barchart
              title="Sleep Hours"
              num=""
              DATA={[6578, 6787, 3245, 9876, 2324, 5123, 2435]}
            />
            <div className="Return-ratio position-relative">
              <h2>Sunday Activity</h2>
              <CirclePercentage
                Dashoffset={WaterPercentage}
                iconlogo={<i className="fa-solid fa-droplet"></i>}
              />
              <div className="box-water d-flex align-items-center justify-content-center">
                <button onClick={decreaseWaterPercentage}>
                  <i className="fa-solid fa-minus"></i>
                </button>
                <img src="./images/cupWater.png" alt="Water" />
                <button onClick={increaseWaterPercentage}>
                  <i className="fa-solid fa-plus"></i>
                </button>
              </div>
              <p>1x Glass 200ml</p>
            </div>
          </div>
        </div>
      )}
      {chartGraph === 4 && (
        <div className="Chartgraph container Graph4">
          <div className="Chatr-ProgressCard mt-5 mb-5 d-flex align-items-center">
            <ProgressCard
              days="12"
              title="15 Days Jump Rope Challenge"
              progress={40}
              status="In Progress"
            />
            <ProgressCard
              days="12"
              title="15 Days Jump Rope Challenge"
              progress={100}
              status="Completed"
            />
            <ProgressCard
              days="12"
              title="15 Days Jump Rope Challenge"
              progress={65}
              status="Halted"
            />
            <ProgressCard
              days="12"
              title="15 Days Jump Rope Challenge"
              progress={100}
              status="Completed"
            />
          </div>
        </div>
      )}
      {/* End Chart   ###############################################    */}
      {/* Start lifestyle   ###############################################    */}
      <div className="lifestyle container mt-5 mb-5 ">
        <div className="title position-relative">
          <h2>lifestyle</h2>
          <p>Why healthy</p>
        </div>
        <div className="row">
          <div className="col">
            <p>
              Health is a state of complete physical, mental and social
              well-being and not merely the absence of disease or infirmity
            </p>
            <div className="box d-flex align-items-center justify-content-between">
              <div className="ms-2 me-2">
                <h3>Motivation</h3>
                <p>
                  It is a long established fact that a reader will be distracted
                </p>
              </div>
              <img src="./images/Motivation.png" alt="Motivation" />
            </div>
            <div className="box d-flex align-items-center justify-content-between">
              <img src="./images/Inspire.png" alt="Inspire" />
              <div className="ms-3">
                <h3>Inspire</h3>
                <p>will be distracted by readable content using Lorem Ipsum</p>
              </div>
            </div>
          </div>
          <div className="col position-relative">
            <img src="./images/lifestyle.png" alt="lifestyle" />
          </div>
        </div>
      </div>
      {/* End lifestyle   ###############################################    */}
      {/* Start Footer   ###############################################    */}
      <Footer />
      {/* End Footer   ###############################################    */}
    </div>
  );
};
export default Home;

// "start": "set PORT=8000 && react-scripts start",
