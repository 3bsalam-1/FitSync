import React, { useRef, useEffect } from "react";
import Chart from "chart.js/auto"; // Import Chart from chart.js

import "./LineChart.css";

const LineChart = ({ num, DATA }) => {
  const chartRef = useRef(null);

  useEffect(() => {
    const daysOfWeek = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];

    const data = {
      labels: daysOfWeek,
      datasets: [
        {
          label: "My First Dataset",
          data: DATA,
          fill: false,
          borderColor: "#8d6ff8",
          tension: 0.1,
        },
      ],
    };

    const options = {
      scales: {
        x: {
          type: "category",
          ticks: {
            align: "center",
            color: "#333",
          },
        },
        y: {
          beginAtZero: true, // Ensure y-axis starts from zero
          ticks: {
            stepSize: 20,
          },
        },
      },
      plugins: {
        legend: {
          display: false, // Hide the legend
        },
        tooltip: {
          enabled: false, // Disable tooltips
        },
      },
      chart: {
        width: 650, // Set the width of the chart
        height: 350, // Set the height of the chart
      },
    };

    if (chartRef && chartRef.current) {
      const chartInstance = new Chart(chartRef.current, {
        type: "line",
        data: data,
        options: options,
      });

      // Clean up
      return () => {
        chartInstance.destroy();
      };
    }
  }, [DATA]);

  return (
    <div className="LineChart">
      <canvas ref={chartRef} />
    </div>
  );
};

export default LineChart;
