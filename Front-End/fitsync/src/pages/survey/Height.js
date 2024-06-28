import React, { useState } from "react";
import "../LandingPage.css";
import "./Survey.css";

const Height = ({ onPrevious, onNext }) => {
  const [Height, setHeight] = useState(0);

  const onInputChange = (e) => {
    setHeight({ [Height]: e.target.value });
  };

  const [activeClass, setActiveClass] = useState("cm");
  const handleClick = (className) => {
    setActiveClass(className);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    Height ? onNext(Height) : alert("Please fill out all fields");
  };

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">How tall are you?</h1>
      <form onSubmit={handleSubmit} className="MTop-110">
        <input
          className="ps-4"
          type="number"
          min={1}
          max={300}
          onChange={onInputChange}
          placeholder="Height"
        />

        <div className="toggle-button-cover">
          <div
            className={`cm ${activeClass === "cm" ? "active" : ""}`}
            onClick={() => handleClick("cm")}
          >
            cm
          </div>
          <div
            className={`ft ${activeClass === "ft" ? "active" : ""}`}
            onClick={() => handleClick("ft")}
          >
            ft & in
          </div>
        </div>

        <input type="submit" value="Continue" className="Continue" />
      </form>
    </div>
  );
};
export default Height;
