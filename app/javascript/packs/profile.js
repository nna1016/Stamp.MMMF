function profile() {
  $('.profile-area').on('click', function () {
    $('.profile').toggleClass('flipped');
  });
};
profile();
document.addEventListener('turbolinks:load', () => {
    function profile() {
      $('.stamp-block').on('click', function () {
        $('.stamp-item').toggleClass('flipped');
      });
    };
    profile();
});
