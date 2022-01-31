document.addEventListener('turbolinks:load', () => {
  $(function () {
    function profile() {
      $('.stamp-block').on('click', function () {
        $('.stamp-item').toggleClass('flipped');
      });
    };
    profile();
  });
});