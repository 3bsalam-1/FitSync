import React, { useState } from "react";
import "../LandingPage.css";

const Cholesterol = ({ onPrevious, onNext }) => {
  const [cholesterol, setscholesterol] = useState("");

  const onInputChange = (e) => {
    setscholesterol({ [cholesterol]: e.target.value });
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    cholesterol ? onNext(cholesterol) : alert("Please fill out all fields");
  };

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">Please Enter cholesterol level </h1>
      <form onSubmit={handleSubmit} className="MTop-110">
        <input
          className="ps-4"
          type="number"
          min={1}
          max={300}
          onChange={onInputChange}
          placeholder="Mg/dL"
        />
        <input type="submit" value="Continue" className="Continue" />
      </form>
    </div>
  );
};
export default Cholesterol;
