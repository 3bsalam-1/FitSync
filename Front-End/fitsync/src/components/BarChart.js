import React from "react";
import Chart from "react-apexcharts";
import "./BarChart.css";

const Barchart = ({ title, num, DATA }) => {
  return (
    <div className="Chart">
      <div className="TitleChart d-flex flex-column">
        <h2>{title}</h2>
        <h3 className="text-end">{num}</h3>
      </div>
      <Chart
        type="bar"
        series={[
          {
            name: "Calories Eaten",
            data: DATA,
          },
        ]}
        options={{
          colors: ["#8d6ff8"],
          theme: { mode: "transparent" },
          xaxis: {
            tickPlacement: "on",
            categories: [
              "Sunday",
              "Monday",
              "Tuesday",
              "Wednesday",
              "Thursday",
              "Friday",
              "Saturday",
            ],
          },
          plotOptions: {
            bar: {
              columnWidth: 20,
              borderRadius: 10, // Set the borderRadius for circular edges
            },
          },
          dataLabels: {
            enabled: false, // Hide the data labels
          },
          legend: {
            show: false,
          },
          chart: {
            type: "bar",
            height: 350, // Set the height to 300
            toolbar: {
              show: false,
            },
          },
          responsive: [
            {
              breakpoint: 768,
              options: {
                chart: {
                  height: 300,
                },
                plotOptions: {
                  bar: {
                    columnWidth: 4,
                    borderRadius: 1, // Set the borderRadius for circular edges
                  },
                },
              },
            },
            {
              breakpoint: 480,
              options: {
                chart: {
                  height: 200,
                },
                plotOptions: {
                  bar: {
                    columnWidth: 4,
                    borderRadius: 1, // Set the borderRadius for circular edges
                  },
                },
              },
            },
          ],
        }}
      />
    </div>
  );
};

export default Barchart;
// title: {
//             text: title,
//             style: { fontSize: 18.75 },
//           },
//           subtitle: {
//             text: num,
//             style: { fontSize: 22.5, color: "#8d6ff8" },
//             align: "right",
//           },
