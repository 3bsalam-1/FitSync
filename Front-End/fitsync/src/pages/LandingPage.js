import React from "react";
import { Link } from "react-router-dom";
import "./LandingPage.css";
import Footer from "../components/Footer";
const LandingPage = () => {
  return (
    <div className="LandingPage">
      {/* Start Header   ###############################################    */}
      <nav className="sticky-top">
        <div className="container	d-flex flex-wrap justify-content-between align-items-center">
          <div className="logo d-flex align-items-center">
            <img src="./images/logo.png" alt="logo"></img>
            <p>
              Fit<span>s</span>ync
            </p>
          </div>
          <Link to="/signup">
            <button className="btn btn-lg rounded-pill d-flex justify-content-center align-items-center">
              <span className="me-3 text-capitalize">Get started</span>
              <i className="fa-solid fa-arrow-right"></i>
            </button>
          </Link>
        </div>
      </nav>
      {/* End Header   ###############################################    */}
      {/* Start Body   ###############################################    */}
      <div className="download container d-flex align-items-center flex-wrap pb-5">
        <div className="row align-items-center ">
          <div className="text-box col-md-12 col-lg-6">
            <h1>
              Transform your health Journey into a story of{" "}
              <span>Strength</span>
            </h1>
            <p>
              Build healthy habits with the all-in-one food exercise, and
              calorie tracker
            </p>
            <button className="btn btn-lg rounded-pill">
              <span className="me-3 text-capitalize">Download App Now</span>
            </button>
          </div>
          <div className="images col-md-6 col-lg-6 position-relative">
            <img
              className="img-fluid Landphone"
              src="./images/Landimage/phone.png"
              alt="The form of the application on mobile"
            ></img>
            <img
              className="Landdiet"
              src="./images/Landimage/diet.png"
              alt="The form of the application on mobile"
            ></img>
            <img
              className="Landworkout"
              src="./images/Landimage/workout.png"
              alt="The form of the application on mobile"
            ></img>
          </div>
        </div>
      </div>
      <div className="exercise container pb-5 text-center">
        <div className="d-flex flex-wrap justify-content-between">
          <div className="box">
            <figure>
              <img
                className="img-fluid"
                src="./images/Exercise.png"
                alt="Exercise"
              />
              <figcaption>
                <h2>Exercise Program</h2>
                <p>
                  Even the all-powerful Pointing has no control about the blind
                  texts it is an almost unorthographic
                </p>
              </figcaption>
            </figure>
            {/* <button>Read More</button> */}
          </div>
          <div className="box">
            <figure>
              <img
                className="img-fluid"
                src="./images/Nutrition.png"
                alt="Nutrition"
              />
              <figcaption>
                <h2>Nutrition Plans</h2>
                <p>
                  structured approach to eating that is designed to optimize
                  health, performance or achieve specific goals
                </p>
              </figcaption>
            </figure>
            {/* <button>Read More</button> */}
          </div>
          <div className="box">
            <figure>
              <img className="img-fluid" src="./images/Diet.png" alt="Diet" />
              <figcaption>
                <h2>Diet Program</h2>
                <p>
                  temporary plan that outlines specific guidelines for eating to
                  achieve certain health, fitness, or related goals
                </p>
              </figcaption>
            </figure>
            {/* <button>Read More</button> */}
          </div>
        </div>
      </div>
      <div className="follow container pt-5 pb-5 ">
        <div className="row align-items-center">
          <div className="text-box col-md-12 col-lg-6 ">
            <h2>
              Follow the unique<span> fitness plan</span> tailored to
              <span>
                {" "}
                your individual needs and goals, and celebrate the results
              </span>
            </h2>
          </div>
          <div className="image col-md-6 col-lg-6">
            <img
              className="img-fluid"
              src="./images/phone_Home.png"
              alt="phone Home"
            ></img>
          </div>
        </div>
      </div>
      <div className="habits container pt-5 pb-5 ">
        <div className="row align-items-center">
          <div className="image col-md-6 col-lg-6">
            <img
              className="img-fluid"
              src="./images/habits.png"
              alt="habits"
            ></img>
          </div>
          <div className="text-box col-md-12 col-lg-6 ">
            <h2>
              Change your <span>habits</span> and reach your goals
            </h2>
            <p>
              Now you have the tools and knowledge to build healthy habits for
              life
            </p>
          </div>
        </div>
      </div>
      <div className="track container pt-5 pb-5 ">
        <div className="row align-items-center">
          <div className="text-box col-md-12 col-lg-6 ">
            <h2>
              <span>Track</span> food, fitness & Steps
            </h2>
            <p>
              Tracking calories and macros is easy with our barcode scanner and
              device integration
            </p>
          </div>
          <div className="image col-md-6 col-lg-6">
            <img
              className="img-fluid"
              src="./images/Track.png"
              alt="Track"
            ></img>
          </div>
        </div>
      </div>
      <div className="healthy container text-center  ">
        <div className="text-box  ">
          <h2>
            Lead A <span>Healthy</span> Life
          </h2>
          <p>
            A healthy lifestyle involves a balanced diet, regular exercise,
            sleep, stress management, social connections, health check-ups,
            personalized healthcare guidance
          </p>
        </div>
        <div>
          <img
            className="img-fluid"
            src="./images/Healthy.png"
            alt="Healthy"
          ></img>
        </div>
      </div>
      <div className="application">
        <div>
          <div className="row align-items-center">
            <div className="image col-md-6 col-lg-6 text-end">
              <img
                className="img-fluid"
                src="./images/phone_mockup2.png"
                alt="phone_mockup"
              ></img>
            </div>
            <div className="text-box col-md-12 col-lg-6 ">
              <button className="start">
                <span className="text-capitalize">start today</span>
              </button>
              <h2>Download the App</h2>
              <p>
                Discover personalized fitness plans, nutritious recipes,and
                mindfulness practices that will elevate youe well-being your
                health matters, and the time to prioritize it is now Let's make
                positive changes together
              </p>
              <div className="d-flex flex-wrap justify-content-around align-items-center">
                {/* <button className="btndownload d-flex justify-content-evenly align-items-center">
                  <i className="fa-brands fa-apple"></i>
                  <p>
                    Download on the
                    <br />
                    <span>Apple Store</span>
                  </p>
                </button> */}
                <button className="btndownload d-flex justify-content-evenly  align-items-center">
                  <i className="fa-brands fa-google-play"></i>
                  <p>
                    Download on the
                    <br />
                    <span>Google Play</span>
                  </p>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      {/* End Bodey   ###############################################    */}
      {/* Start Footer   ###############################################    */}
      <Footer />
      {/* End Footer   ###############################################    */}
    </div>
  );
};

export default LandingPage;
