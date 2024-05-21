import './bootstrap.js';
import './styles/app.scss'

// app.js

const $ = require('jquery');
// this "modifies" the jquery module: adding behavior to it
// the bootstrap module doesn't export/return anything
require('bootstrap');


$(document).ready(function () {
  $('[data-toggle="popover"]').popover();
});

const reviewForm = document.querySelector('form.js-form-review');

reviewForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const formData = new FormData(e.target);
  const url = window.location.pathname;
  axios.post(url, formData)
    .then(function () {
      reviewForm.innerHTML = "<p>Votre évaluation a bien été prise en compte : la note moyenne a été mis à jours, votre commentaire apparaîtra aprés validation d'un administrateur.</p>"
      //take average rate update
      axios.get(urlAverage)
        .then((response) => {
          //if success display the average rate in html
          let averageRate = document.querySelector('span.js-average-rate')
          averageRate.innerHTML = response.data['average']
        })
        .catch((error) => {
          console.log(error)
        })
    })
    .catch(function (error) {
      console.log(error)
    })
  const urlAverage = url + '/averageRate';
});

