import './bootstrap.js';
/*
 * Welcome to your app's main JavaScript file!
 *
 * This file will be included onto the page via the importmap() Twig function,
 * which should already be in your base.html.twig.
 */
import './styles/app.scss'


const reviewForm = document.querySelector('form.js-form-review');

reviewForm.addEventListener('submit', (e) => {
  e.preventDefault();



  const formData = new FormData(e.target);

  const url = window.location.pathname


  axios.post(url, formData)
    .then(function (response) {
      console.log(response);
    })
    .catch(function (error) {
      console.log(error)
    });
});

