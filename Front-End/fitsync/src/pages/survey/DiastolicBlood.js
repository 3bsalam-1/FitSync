import React, { useState } from "react";

const DiastolicBlood = ({ onPrevious, onNext }) => {
  const [diastolicBlood, setdiastolicBlood] = useState("");

  const onInputChange = (e) => {
    setdiastolicBlood({ [diastolicBlood]: e.target.value });
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    diastolicBlood
      ? onNext(diastolicBlood)
      : alert("Please fill out all fields");
  };

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">Enter diastolic blood pressure </h1>
      <form onSubmit={handleSubmit} className="MTop-110">
        <input
          className="ps-4"
          type="number"
          min={1}
          max={300}
          onChange={onInputChange}
          placeholder="DIA"
        />
        <input type="submit" value="Continue" className="Continue" />
      </form>
    </div>
  );
};
export default DiastolicBlood;
