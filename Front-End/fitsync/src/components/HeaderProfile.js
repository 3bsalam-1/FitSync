import React, { useEffect, useState } from "react";
import "./HeaderProfile.css";
import { jwtDecode } from "jwt-decode";
import { Link, useNavigate } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

const HeaderProfile = ({ Home = "", Workout = "", Diet = "" }) => {
  // User Data
  const [userName, setUserName] = useState("");
  const [userImg, setUserImg] = useState("");
  const authToken = sessionStorage.getItem("authToken");

  useEffect(() => {
    if (authToken) {
      try {
        const userData = jwtDecode(authToken);
        if (userData) {
          setUserName(`${userData.firstName} ${userData.lastName}`);
          setUserImg(userData.avatar);
        } else {
          console.error("Decoded token does not contain expected user data");
        }
      } catch (error) {
        console.error("Error decoding token:", error.message);
      }
    }
  }, [authToken]);
  // Logout profile
  const link = useNavigate();
  const handleLogout = () => {
    window.sessionStorage.clear();
    link("/");
  };
  // Show dropdown-profile
  const [isMenuVisible, setIsMenuVisible] = useState(false);
  const toggleMenu = () => {
    setIsMenuVisible(!isMenuVisible);
  };
  return (
    <>
      <nav className="sticky-top pb-4">
        <div className="container	d-flex flex-wrap justify-content-between align-items-center">
          <div className="logo d-flex align-items-center">
            <img src="./images/logo.png" alt="logo"></img>
            <p>
              Fit<span>s</span>ync
            </p>
          </div>
          <div className="link d-flex flex-wrap justify-content-between align-items-center">
            <Link
              className={`${Home} ms-4 me-4`}
              aria-current="page"
              to="/Home"
            >
              Home
            </Link>
            <Link className={`${Workout} ms-4 me-4`} to="/Workout">
              Workouts
            </Link>
            <Link className={`${Diet} ms-4 me-4`} to="/Diet">
              Diet
            </Link>
          </div>
          <div className="profile d-flex align-items-center">
            <img src={userImg} alt="profile"></img>
            <div>
              <h3>Hi {userName} </h3>
              <button className="dropdown-profile" onClick={toggleMenu}>
                My Fitness <FontAwesomeIcon icon="fa-solid fa-caret-down" />
              </button>

              <ul className={isMenuVisible ? "visible" : "hidden"}>
                <li className="mb-4">
                  <Link className="d-flex align-items-center" to="/Calender">
                    <FontAwesomeIcon icon="fa-solid fa-calendar-days" />
                    Calender
                  </Link>
                </li>
                <li className="mb-4">
                  <Link className="d-flex align-items-center" to="/Favourites">
                    <FontAwesomeIcon icon="fa-regular fa-heart" />
                    Favourites
                  </Link>
                </li>
                <li className="mb-4">
                  <Link
                    className="d-flex align-items-center"
                    to="/Notifications"
                  >
                    <FontAwesomeIcon icon="fa-regular fa-bell" />
                    Notifications
                  </Link>
                </li>
                <li className="mb-4">
                  <Link className="d-flex align-items-center" to="/EditProfile">
                    <FontAwesomeIcon icon="fa-regular fa-user" />
                    Edit Profile
                  </Link>
                </li>
                <li className="mb-4">
                  <Link className="d-flex align-items-center" to="/Account">
                    <FontAwesomeIcon icon="fa-solid fa-gear" />
                    Account
                  </Link>
                </li>
                <li>
                  <Link
                    className="d-flex align-items-center"
                    to="/"
                    onClick={handleLogout}
                  >
                    <FontAwesomeIcon icon="fa-solid fa-right-from-bracket" />
                    Log Out
                  </Link>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
    </>
  );
};

export default HeaderProfile;
