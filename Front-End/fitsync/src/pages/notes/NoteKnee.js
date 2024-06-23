import React from "react";

const NoteKnee = ({ onPrevious, onNext }) => {
  return (
    <div className="NoteBack">
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-4 text-center">
        We will restrict exercises that are hard on your <span>Knee</span>
      </h1>
      <img src="./images/girl.png" alt="girl"></img>
      <p>
        You can always change this setting later please consult your physician
        or other health care professional when in doubt
      </p>
      <button className="Continue" onClick={() => onNext()}>
        Continue
      </button>
    </div>
  );
};
export default NoteKnee;
