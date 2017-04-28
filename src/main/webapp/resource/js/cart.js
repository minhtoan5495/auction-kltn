var app = angular.module('cart', ['ngRoute']);

app.config(['$qProvider', function ($qProvider) {
    $qProvider.errorOnUnhandledRejections(false);
}]);

app.controller('CartController', function ($scope, $http) {
    $scope.carts = [];
    $scope.init = function (carts) {
        $scope.carts = carts;
    }

    // localStorage.setItem("carts", $scope.carts);
    $scope.add = function (cart) {
        console.log(cart.product.imageUrl);
        cart.quantity++;
        var quantity = cart.quantity;
        $http({
            url: '/updateCart',
            type: 'GET',
            params: {
                quantity: quantity,
                productId : cart.product.productId
            }
        })
    }

    // Fire event to remove
    $scope.remove = function (cart) {
        if (cart.quantity > 0) {
            cart.quantity--;
            $http({
                url: '/updateCart',
                type: 'GET',
                params: {
                    quantity : cart.quantity,
                    productId : cart.product.productId
                }
            })
        }
    }

    // Fire event to remove
    $scope.delete = function (cart) {
        var index = -1;
        var comArr = eval( $scope.carts );
        for( var i = 0; i < comArr.length; i++ ) {
            if( comArr[i].product === cart.product ) {
                index = i;
                break;
            }
        }
        $scope.carts.splice( index, 1 );
        $http({
            url: '/removeCart',
            type: 'GET',
            params: {
                productId : cart.product.productId
            }
        })
        console.log(cart.product.productId);
    }

    $scope.getSrc = function (cart) {
        var imageBase64 = $base64.encode(unescape(encodeURIComponent(cart.product.imageUrl)));
        return imageBase64;
    }

    $scope.getTotal = function () {
        var total = 0;
        for (var i = 0; i < $scope.carts.length; i++) {
            var product = $scope.carts[i].product;
            var quantity = $scope.carts[i].quantity;
            total += (product.price * quantity);
        }
        return total;
        console.log(cart.product.imageUrl);
    }
});