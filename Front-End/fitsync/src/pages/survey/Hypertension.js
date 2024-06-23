import React, { useState } from "react";

const Hypertension = ({ onPrevious, onNext }) => {
  const [hypertension, sethypertension] = useState("");

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Do You Suffer from hypertension? </h1>
      <div>
        <button
          className="btn-text text-center"
          onClick={() => sethypertension("1")}
        >
          YES
        </button>
        <button
          className="btn-text text-center"
          onClick={() => sethypertension("0")}
        >
          NO
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          hypertension
            ? onNext(hypertension)
            : alert("please choose Do You Suffer from hypertension")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Hypertension;
