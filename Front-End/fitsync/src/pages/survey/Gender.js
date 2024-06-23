import React, { useState } from "react";
import "./Survey.css";
import { Link } from "react-router-dom";

const Gender = ({ onNext }) => {
  const [gender, setGender] = useState("");

  return (
    <div>
      <Link to="/WelcomScreen">
        <button className="Back">
          <i className="fa-solid fa-angle-left"></i>
        </button>
      </Link>
      <h2>Welcome to FitSync</h2>
      <h1>What’s Your Gender ?</h1>
      <div className="box">
        <button onClick={() => setGender("1")}>
          <i className="fa-solid fa-mars"></i>
          Male
        </button>
        <button onClick={() => setGender("0")}>
          <i className="fa-solid fa-venus"></i>
          Female
        </button>
      </div>
      <button
        className="Continue"
        onClick={() =>
          gender ? onNext(gender) : alert("please choose gender")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Gender;
