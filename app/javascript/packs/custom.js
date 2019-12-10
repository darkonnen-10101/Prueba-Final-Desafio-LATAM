var inputField = document.querySelectorAll("input"),
    textField = document.querySelectorAll("textarea"),
    selectField = document.querySelectorAll("select"),
    inputWrapper = document.querySelectorAll(".input-wrapper"),
    modal = document.querySelector(".modal1"),
    daily = document.querySelector(".daily");

////////////////
// Events
////////////////


// Event to Anime Input
inputField.forEach(function(el) {
   el.addEventListener("focus", animeInput);
   el.addEventListener("focusout", removeAnimeInput);
});

textField.forEach(function(el) {
   el.addEventListener("focus", animeInput);
   el.addEventListener("focusout", removeAnimeInput);
});

selectField.forEach(function(el) {
   el.addEventListener("focus", animeInput);
   el.addEventListener("focusout", removeAnimeInput);
});




////////////////
// Functions
////////////////

// To Open Modal
function openModal() {
   modal.classList.add("open");
}
// To Close Modal
function closeModal() {
   modal.classList.add("close");

   setTimeout(function() {

      modal.classList.remove("open");
      modal.classList.remove("close");
   }, 1500);
}

// To anime input
function animeInput(event) {
   event.target.closest(".input-wrapper").classList.add("active");
}
function removeAnimeInput(event) {
   if (event.target.value == "") {
      event.target.closest(".input-wrapper").classList.remove("active");
   }
}
