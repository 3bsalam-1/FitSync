import React, { useState } from "react";

const Experience = ({ onPrevious, onNext }) => {
  const [experience, setexperience] = useState("");

  return (
    <div>
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-5 mb-4">Any Previous experience workout? </h1>
      <div>
        <button
          className="btn-text"
          onClick={() => setexperience("Yes,  i workout regularly")}
        >
          Yes, i workout regularly
        </button>
        <button
          className="btn-text"
          onClick={() => setexperience("Yes,  less than a year")}
        >
          Yes, less than a year
        </button>
        <button
          className="btn-text"
          onClick={() => setexperience("Yes,  less than 1 year")}
        >
          Yes, less than 1 year
        </button>
        <button
          className="btn-text"
          onClick={() =>
            setexperience("NO, i dont' have any previouss experience")
          }
        >
          NO, i dont' have any previouss experience
        </button>
      </div>

      <button
        className="Continue"
        onClick={() =>
          experience ? onNext(experience) : alert("please choose experience")
        }
      >
        Continue
      </button>
    </div>
  );
};
export default Experience;
