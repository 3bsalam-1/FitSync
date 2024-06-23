import React from "react";
import { Navigate } from "react-router-dom";

const PrivateRouteHome = ({ children }) => {
  const survey = sessionStorage.getItem("survey"); // survey
  return survey ? children : <Navigate to="/" />;
};
export default PrivateRouteHome;
