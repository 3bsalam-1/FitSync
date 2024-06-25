import React from "react";

const NoteHypertension = ({ onPrevious, onNext }) => {
  return (
    <div className="NoteBack">
      <button className="Back" onClick={onPrevious}>
        <i className="fa-solid fa-angle-left"></i>
      </button>
      <h1 className="mt-4 text-center">
        We will recommend exercises and suitable healthy diet
      </h1>
      <img src="./images/boy.png" alt="boy"></img>
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
export default NoteHypertension;
