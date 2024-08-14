import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-new"
export default class extends Controller {

  fire(){
    console.log("hello")
  }
}

// // JavaScript to handle button selection
// document.addEventListener('DOMContentLoaded', function() {
//   // Select all buttons within .preference-buttons and .days-buttons
//   const preferenceButtons = document.querySelectorAll('.preference-buttons button');
//   const daysButtons = document.querySelectorAll('.days-buttons button');

//   // Function to toggle the selected state
//   function toggleSelected() {
//     this.classList.toggle('selected');
//   }

//   // Add event listeners to preference buttons
//   preferenceButtons.forEach(button => {
//     button.addEventListener('click', toggleSelected);
//   });

//   // Add event listeners to days buttons
//   daysButtons.forEach(button => {
//     button.addEventListener('click', toggleSelected);
//   });
// });
