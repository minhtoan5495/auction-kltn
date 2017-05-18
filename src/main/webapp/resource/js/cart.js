var app = angular.module('cart', ['ngRoute']);

app.config(['$qProvider', function ($qProvider) {
    $qProvider.errorOnUnhandledRejections(false);
}]);

app.controller('CartController', function ($scope, $http) {

    $scope.carts = [];
    $scope.length = 0;
    $scope.init = function (carts) {
        $scope.carts = carts;
        $scope.length = carts.length;
    }

    $scope.add = function (cart) {
        if (cart.quantity < 10 && cart.quantity < cart.product.stockQuantity) {
            cart.quantity++;
            var quantity = cart.quantity;
            $http({
                url: '/updateCart',
                type: 'GET',
                params: {
                    quantity: quantity,
                    productId: cart.product.productId
                }
            })
        }
    }

    // Fire event to remove
    $scope.remove = function (cart) {
        if (cart.quantity > 1) {
            cart.quantity--;
            $http({
                url: '/updateCart',
                type: 'GET',
                params: {
                    quantity: cart.quantity,
                    productId: cart.product.productId
                }
            })
        }
    }

    // Fire event to remove
    $scope.delete = function (cart) {
        var index = -1;
        var comArr = eval($scope.carts);
        for (var i = 0; i < comArr.length; i++) {
            if (comArr[i].product === cart.product) {
                index = i;
                break;
            }
        }
        $scope.carts.splice(index, 1);
        $scope.length--;
        $http({
            url: '/removeCart',
            type: 'GET',
            params: {
                productId: cart.product.productId
            }
        })
    }

    $scope.getTotal = function () {
        var total = 0;
        for (var i = 0; i < $scope.carts.length; i++) {
            var product = $scope.carts[i].product;
            var quantity = $scope.carts[i].quantity;
            total += (product.price * quantity);
        }
        return total;
    }
});