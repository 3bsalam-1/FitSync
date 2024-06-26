import React, { useState } from "react";
import "../LandingPage.css";
import "./Survey.css";

const Weight = ({ onPrevious, onNext }) => {
  const [Weight, setWeight] = useState("");
  const onInputChange = (e) => {
    setWeight({ [Weight]: e.target.value });
  };

  const [activeClass, setActiveClass] = useState("Kg");
  const handleClick = (className) => {
    setActiveClass(className);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    Weight ? onNext(Weight) : alert("Please fill out all fields");
  };

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">What’s Your Weight?</h1>
      <form onSubmit={handleSubmit} className="MTop-110">
        <input
          className="ps-4"
          type="number"
          min={1}
          max={300}
          onChange={onInputChange}
          placeholder="Weight"
        />

        <div className="toggle-button-cover">
          <div
            className={`Kg ${activeClass === "Kg" ? "active" : ""}`}
            onClick={() => handleClick("Kg")}
          >
            kg
          </div>
          <div
            className={`bs ${activeClass === "bs" ? "active" : ""}`}
            onClick={() => handleClick("bs")}
          >
            1br
          </div>
        </div>

        <input type="submit" value="Continue" className="Continue" />
      </form>
    </div>
  );
};
export default Weight;
