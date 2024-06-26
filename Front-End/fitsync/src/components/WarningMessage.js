import React from "react";
import "./ErrorMessage.css";

const WarningMessage = ({ message, ClosedError }) => {
  const onClosed = () => {
    let elements = document.getElementsByClassName("Error");
    for (let element of elements) {
      element.classList.add("hidden");
    }
    ClosedError(false);
  };

  return (
    <div>
      <div
        style={{ color: "white", background: "#FFC13F" }}
        className="Error d-flex align-items-center justify-content-center"
      >
        <i
          style={{ color: "black" }}
          className="color-svg-Error fa-solid fa-triangle-exclamation"
        ></i>
        <div>
          <h1 style={{ color: "black" }}>Warning message</h1>
          <p style={{ color: "#262626" }}>{message}</p>
        </div>
        <button onClick={onClosed}>
          <i
            style={{ color: "black" }}
            className="fa-solid fa-xmark closed"
          ></i>
        </button>
      </div>
    </div>
  );
};

export default WarningMessage;
