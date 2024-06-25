import React from "react";
import "./ErrorMessage.css";

const InfoMessage = ({ message, ClosedError }) => {
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
        style={{ color: "white", background: "#7898F6" }}
        className="Error d-flex align-items-center justify-content-center"
      >
        <i
          style={{ color: "white" }}
          className="color-svg-Error fa-solid fa-circle-info"
        ></i>
        <div>
          <h1>Info message</h1>
          <p style={{ color: "#E8E8E8" }}>{message}</p>
        </div>
        <button onClick={onClosed}>
          <i
            style={{ color: "white" }}
            className="fa-solid fa-xmark closed"
          ></i>
        </button>
      </div>
    </div>
  );
};

export default InfoMessage;
