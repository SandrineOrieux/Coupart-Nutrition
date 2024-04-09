import errorMessage from "./errorMessage";

export default function ReviewForm() {
  const reviewForm = document.querySelector('form.js-form-review');

  reviewForm.addEventListener('submit', (e) => {
    e.preventDefault();

    const formData = new FormData(e.target);

    const url = window.location.pathname


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
          .catch(() => {
            reviewForm.innerHTML = errorMessage()
          })
      })
      .catch(function () {

        reviewForm.innerHTML = errorMessage()
      })

    const urlAverage = url + '/averageRate';
  });
}
