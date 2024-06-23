// App,js
let docTitle = document.title;
useEffect(() => {
  window.addEventListener("blur", () => {
    document.title = "Come back Baby 😘";
  });
  window.addEventListener("focus", () => {
    document.title = docTitle;
  });
}, [docTitle]);
// #############################################################
{
  /* Start Footer   ###############################################    */
}
<footer className="footer pt-5 pb-5 text-white ">
  <div className="container	">
    <div className="row">
      <div className="col-md-6 col-lg-6">
        <div className="logo d-flex align-items-center">
          <img src="./images/logo.png" alt="logo"></img>
          <p>
            Fit<span>s</span>ync
          </p>
        </div>
        <p>Find your healthy, and your happy</p>
        <button className="btn btn-lg rounded-pill bg-white d-flex justify-content-center align-items-center">
          <span className="me-3 text-capitalize">start today</span>
          <i className="fa-solid fa-angle-right"></i>
        </button>
      </div>
      <div className="col-md-6 col-lg-2">
        <div className="links">
          <h5>Products</h5>
          <ul className="list-unstyled lh-lg">
            <li>Food</li>
            <li className="text-pt-pb-il">Workout</li>
            <li>Activity</li>
          </ul>
        </div>
      </div>
      <div className="col-md-6 col-lg-2">
        <div className="links">
          <h5>Resources</h5>
          <ul className="list-unstyled lh-lg">
            <li>Community </li>
            <li className="text-pt-pb-il">Contact Us</li>
            <li>Support Center</li>
          </ul>
        </div>
      </div>
      <div className="col-md-6 col-lg-2">
        <div className="links">
          <h5>Social</h5>
          <ul className="list-unstyled lh-lg">
            <li>Facebook</li>
            <li className="text-pt-pb-il">Twitter</li>
            <li>Instagram</li>
          </ul>
        </div>
      </div>
    </div>

    <p>&copy; Copyright 2024 Fitsync All Rights Reserved</p>
  </div>
</footer>;
{
  /* End Footer   ###############################################    */
}
{
  /* <Link
                className="nav-link dropdown-toggle"
                to="/"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                My Fitness
              </Link> */
}
<ul>
  <li className="mb-4">
    <Link>
      <img src="./images/Calendar.png" alt="Calender"></img>
      Calender
    </Link>
  </li>
  <li className="mb-4">
    <Link className="dropdown-item">
      <img src="./images/Favourites.png" alt="Favourites"></img>
      Favourites
    </Link>
  </li>
  <li className="mb-4">
    <Link className="dropdown-item">
      <img src="./images/Notifications.png" alt="Notifications"></img>
      Notifications
    </Link>
  </li>
  <li className="mb-4">
    <Link className="dropdown-item">
      <img src="./images/Profile.png" alt="Edit"></img>
      Edit Profile
    </Link>
  </li>
  <li className="mb-4">
    <Link className="dropdown-item">
      <img src="./images/Account.png" alt="Account"></img>
      Account
    </Link>
  </li>
  <li>
    <Link className="dropdown-item">
      <img src="./images/Out.png" alt="Out"></img>
      Log Out
    </Link>
  </li>
</ul>;
// ###########################################
{
  /* <div className="gallery d-flex align-items-center flex-row">
          <div class="gallery-container d-flex align-items-center position-relative">
            <div class="gallery-item gallery-item-1" data-index="1"></div>
            <div class="gallery-item gallery-item-2" data-index="2"></div>
            <div class="gallery-item gallery-item-3" data-index="3"></div>
            <div class="gallery-item gallery-item-4" data-index="4"></div>
            <div class="gallery-item gallery-item-5" data-index="5"></div>
          </div>
          <div class="gallery-controls"></div>
        </div> */
}
