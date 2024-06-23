import React, { useState } from "react";

const Vegetarian = ({ onPrevious, onNext }) => {
  const [Vegetarian, setVegetarian] = useState("");
  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Are You Vegetarian ? </h1>
      <div>
        <button
          className="btn-text text-center"
          onClick={() => setVegetarian("1")}
        >
          YES
        </button>
        <button
          className="btn-text text-center"
          onClick={() => setVegetarian("0")}
        >
          NO
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          Vegetarian
            ? onNext(Vegetarian)
            : alert("please choose Are You Vegetarian")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Vegetarian;
