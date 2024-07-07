import React from "react";
import "./EditProfile.css";

export default function Main() {
  return (
    <div className="EditProfile">
      <div className="main-container">
        <div className="dashboard-nav">
          <div className="heading">
            <span className="good-morning">Good Morning</span>
            <span className="dashboard-settings">Settings</span>
          </div>
          <div className="frame">
            <div className="search">
              <div className="info">
                <div className="magnifying-glass">
                  <div className="magnifying-glass-1" />
                </div>
                <span className="search-text">Search</span>
              </div>
              <input className="search-input" />
            </div>
            <div className="notifications">
              <div className="bell" />
            </div>
            <div className="ellipse" />
          </div>
        </div>
        <div className="contents">
          <div className="instructor-profile">
            <div className="account-settings">
              <div className="frame-2">
                <div className="frame-3">
                  <span className="account-settings-text">
                    Account Settings
                  </span>
                  <div className="frame-4">
                    <div className="full-name">
                      <div className="input-field">
                        <span className="label-full-name">Full name</span>
                        <div className="input-field-5">
                          <span className="label-first-name">First name</span>
                          <input className="input" />
                        </div>
                      </div>
                      <div className="input-field-6">
                        <span className="label-last-name">Last name</span>
                        <input className="input-7" />
                      </div>
                    </div>
                    <div className="input-field-8">
                      <span className="label-username">Username</span>
                      <div className="input-field-9">
                        <span className="label-enter-username">
                          Enter your username
                        </span>
                      </div>
                    </div>
                    <div className="input-field-a">
                      <span className="label-phone-number">Phone Number</span>
                      <div className="input-field-b">
                        <span className="your-phone-number">
                          Your Phone number...
                        </span>
                        <div className="frame-c">
                          <span className="plus-880">+880</span>
                          <div className="chevron-down">
                            <div className="caret-down" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div className="avatar">
                  <div className="profile-photo">
                    <div className="btn">
                      <div className="upload-simple">
                        <div className="upload-simple-d" />
                      </div>
                      <span className="upload-photo">Upload Photo</span>
                    </div>
                    <div className="image" />
                  </div>
                  <span className="image-size">
                    Image size should be under 1MB and image ration needs to be
                    1:1
                  </span>
                </div>
              </div>
              <div className="title">
                <div className="full-name-e">
                  <div className="input-field-f">
                    <span className="gender-label">Gender</span>
                    <div className="input-field-10">
                      <span className="gender">Your Gender</span>
                      <input className="input-11" />
                    </div>
                  </div>
                  <div className="arrow-down">
                    <div className="arrow-down-12">
                      <div className="arrow-down-13" />
                    </div>
                  </div>
                  <div className="input-field-14">
                    <span className="country-label">Your Country</span>
                    <input className="input-15" />
                  </div>
                  <span className="country">Country </span>
                </div>
              </div>
              <div className="title-16">
                <span className="biography">Biography</span>
                <div className="input-field-17">
                  <span className="bio-description">
                    Your tittle, proffesion or small biography
                  </span>
                </div>
              </div>
            </div>
            <button className="buttons">
              <span className="save-changes">Save changes</span>
            </button>
          </div>
          <div className="notification-change-password">
            <div className="notifications-18">
              <span className="notifications-19">Notifications</span>
              <div className="notifications-1a">
                <div className="notification">
                  <div className="check-box" />
                  <span className="label">
                    I want to know The daily updates
                  </span>
                </div>
                <div className="notification-1b">
                  <div className="check-box-1c">
                    <div className="check">
                      <div className="check-1d" />
                    </div>
                  </div>
                  <span className="label-1e">
                    I want to know the daily plans
                  </span>
                </div>
                <div className="notification-1f">
                  <div className="check-box-20" />
                  <span className="label-21">
                    I want to know the daily challenges
                  </span>
                </div>
                <div className="notification-22">
                  <div className="check-box-23">
                    <div className="check-24">
                      <div className="check-25" />
                    </div>
                  </div>
                  <span className="label-26">
                    I want to know the daily calories
                  </span>
                </div>
                <div className="notification-27">
                  <div className="check-box-28">
                    <div className="check-29">
                      <div className="check-2a" />
                    </div>
                  </div>
                  <span className="label-2b">
                    I want to know the daily steps
                  </span>
                </div>
                <div className="notification-2c">
                  <div className="check-box-2d" />
                  <span className="label-2e">
                    I want to know the daily water
                  </span>
                </div>
                <div className="notification-2f">
                  <div className="check-box-30">
                    <div className="check-31">
                      <div className="check-32" />
                    </div>
                  </div>
                  <span className="label-33">
                    I want to know the upcoming reminders
                  </span>
                </div>
              </div>
              <button className="buttons-34">
                <span className="button">Save changes</span>
              </button>
            </div>
            <div className="change-password">
              <span className="change-password-35">Change password</span>
              <div className="input-field-36">
                <div className="input-field-37">
                  <span className="label-38">Current Password</span>
                  <div className="input-field-39">
                    <input className="input-3a" />
                    <span className="label-3b">Password</span>
                    <div className="eye">
                      <div className="eye-3c" />
                    </div>
                  </div>
                </div>
                <div className="input-field-3d">
                  <span className="label-3e">New Password</span>
                  <div className="input-field-3f">
                    <input className="input-40" />
                    <span className="label-41">Password</span>
                    <div className="eye-42">
                      <div className="eye-43" />
                    </div>
                  </div>
                </div>
                <div className="input-field-44">
                  <span className="label-45">Confirm Password</span>
                  <div className="input-field-46">
                    <input className="input-47" />
                    <span className="label-48">Confirm new password</span>
                    <div className="eye-49">
                      <div className="eye-4a" />
                    </div>
                  </div>
                </div>
              </div>
              <button className="buttons-4b">
                <span className="button-4c">Save changes</span>
              </button>
            </div>
          </div>
        </div>
        <div className="footer">
          <div className="container">
            <div className="line" />
            <span className="copyright">
              Copyright © 2024 Fitsync Team All Rights Reserved
            </span>
            <div className="bg">
              <div className="bg-4d">
                <div className="box" />
              </div>
              <div className="bg-4e" />
            </div>
            <div className="about-us">
              <span className="about-us-4f">About Us</span>
              <span className="description">
                your ultimate destination for achieving your fitness goals and
                living a healthier lifestyle. We are providing you with
                personalized diet and workout plans with advanced activity
                tracking features
              </span>
              <div className="social-media-logo">
                <div className="facebook">
                  <div className="round" />
                  <div className="facebook-outline">
                    <div className="vector" />
                  </div>
                </div>
                <div className="twitter">
                  <div className="round-50" />
                  <div className="twitter-outline">
                    <div className="vector-51" />
                  </div>
                </div>
                <div className="instagram">
                  <div className="round-52" />
                  <div className="instagram-53">
                    <div className="vector-54" />
                  </div>
                </div>
                <div className="linkedin">
                  <div className="linkedin-55">
                    <div className="brand-logos">
                      <div className="vector-56" />
                      <div className="flex-row-e">
                        <div className="vector-57" />
                        <div className="vector-58" />
                      </div>
                    </div>
                  </div>
                  <div className="round-59" />
                </div>
              </div>
            </div>
            <span className="quick-links">Quick Links </span>
            <span className="services">Services </span>
            <span className="contact">Contact </span>
            <div className="line-5a" />
            <div className="line-5b" />
            <div className="line-5c" />
            <div className="line-5d" />
            <span className="calendar-favourites-notifications">
              Calendar
              <br />
              Favourites
              <br />
              Notifications
              <br />
              Edit Profile
              <br />
              Account
            </span>
            <span className="diet-plans-workout-plans-tracking">
              Diet Plans
              <br />
              Workout Plans
              <br />
              Tracking Activity Progress
              <br />
              Challenges
              <br />
              Recipes
            </span>
            <span className="subscribe-newsletter-latest">
              Subscribe to our newsletter for the latest updates and insights
            </span>
            <div className="sign-up">
              <div className="sign-up-5e">
                <div className="message">
                  <span className="support-email">support@gmail.com</span>
                </div>
                <button className="button-5f">
                  <div className="frame-60">
                    <span className="contact-us">Contact us</span>
                  </div>
                </button>
              </div>
              <div className="line-61" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
