import React, { useState } from "react";

const Diabetes = ({ onPrevious, onNext }) => {
  const [diabetes, setdiabetes] = useState("");
  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Do You Suffer from Diabetes?</h1>
      <div>
        <button
          className="btn-text text-center"
          onClick={() => setdiabetes("1")}
        >
          YES
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setdiabetes("0")}
        >
          NO
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          diabetes
            ? onNext(diabetes)
            : alert("please choose Do You Suffer from Diabetes")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Diabetes;
