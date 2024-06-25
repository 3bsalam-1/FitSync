import React from "react";
import { Link } from "react-router-dom";
import "./WelcomScreen.css";

const WelcomScreen = () => {
  return (
    <div className="welcomscreen text-center pt-5 pb-2">
      <h2>Welcome to</h2>
      <h1>FitSync</h1>
      <div className="exercise box-cont container p-0">
        <div className="d-flex flex-wrap justify-content-between">
          <div className="box">
            <figure>
              <img className="img-fluid" src="./images/Ready.png" alt="Ready" />
              <figcaption>
                <p>Ready for some wins? start tracking, it's easy!</p>
              </figcaption>
            </figure>
          </div>
          <div className="box">
            <figure>
              <img
                className="img-fluid"
                src="./images/Discover.png"
                alt="Discover"
              />
              <figcaption>
                <p>Discover the impact of your food and fitness </p>
              </figcaption>
            </figure>
          </div>
          <div className="box">
            <figure>
              <img
                className="img-fluid"
                src="./images/eating.png"
                alt="eating"
              />
              <figcaption>
                <p>And make mindful eating a habit for life</p>
              </figcaption>
            </figure>
          </div>
        </div>
      </div>
      <Link to="/survey">
        <button className="Continue ">Continue</button>
      </Link>
    </div>
  );
};
export default WelcomScreen;
