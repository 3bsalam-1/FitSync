import React from "react";
import "./Favourites.css";
import HeaderProfile from "../../components/HeaderProfile";
import SliderWotkout from "../../components/SliderWotkout";
import SliderDiet from "../../components/SliderDiet";

const Favourites = () => {
  return (
    <div className="Home Favourites">
      {/* Start Header   ###############################################    */}
      <HeaderProfile />
      {/* End Header   ###############################################    */}
      {/* Start Recommended   ###############################################    */}
      <div className="Recommended  mt-5 mb-5 ">
        <div className="Recommended-title text-center">
          <h2>Favourites</h2>
          <h3>Workout</h3>
        </div>
        <SliderWotkout />
      </div>
      <div className="Recommended  mt-5 mb-5 ">
        <div className="Recommended-title text-center">
          <h2>Favourites</h2>
          <h3>Diet</h3>
        </div>
        <SliderDiet />
      </div>
      {/* End Recommended   ###############################################    */}
    </div>
  );
};
export default Favourites;
