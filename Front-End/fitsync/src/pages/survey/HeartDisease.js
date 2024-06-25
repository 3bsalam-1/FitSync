import React, { useState } from "react";
import "../LandingPage.css";
import "./Survey.css";

const HeartDisease = ({ onPrevious, onNext }) => {
  const [heartDisease, setheartDisease] = useState("");
  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Do You Suffer from Heart Disease? </h1>
      <div>
        <button
          className="btn-text text-center"
          onClick={() => setheartDisease("1")}
        >
          YES
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setheartDisease("0")}
        >
          NO
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          heartDisease
            ? onNext(heartDisease)
            : alert("please choose Do You Suffer from Heart Disease")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default HeartDisease;
