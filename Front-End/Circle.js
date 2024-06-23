import React, { useEffect, useRef } from "react";
import "./Circle.css";
const Circle = ({ progress = 0, size = 150, name }) => {
  const canvasRef = useRef(null);
  const percentage = progress / 100;

  useEffect(() => {
    const ctx = canvasRef.current.getContext("2d");

    // Draw the active progress arc based on percentage
    ctx.clearRect(0, 0, size, size); // Clear canvas before redrawing
    drawOuterRing(ctx, size);
    const endingAngle = 2 * percentage * Math.PI - Math.PI / 2;
    drawActiveArc(ctx, size, endingAngle);
  }, [percentage, size]); // Update canvas on progress change

  const drawOuterRing = (ctx, size) => {
    // Function to draw the outer gray ring of the progress bar
    ctx.beginPath();
    ctx.lineWidth = 9;
    ctx.strokeStyle = "#e1e1e1";
    ctx.arc(size / 2, size / 2, size / 2 - 25.5, 0, 2 * Math.PI);
    ctx.stroke();
  };

  const drawActiveArc = (ctx, size, endingAngle) => {
    // Function to draw the blue progress arc based on the ending angle
    ctx.beginPath();
    ctx.lineWidth = 9;
    ctx.strokeStyle = "#8d6ff8";
    ctx.lineCap = "round";
    ctx.arc(size / 2, size / 2, size / 2 - 25.5, -Math.PI / 2, endingAngle);
    ctx.stroke();
  };

  return (
    <div className="progress-bar">
      <div id="progress-text">
        <img className="img-fluid" src="./images/Fire.png" alt="Fire" />
        <h3>{parseInt(percentage * 100, 10)}%</h3>
        <p>{name}</p>
      </div>
      <canvas ref={canvasRef} width={size} height={size} />
    </div>
  );
};
export default Circle;
