import React, { useState } from "react";

const ActivityLevel = ({ onPrevious, onNext }) => {
  const [ActivityLevel, setActivityLevel] = useState("");

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">What is your Activity level of Fitness? </h1>
      <div>
        <button
          className="btn-text text-center pt-3 pb-3"
          onClick={() => setActivityLevel(0)}
        >
          Sedentary
        </button>
        <button
          className="btn-text text-center pt-3 pb-3"
          onClick={() => setActivityLevel(1)}
        >
          Light
        </button>
        <button
          className="btn-text text-center pt-3 pb-3"
          onClick={() => setActivityLevel(2)}
        >
          Moderate
        </button>
        <button
          className="btn-text text-center pt-3 pb-3"
          onClick={() => setActivityLevel(3)}
        >
          Active
        </button>
        <button
          className="btn-text text-center pt-3 pb-3"
          onClick={() => setActivityLevel(4)}
        >
          Very Active
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          ActivityLevel
            ? onNext(ActivityLevel)
            : alert("please choose current level of Fitness")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default ActivityLevel;
