import React, { useState } from "react";

const Birth = ({ onPrevious, onNext }) => {
  const [birth, setBirth] = useState({ DD: "", MM: "", YYYY: "" });
  const onInputChange = (e, field) => {
    const value = e.target.value;
    setBirth((prevBirth) => ({
      ...prevBirth,
      [field]: value,
    }));
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    const { DD, MM, YYYY } = birth;
    DD && MM && YYYY
      ? onNext(`${DD}/${MM}/${YYYY}`)
      : alert("Please fill out all fields");
  };
  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">What’s Your Date of Birth?</h1>
      <form onSubmit={handleSubmit}>
        <div className="birth MTop-110 d-flex flex-wrap justify-content-between align-items-center">
          <div>
            <label>Day</label>
            <input
              className="DD"
              type="number"
              min={1}
              max={31}
              onChange={(e) => onInputChange(e, "DD")}
              placeholder="DD"
            />
          </div>
          <div>
            <label>Month</label>
            <input
              className="MM"
              type="number"
              min={1}
              max={12}
              onChange={(e) => onInputChange(e, "MM")}
              placeholder="MM"
            />
          </div>
          <div>
            <label>Year</label>
            <input
              className="YYYY"
              type="number"
              min={new Date().getFullYear() - 85}
              max={new Date().getFullYear()}
              onChange={(e) => onInputChange(e, "YYYY")}
              placeholder="YYYY"
            />
          </div>
        </div>

        <input type="submit" value="Continue" className="Continue" />
      </form>
    </div>
  );
};

export default Birth;
