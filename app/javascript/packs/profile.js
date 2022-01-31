$(function () {
  function profile() {
    $('.stamp-block').on('click', function () {
      $('.stamp-item').toggleClass('flipped');
    });
  };
  profile();
});