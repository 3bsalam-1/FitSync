import React, { useState } from "react";

const LowPressure = ({ onPrevious, onNext }) => {
  const [LowPressure, setLowPressure] = useState("");

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Do You Suffer from LowPressure? </h1>
      <div>
        <button
          className="btn-text text-center"
          onClick={() => setLowPressure("1")}
        >
          YES
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setLowPressure("0")}
        >
          NO
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          LowPressure
            ? onNext(LowPressure)
            : alert("please choose Do You Suffer from LowPressure")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default LowPressure;
