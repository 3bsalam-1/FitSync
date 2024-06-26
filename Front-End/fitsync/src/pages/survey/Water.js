import React, { useState } from "react";

const Water = ({ onPrevious, onNext }) => {
  const [Water, setWater] = useState("");

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">What is your daily water intake ?</h1>
      <div>
        <button
          className="btn-text text-center"
          onClick={() => setWater("more than 6 glasses")}
        >
          more than 6 glasses
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setWater("3 to 6 glasses")}
        >
          3 to 6 glasses
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setWater("1 to 2 glasses")}
        >
          1 to 2 glasses
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setWater("I only drink soda or coffee")}
        >
          I only drink soda or coffee
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          Water
            ? onNext(Water)
            : alert("please choose What is your daily water intake ")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Water;
