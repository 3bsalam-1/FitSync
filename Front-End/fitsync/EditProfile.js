import React, { useEffect, useReducer } from "react";
import "./EditProfile.css";
import Footer from "../../components/Footer";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEye } from "@fortawesome/free-solid-svg-icons";
import { faEyeSlash } from "@fortawesome/free-solid-svg-icons";
import { jwtDecode } from "jwt-decode";
const EditProfile = () => {
  const reducer = (prev, next) => ({ ...prev, ...next });

  const [{ firstName, lastName, username, userImg }, setDataUser] = useReducer(
    reducer,
    {
      firstName: "",
      lastName: "",
      username: "",
      userImg: "",
    }
  );

  useEffect(() => {
    const authToken = sessionStorage.getItem("authToken");
    const userData = authToken ? jwtDecode(authToken) : null;

    if (userData) {
      setDataUser({
        firstName: userData.firstName,
        lastName: userData.lastName,
        username: userData.username,
        userImg: userData.avatar,
      });
    } else {
      console.error("Decoded token does not contain expected user data");
    }
  }, []);

  const [
    {
      weight,
      height,
      birthdate,
      systolicBP,
      diastolicBP,
      cholesterolLevel,
      bloodsugar,
      BMR,
      vegetarian,
      hypertension,
      diabetes,
      heartCondition,
      LowPressure,
      kneePain,
      backPain,
    },
    setData,
  ] = useReducer(reducer, {
    weight: sessionStorage.getItem("weight") || "",
    height: sessionStorage.getItem("height") || "",
    birthdate: sessionStorage.getItem("birthdate")?.split("T")[0] || "",
    systolicBP: sessionStorage.getItem("systolicBP") || "",
    diastolicBP: sessionStorage.getItem("diastolicBP") || "",
    cholesterolLevel: sessionStorage.getItem("cholesterolLevel") || "",
    bloodsugar: sessionStorage.getItem("bloodsugar") || "",
    BMR: sessionStorage.getItem("BMR") || "",
    vegetarian: sessionStorage.getItem("vegetarian") || "",
    hypertension: sessionStorage.getItem("hypertension") || "",
    diabetes: sessionStorage.getItem("diabetes") || "",
    heartCondition: sessionStorage.getItem("heartCondition") || "",
    LowPressure: sessionStorage.getItem("LowPressure") || "",
    kneePain: sessionStorage.getItem("kneePain") || "",
    backPain: sessionStorage.getItem("backPain") || "",
  });
  // console.log(Boolean(-hypertension));
  const AvatarClick = () => {
    console.log("AvatarClick");
  };
  const onInputChange = (e) => {
    const inputName = e.target.name;
    const value = e.target.value;
    setState({ [inputName]: value });
    console.log(value);
  };
  const onInputChangeData = (e) => {
    const inputName = e.target.name;
    const value = e.target.value;
    setData({ [inputName]: value });
    console.log(value);
  };
  const onInputChangeDatauser = (e) => {
    const inputName = e.target.name;
    const value = e.target.value;
    setDataUser({ [inputName]: value });
    console.log(value);
  };
  const Checkbox = (e) => {
    console.log(e);
  };
  const submit = (e) => {
    e.preventDefault();
    console.log("finshed");
  };
  // showPassword ################################################################
  const [{ oldPassword, password, passwordConfirm }, setState] = useReducer(
    reducer,
    {
      oldPassword: "",
      password: "",
      passwordConfirm: "",
    }
  );
  const [
    {
      showOldPassword,
      showPassword1,
      showPassword2,
      typeOldPassword,
      typePassword1,
      typePassword2,
    },
    setShowPassword,
  ] = useReducer(reducer, {
    showOldPassword: false,
    showPassword1: false,
    showPassword2: false,
    typePassword1: "password",
    typePassword2: "password",
    typeOldPassword: "password",
  });
  useEffect(() => {
    setShowPassword({
      typePassword1: showPassword1 ? "text" : "password",
      typePassword2: showPassword2 ? "text" : "password",
      typeOldPassword: showOldPassword ? "text" : "password",
    });
  }, [showOldPassword, showPassword1, showPassword2]);

  const togglePasswordVisibility = () => {
    setShowPassword({ showOldPassword: !showOldPassword });
  };
  const togglePasswordVisibility1 = () => {
    setShowPassword({ showPassword1: !showPassword1 });
  };
  const togglePasswordVisibility2 = () => {
    setShowPassword({ showPassword2: !showPassword2 });
  };
  return (
    <div className="EditProfile">
      <div className="container">
        <div className="dashboard-nav">
          <div className="heading">
            <span className="good-morning">Good Morning</span>
            <span className="dashboard-settings">Settings</span>
          </div>
          <div className="frame">
            <div className="notifications">
              <div className="bell" />
            </div>
            <img src={userImg} alt="avater" className="ellipse" />
          </div>
        </div>
        <div className="contents mt-5 mb-5">
          <div className="instructor-profile">
            <div className="account-settings mb-5">
              <form onSubmit={submit}>
                <div className="frame-2">
                  <div className="frame-3 me-3">
                    <span className="account-settings-text">
                      Account Settings
                    </span>
                    <div className="d-flex flex-column justify-content-start">
                      <label>User Name</label>
                      <input
                        type="text"
                        name="username"
                        onChange={onInputChangeDatauser}
                        placeholder={username}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>Frist Name</label>
                      <input
                        type="text"
                        name="fristname"
                        onChange={onInputChangeDatauser}
                        placeholder={firstName}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>Last Name</label>
                      <input
                        type="text"
                        name="lastname"
                        onChange={onInputChangeDatauser}
                        placeholder={lastName}
                        required
                      />
                    </div>
                  </div>
                  <div className="avatar">
                    <div className="profile-photo">
                      <img src={userImg} alt="avater" className="image" />
                      <div className="btn" onClick={AvatarClick}>
                        <div className="upload-simple">
                          <div className="upload-simple-d" />
                        </div>
                        <span className="upload-photo">Upload Photo</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div className="row align-items-center mt-4">
                  <div className="col">
                    <div>
                      <input
                        type="checkbox"
                        onChange={() => Checkbox("hypertension")}
                        checked={Boolean(-hypertension)}
                      ></input>
                      <label>hypertension</label>
                    </div>
                    <div>
                      <input
                        type="checkbox"
                        onChange={() => Checkbox("diabetes")}
                        checked={Boolean(-diabetes)}
                      ></input>
                      <label>diabetes</label>
                    </div>
                    <div>
                      <input
                        type="checkbox"
                        onChange={() => Checkbox("heartCondition")}
                        checked={Boolean(-heartCondition)}
                      ></input>
                      <label>heartCondition</label>
                    </div>
                    <div>
                      <input
                        type="checkbox"
                        onChange={() => Checkbox("LowPressure")}
                        checked={Boolean(-LowPressure)}
                      ></input>
                      <label>LowPressure</label>
                    </div>
                    <div>
                      <input
                        type="checkbox"
                        onChange={() => Checkbox("kneePain")}
                        checked={Boolean(-kneePain)}
                      ></input>
                      <label>kneePain</label>
                    </div>
                    <div>
                      <input
                        type="checkbox"
                        onChange={() => Checkbox("backPain")}
                        checked={Boolean(-backPain)}
                      ></input>
                      <label>backPain</label>
                    </div>
                    <div>
                      <input
                        type="checkbox"
                        onChange={() => Checkbox("vegetarian")}
                        checked={Boolean(-vegetarian)}
                      ></input>
                      <label>vegetarian</label>
                    </div>
                  </div>
                  <div className="col">
                    <div className="d-flex flex-column justify-content-start">
                      <label>weight</label>
                      <input
                        type="number"
                        name="weight"
                        onChange={onInputChangeData}
                        placeholder={weight}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>height</label>
                      <input
                        type="number"
                        name="height"
                        onChange={onInputChangeData}
                        placeholder={height}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>Birth date</label>
                      <input
                        type="text"
                        name="birthdate"
                        onChange={onInputChangeData}
                        placeholder={birthdate}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>systolicBP</label>
                      <input
                        type="number"
                        name="systolicBP"
                        onChange={onInputChangeData}
                        placeholder={systolicBP}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>diastolicBP</label>
                      <input
                        type="number"
                        name="diastolicBP"
                        onChange={onInputChangeData}
                        placeholder={diastolicBP}
                        required
                      />
                    </div>
                  </div>
                  <div className="col">
                    <div className="d-flex flex-column justify-content-start">
                      <label>cholesterolLevel</label>
                      <input
                        type="number"
                        name="cholesterolLevel"
                        onChange={onInputChangeData}
                        placeholder={cholesterolLevel}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>bloodsugare</label>
                      <input
                        type="number"
                        name="bloodsugar"
                        onChange={onInputChangeData}
                        placeholder={bloodsugar}
                        required
                      />
                    </div>
                    <div className="d-flex flex-column justify-content-start">
                      <label>BMR</label>
                      <input
                        type="number"
                        name="BMR"
                        onChange={onInputChangeData}
                        placeholder={BMR}
                        required
                      />
                    </div>
                  </div>
                </div>
                <input type="submit" value={"Save change "} />
              </form>
            </div>
          </div>
          <div className="notification-change-password flex-wrap">
            <div className="notifications-18">
              <span className="notifications-19">Notifications</span>
              <form>
                <div className="mb-3">
                  <input
                    type="checkbox"
                    onChange={() => Checkbox("hypertension")}
                  ></input>
                  <label>I want to know The daily updates</label>
                </div>
                <div className="mb-3">
                  <input
                    type="checkbox"
                    onChange={() => Checkbox("hypertension")}
                  ></input>
                  <label>I want to know the daily plans</label>
                </div>
                <div className="mb-3">
                  <input
                    type="checkbox"
                    onChange={() => Checkbox("hypertension")}
                  ></input>
                  <label>I want to know the daily challenges</label>
                </div>
                <div className="mb-3">
                  <input
                    type="checkbox"
                    onChange={() => Checkbox("hypertension")}
                  ></input>
                  <label>I want to know the daily calories</label>
                </div>
                <div className="mb-3">
                  <input
                    type="checkbox"
                    onChange={() => Checkbox("hypertension")}
                  ></input>
                  <label>I want to know the daily steps</label>
                </div>
                <div className="mb-3">
                  <input
                    type="checkbox"
                    onChange={() => Checkbox("hypertension")}
                  ></input>
                  <label>I want to know the daily water</label>
                </div>
                <div className="mb-3">
                  <input
                    type="checkbox"
                    onChange={() => Checkbox("hypertension")}
                  ></input>
                  <label>I want to know the upcoming reminders</label>
                </div>
                <input type="submit" value={"Save change "} />
              </form>
            </div>
            <div className="change-password">
              <span className="change-password-35">Change password</span>
              <form>
                <div className="password position-relative">
                  <img src="./images/Lock.png" alt="Lock" />
                  <input
                    type={typeOldPassword}
                    name="oldPassword"
                    onChange={onInputChange}
                    value={oldPassword}
                    placeholder="Old Password"
                    minLength={8}
                    required
                  />
                  <button type="button" onClick={togglePasswordVisibility}>
                    {showOldPassword ? (
                      <FontAwesomeIcon icon={faEye} />
                    ) : (
                      <FontAwesomeIcon icon={faEyeSlash} />
                    )}
                  </button>
                </div>
                <div className="password position-relative">
                  <img src="./images/Lock.png" alt="Lock" />
                  <input
                    type={typePassword1}
                    name="password"
                    onChange={onInputChange}
                    value={password}
                    placeholder="New Password"
                    minLength={8}
                    required
                  />
                  <button type="button" onClick={togglePasswordVisibility1}>
                    {showPassword1 ? (
                      <FontAwesomeIcon icon={faEye} />
                    ) : (
                      <FontAwesomeIcon icon={faEyeSlash} />
                    )}
                  </button>
                </div>
                <div className="password position-relative">
                  <img src="./images/Lock.png" alt="Lock" />
                  <input
                    type={typePassword2}
                    name="passwordConfirm"
                    onChange={onInputChange}
                    value={passwordConfirm}
                    placeholder="Confirm Password"
                    minLength={8}
                    required
                  />
                  <button type="button" onClick={togglePasswordVisibility2}>
                    {showPassword2 ? (
                      <FontAwesomeIcon icon={faEye} />
                    ) : (
                      <FontAwesomeIcon icon={faEyeSlash} />
                    )}
                  </button>
                </div>
                <input type="submit" value={"Save change "} />
              </form>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};
export default EditProfile;
