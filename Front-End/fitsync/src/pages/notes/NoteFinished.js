import React, { useContext, useEffect, useState } from "react";
import { Global } from "../../context/Global";
import { toast } from "react-toastify";
import Loading from "../../components/Loading";

const NoteFinished = ({ onPrevious, onSubmit }) => {
  const { user } = useContext(Global);

  // Loading ################################################################
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    const bgLoadingElements = document.getElementsByClassName("NoteBack");
    if (loading) {
      for (let i = 0; i < bgLoadingElements.length; i++) {
        bgLoadingElements[i].classList.add("bg-Opacity");
      }
      console.log("loading...", bgLoadingElements.length);
    } else {
      for (let i = 0; i < bgLoadingElements.length; i++) {
        bgLoadingElements[i].classList.remove("bg-Opacity");
      }
      console.log("End", bgLoadingElements.length);
    }
  }, [loading]);
  // submit ################################################################
  // let authToken;
  const handleSubmit = async () => {
    console.log("User", user);
    console.log("Token", user.authToken);
    console.log(Object.values(user.Weight)[0]);
    try {
      setLoading(true);
      const response = await fetch(
        "https://fitsync.onrender.com/api/userInfo",
        {
          method: "POST",
          headers: {
            "content-type": "application/json",
            Authorization: `Bearer ${user.authToken}`,
          },
          body: JSON.stringify({
            weight: parseInt(Object.values(user.Weight)[0]),
            height: parseInt(Object.values(user.Height)[0]),
            birthdate: user.Birth,
            gender: parseInt(user.Gender),
            activityLevel: parseInt(user.ActivityLevel),
            systolicBP: parseInt(Object.values(user.SystolicBlood)[0]),
            diastolicBP: parseInt(Object.values(user.DiastolicBlood)[0]),
            cholesterolLevel: parseInt(Object.values(user.Cholesterol)[0]),
            bloodsugar: parseInt(Object.values(user.SugarLevel)[0]),
            hypertension: Boolean(parseInt(user.Hypertension)),
            diabetes: Boolean(parseInt(user.Diabetes)),
            heartCondition: Boolean(parseInt(user.HeartDisease)),
            LowPressure: Boolean(parseInt(user.LowPressure)),
            BMR: parseInt(Object.values(user.BMR)[0]),
            kneePain: Boolean(parseInt(user.Knee)),
            backPain: Boolean(parseInt(user.Back)),
            vegetarian: Boolean(parseInt(user.Vegetarian)),
          }),
        }
      );
      if (!response.ok) {
        setLoading(false);
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      const data = await response.json();
      toast.success("Registered successfully");
      console.log("status", data.status);
      console.log("data", data);
      setLoading(false);
      window.sessionStorage.setItem("survey", true);
      onSubmit();
    } catch (err) {
      toast.error("Failed" + err.message);
    }
  };
  return (
    <div>
      {loading ? <Loading /> : null}
      <div className="NoteBack">
        <button className="Back" onClick={onPrevious}>
          <i className="fa-solid fa-angle-left"></i>
        </button>
        <h1 className="mt-4 text-center">Your plan is ready!</h1>
        <img src="./images/Finished.png" alt="Finished"></img>
        <p>
          We create a plan according to your data, activity level and interests
        </p>
        <button className="Continue" onClick={handleSubmit}>
          Continue
        </button>
      </div>
    </div>
  );
};
export default NoteFinished;
