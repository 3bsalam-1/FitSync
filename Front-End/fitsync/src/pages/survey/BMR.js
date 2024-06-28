import React, { useState } from "react";

const BMR = ({ onPrevious, onNext }) => {
  const [BMR, setBMR] = useState("");

  const onInputChange = (e) => {
    setBMR({ [BMR]: e.target.value });
  };
  const handleSubmit = (e) => {
    e.preventDefault();
    BMR ? onNext(BMR) : alert("Please fill out all fields");
  };

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5">Please Enter Your BMR</h1>
      <form onSubmit={handleSubmit} className="MTop-110">
        <input
          className="ps-4"
          type="number"
          min={1}
          max={300}
          onChange={onInputChange}
          placeholder="BMR"
        />
        <input type="submit" value="Continue" className="Continue" />
      </form>
    </div>
  );
};
export default BMR;
