import React, { useEffect, useState } from "react";
import "./Slider.css";
const Slider = () => {
  const slides = [{ id: 1 }, { id: 2 }, { id: 3 }, { id: 4 }, { id: 5 }];

  const [slideWidth, setSlideWidth] = useState(520); // width of each slide in pixels
  useEffect(() => {
    const updateSlideWidth = () => {
      if (window.innerWidth <= 768) {
        setSlideWidth(330);
      } else {
        setSlideWidth(520);
      }
    };

    // Initial check
    updateSlideWidth();

    // Add event listener for window resize
    window.addEventListener("resize", updateSlideWidth);

    // Clean up event listener on component unmount
    return () => {
      window.removeEventListener("resize", updateSlideWidth);
    };
  }, []);
  const totalSlides = slides.length;
  const [currentIndex, setCurrentIndex] = useState(0);

  const nextSlide = () => {
    setCurrentIndex((prevIndex) => {
      const newIndex = prevIndex - slideWidth;
      return newIndex <= -slideWidth * totalSlides ? 0 : newIndex;
    });
  };
  const prevSlide = () => {
    setCurrentIndex((prevIndex) => {
      const newIndex = prevIndex + slideWidth;
      return newIndex > 0 ? -slideWidth * (totalSlides - 1) : newIndex;
    });
  };

  return (
    <div>
      <div className="slider-container">
        <div
          className="slider-wrapper "
          style={{ transform: `translateX(${currentIndex}px)` }}
        >
          {slides.map((slide) => (
            <div
              key={slide.id}
              className="slider-slide position-relative"
              style={{
                backgroundImage: `url("./images/recommend.png")`,
                backgroundSize: "cover",
              }}
            >
              <button>Sport</button>
              <span>
                <i className="fa-solid fa-clock"></i> 5 Min read
              </span>
              <div className="recomend-noteText">
                <h3>How Fit Can You Get From Just Walking?</h3>
                <p>
                  walking is good for you, obviously, But can it whip you into
                  shape
                </p>
              </div>
            </div>
          ))}
        </div>
      </div>
      <div className="slider-controls d-flex justify-content-between align-items-center">
        <button className="slider-button prev" onClick={prevSlide}>
          <i className="fa-solid fa-circle-chevron-left"></i>
        </button>
        <button className="slider-button next" onClick={nextSlide}>
          <i className="fa-solid fa-circle-chevron-right"></i>
        </button>
      </div>
    </div>
  );
};
export default Slider;
