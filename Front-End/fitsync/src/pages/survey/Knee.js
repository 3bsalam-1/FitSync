import React, { useState } from "react";

const Knee = ({ onPrevious, onNext }) => {
  const [knee, setknee] = useState("");
  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Do You Suffer from Knee Pain? </h1>
      <div>
        <button className="btn-text text-center" onClick={() => setknee("1")}>
          YES
        </button>
        <button className="btn-text text-center" onClick={() => setknee("0")}>
          NO
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          knee
            ? onNext(knee)
            : alert("please choose Do You Suffer from Knee Pain")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Knee;
