import React from "react";
import "./Footer.css";
import { Link } from "react-router-dom";

const Footer = () => {
  return (
    <>
      <footer className="footer pb-5 text-white ">
        <div className="container	">
          <div className="row ">
            <div className="col-md-6 col-lg-4 p-4">
              <div className="abouts">
                <h5>About Us </h5>
                <p>
                  your ultimate destination for achieving your fitness goals and
                  living a healthier lifestyle. We are providing you with
                  personalized diet and workout plans with advanced activity
                  tracking features
                </p>
                <ul className="d-flex mt-4 list-unstyled gap-2 justify-content-start">
                  <li>
                    <Link className="d-block text-light" href="/">
                      <i className="fa-brands fa-facebook-f fa-lg  rounded-circle p-2"></i>
                    </Link>
                  </li>
                  <li>
                    <Link className="d-block text-light" href="/">
                      <i className="fa-brands fa-twitter fa-lg  rounded-circle p-2"></i>
                    </Link>
                  </li>
                  <li>
                    <Link className="d-block text-light" href="/">
                      <i className="fa-brands fa-instagram fa-lg  rounded-circle p-2"></i>
                    </Link>
                  </li>
                  <li>
                    <Link className="d-block text-light" href="/">
                      <i className="fa-brands fa-linkedin-in fa-lg  rounded-circle p-2"></i>
                    </Link>
                  </li>
                </ul>
              </div>
            </div>
            <div className="col-md-6 col-lg-2 p-4">
              <div className="links">
                <h5>Quick Links </h5>
                <ul className="list-unstyled lh-lg">
                  <li>Calendar</li>
                  <li>Favourites</li>
                  <li>Notifications</li>
                  <li>Edit Profile</li>
                  <li>Account</li>
                </ul>
              </div>
            </div>
            <div className="col-md-6 col-lg-2 p-4">
              <div className="links">
                <h5>Services</h5>
                <ul className="list-unstyled lh-lg">
                  <li>Diet Plans </li>
                  <li>Workout Plans</li>
                  <li>Tracking Activity Progress</li>
                  <li>Challenges</li>
                  <li>Recipes</li>
                </ul>
              </div>
            </div>
            <div className="col-md-6 col-lg-4 p-4">
              <div className="abouts contact">
                <h5>Contact </h5>
                <p>
                  Subscribe to our newsletter for the latest updates and
                  insights
                </p>
                <form>
                  <input type="email" placeholder="support@gmail.com" />
                  <input type="submit" value={"Contact us"} />
                </form>
              </div>
            </div>
          </div>
          <hr />
          <p>Copyright &copy; 2024 Fitsync Team All Rights Reserved</p>
        </div>
      </footer>
    </>
  );
};
export default Footer;
