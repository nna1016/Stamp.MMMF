document.addEventListener("turbolinks:load", function() {
  $('.profile-area').on('click', function () {
    $('.profile').toggleClass('flipped');
  });
});