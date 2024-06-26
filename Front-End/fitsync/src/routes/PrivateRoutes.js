import React from "react";
import { Navigate } from "react-router-dom";

const PrivateRoute = ({ children }) => {
  const firstTime = sessionStorage.getItem("firstTime"); // WelcomScreen and survey
  return firstTime ? children : <Navigate to="/" />;
};
export default PrivateRoute;
