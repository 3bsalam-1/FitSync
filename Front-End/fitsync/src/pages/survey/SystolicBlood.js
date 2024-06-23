import React, { useState } from "react";

const SystolicBlood = ({ onPrevious, onNext }) => {
  const [systolicBlood, setsystolicBlood] = useState("");

  const onInputChange = (e) => {
    setsystolicBlood({ [systolicBlood]: e.target.value });
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    systolicBlood ? onNext(systolicBlood) : alert("Please fill out all fields");
  };

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">Enter systolic blood pressure </h1>
      <form onSubmit={handleSubmit} className="MTop-110">
        <input
          className="ps-4"
          type="number"
          min={1}
          max={300}
          onChange={onInputChange}
          placeholder="SYS"
        />
        <input type="submit" value="Continue" className="Continue" />
      </form>
    </div>
  );
};
export default SystolicBlood;
