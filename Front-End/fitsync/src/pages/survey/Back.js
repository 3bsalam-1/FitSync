import React, { useState } from "react";

const Back = ({ onPrevious, onNext }) => {
  const [back, setback] = useState("");

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Do You Suffer from Back Pain? </h1>
      <div>
        <button className="btn-text text-center" onClick={() => setback("1")}>
          YES
        </button>
        <button className="btn-text text-center" onClick={() => setback("0")}>
          NO
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          back
            ? onNext(back)
            : alert("please choose Do You Suffer from Back Pain")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Back;
