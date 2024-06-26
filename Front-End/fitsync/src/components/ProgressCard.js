import React from "react";
import "./ProgressCard.css";

const ProgressCard = ({ days, title, progress, status }) => {
  const getStatusColor = () => {
    switch (status) {
      case "In Progress":
        return { color: "yellow", text: "In Progress" };
      case "Completed":
        return { color: "green", text: "Completed" };
      case "Halted":
        return { color: "red", text: "Halted" };
      default:
        return { color: "gray", text: "Unknown" };
    }
  };

  const statusColor = getStatusColor();

  return (
    <div className="progress-card">
      <div>
        <div className="header">
          <span>{days} Days</span>
          <h3>{title}</h3>
        </div>
        <div className="progress-bar">
          <div
            className="progress"
            style={{
              width: `${progress}%`,
              backgroundColor: statusColor.color,
            }}
          ></div>
          <span className="progress-text">{progress}%</span>
        </div>
      </div>
      <div className="status">
        <span className="status-text">{statusColor.text}</span>
        <span className={`status-indicator ${statusColor.color}`}></span>
      </div>
    </div>
  );
};

export default ProgressCard;
