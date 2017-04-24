var app = angular.module('cart', ['ngRoute']);

app.config(['$qProvider', function ($qProvider) {
    $qProvider.errorOnUnhandledRejections(false);
}]);

// app.config(['$routeProvider', function ($routeProvider) {
//     $routeProvider.when('/update',
//         {
//             templateUrl : '/views/cart',
//             controller : 'CartController'
//         }
//     ).when('/removeCart',
//         {
//             templateUrl : '/views/cart',
//             controller : 'CartController'
//         }
//     ).when('/addCart',
//         {
//             templateUrl : '/views/cart',
//             controller : 'CartController'
//         }
//     )
// }])

app.controller('CartController', function ($scope, $http) {
    $scope.carts = [];
    $scope.init = function (carts) {
        $scope.carts = carts;
    }
    // localStorage.setItem("carts", $scope.carts);
    $scope.add = function (cart) {
        cart.quantity++;
        var quantity = cart.quantity;
        // $http.post(rootUrl + '/update', quantity).then(function(response){
        //     $scope.carts = response.body;
        //     alert('success');
        // })
        // $http({
        //     url: rootUrl + '/update',
        //     method: 'POST',
        //     headers: {'Content-Type': 'application/json'},
        //     param: {
        //         quantity: JSON.stringify(quantity)
        //     }
        // }).then(function(response){
        //     $scope.carts = response.body
        //     alert('success');
        // })
        $http({
            url: 'http://localhost:8080/update',
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            dataType: "json",
            contentType: "application/json",
            param: {
                quantity: JSON.stringify(quantity)
            },
            transformRequest: angular.identity
        }).then(function(response){
            $scope.carts = response.body
            alert('success');
        })
        // $http.post('update', quantity).then(
        //     function(data) {
        //         $scope.carts = data.body;
        //         alert('success');
        //     });
    }

    // Fire event to remove
    $scope.remove = function (cart) {
        if (cart.quantity > 0) {
            cart.quantity--;
            var quantity = cart.quantity;
            // $http.post(rootUrl + '/update', quantity).then(function(response){
            //     $scope.carts = response.body;
            //     alert('success');
            // })
            $http({
                url: 'http://localhost:8080/update',
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                dataType: "json",
                contentType: "application/json",
                param: {
                    quantity: JSON.stringify(quantity)
                },
                transformRequest: angular.identity
            }).then(function(response){
                $scope.carts = response.body
                alert('success');
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
        // localStorage.setItem("carts", $scope.carts);
        // $http.post('/removeCart', "idproduct", cart.product.productId).then(function (carts) {
        //     $scope.carts = carts.body;
        // });
        $http({
            url: 'http://localhost:8080/removeCart',
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            dataType: "json",
            contentType: "application/json",
            param: {
                productId: JSON.stringify(cart.product.productId)
            },
            transformRequest: angular.identity
        }).then(function(response){
            $scope.carts = response.body
            alert('success');
        })
        console.log(rootUrl);
        // $http.post(rootUrl + '/removeCart', cart.product.productId).then(function(response){
        //     $scope.carts = response.body;
        //     alert('success');
        // })
        // $http({
        //     url: rootUrl + '/removeCart',
        //     method: 'GET',
        //     headers: {'Content-Type': 'application/json'},
        //     param: {
        //         productId: JSON.stringify(cart.product.productId)
        //     }
        // }).then(function(response){
        //     $scope.carts = response.body
        //     alert('success');
        // })
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
    $scope.isEmpty = function (obj) {
        for (var prop in obj) {
            if (obj.hasOwnProperty(prop))
                return false;
        }
        return true;
    };
});