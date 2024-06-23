import React from "react";
import "./App.css";
import { Route, Routes } from "react-router-dom";

import Home from "./pages/Home";
import Login from "./pages/Login";
import Signup from "./pages/Signup";
import Workout from "./pages/Wourkouts/Workout";
import Exercise from "./pages/Wourkouts/Exercise";
import Survey from "./pages/survey/Survey";
import LandingPage from "./pages/LandingPage";
import WelcomScreen from "./pages/survey/WelcomScreen";
import ForgetPassword from "./pages/verificationCode/ForgetPassword";
import UserVerification from "./pages/UserVerification";
import Diet from "./pages/Diet/Diet";
import OverviewDiet from "./pages/Diet/OverviewDiet";

import PrivateRoute from "./routes/PrivateRoutes";
import PrivateRouteHome from "./routes/PrivateRouteHome";
import PrivateRouteUserverify from "./routes/PrivateRouteUserverify";

function App() {
  window.onscroll = () => {
    if (document.getElementsByTagName("nav").length) {
      if (
        document.body.scrollTop > 20 ||
        document.documentElement.scrollTop > 20
      ) {
        document.getElementsByTagName("nav")[0].classList.add("scrolled");
      } else {
        document.getElementsByTagName("nav")[0].classList.remove("scrolled");
      }
    }
  };

  return (
    <div className="App">
      <Routes>
        <Route path="/" Component={LandingPage} />
        {/* <Route path="/" Component={Home} /> */}
        <Route path="/login" Component={Login} />
        <Route path="/signup" Component={Signup} />
        <Route path="/Workout" Component={Workout} />
        <Route path="/Exercise" Component={Exercise} />
        <Route path="/Diet" Component={Diet} />
        <Route path="/OverviewDiet" Component={OverviewDiet} />
        <Route path="/ForgetPassword" Component={ForgetPassword} />
        <Route
          path="/UserVerification"
          element={
            <PrivateRouteUserverify>
              <UserVerification />
            </PrivateRouteUserverify>
          }
        />
        <Route
          path="/WelcomScreen"
          element={
            <PrivateRoute>
              <WelcomScreen />
            </PrivateRoute>
          }
        />
        <Route
          path="/survey"
          element={
            <PrivateRoute>
              <Survey />
            </PrivateRoute>
          }
        />
        <Route
          path="/Home"
          element={
            <PrivateRouteHome>
              <Home />
            </PrivateRouteHome>
          }
        />
        <Route
          path="/Workout"
          element={
            <PrivateRouteHome>
              <Workout />
            </PrivateRouteHome>
          }
        />
        <Route
          path="/Diet"
          element={
            <PrivateRouteHome>
              <Workout />
            </PrivateRouteHome>
          }
        />
      </Routes>
    </div>
  );
}

export default App;
