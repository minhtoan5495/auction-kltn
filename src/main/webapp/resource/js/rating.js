/**
 * Created by toannguyen on 18/04/2017.
 */
/**
 * Demo in action!
 */
(function () {
    'use strict';
    // Rating ELEMENT
    var ratingStars = document.querySelector('#ratingStars');
    // DUMMY DATA
    var data = [
        {
            rating: 3
        }
    ];
    // INITIALIZE
    (function init() {
        for (var i = 0; i < data.length; i++) {
            addRatingWidget(buildRatingItem(data[i]), data[i]);
        }
    })();

    // BUILD SHOP ITEM
    function buildRatingItem() {
        var ratingItem = document.createElement('div');
        var html =
            '<div class="c-rating-item__details">' +
            '<ul class="c-rating"></ul>' +
            '</div>';
        ratingItem.classList.add('c-rating-item');
        ratingItem.innerHTML = html;
        ratingStars.appendChild(ratingItem);
        return ratingItem;
    }
    // ADD RATING WIDGET
    function addRatingWidget(ratingItem, data) {
        var ratingElement = ratingItem.querySelector('.c-rating');
        var currentRating = data.rating;
        var maxRating = 5;
        var callback = function (rating) {
            $("#ratingInput").val(rating);
        };
        rating(ratingElement, currentRating, maxRating, callback);
    }
})();