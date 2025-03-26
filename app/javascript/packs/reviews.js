document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.show_star').forEach(function(elem) {
    var reviewId = elem.getAttribute('data-review-id');
    var score = parseFloat(elem.getAttribute('data-score')) || 0;

    $(elem).raty({
      starOn: "/assets/raty/star-on.png",
      starOff: "/assets/raty/star-off.png",
      starHalf: "/assets/raty/star-half.png",
      readOnly: true,
      score: score
    });
  });
});