import React, { useState } from "react";

const Sleep = ({ onPrevious, onNext }) => {
  const [Sleep, setSleep] = useState("");

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">How much do you sleep every night ? </h1>
      <div>
        <button
          className="btn-text text-center"
          onClick={() => setSleep("more than 8 hours")}
        >
          more than 8 hours
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setSleep("7 - 8 hours")}
        >
          7 - 8 hours
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setSleep("6 - 7 hours")}
        >
          6 - 7 hours
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setSleep("less than 8 hours")}
        >
          less than 8 hours
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          Sleep
            ? onNext(Sleep)
            : alert("please choose How much do you sleep every night")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Sleep;
