$(document).on('turbolinks:load ajaxSuccess', function(){
  refreshRating();
  $('.img-zoom').elevateZoom({zoomWindowPosition: 1, zoomWindowOffetx: 10});
});

var refreshRating = function() {
$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty( { path: '/assets',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
}
