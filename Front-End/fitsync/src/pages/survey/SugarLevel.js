import React, { useState } from "react";

const SugarLevel = ({ onPrevious, onNext }) => {
  const [sugarLevel, setsugarLevel] = useState("");

  const onInputChange = (e) => {
    setsugarLevel({ [sugarLevel]: e.target.value });
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    sugarLevel ? onNext(sugarLevel) : alert("Please fill out all fields");
  };

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">Please Enter Blood Sugar Level </h1>
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
export default SugarLevel;
