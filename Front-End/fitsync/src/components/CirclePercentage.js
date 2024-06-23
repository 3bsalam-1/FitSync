import React from "react";
import "./CirclePercentage.css";

const CirclePercentage = ({ length = 80, Dashoffset = 0, iconlogo }) => {
  const Diameterlength = length;
  const strokeDashoffset = 504 - (504 * Dashoffset) / 100;
  return (
    <div className="boxCirclePercentage">
      {iconlogo}
      <div className="percent position-relative">
        <svg>
          <circle
            cx={Diameterlength}
            cy={Diameterlength}
            r={Diameterlength}
          ></circle>
          <circle
            cx={Diameterlength}
            cy={Diameterlength}
            r={Diameterlength}
            style={{ strokeDashoffset: strokeDashoffset }}
          ></circle>
        </svg>
        <div className="number">
          <h2>{Dashoffset}%</h2>
        </div>
      </div>
      <h2 className="text">of daily goals</h2>
    </div>
  );
};
export default CirclePercentage;
