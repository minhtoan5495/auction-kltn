var app = angular.module('plunker', []);

app.controller('CartController', function($scope, $http) {

    $scope.carts = [];
    $scope.product = null;
    $scope.quantity = 0;
    $scope.total = 0;

    $scope.getData = function (page) {
        $http.get(rootUrl+'/'+page)
            .success(function (data) {
                $scope.carts = data;
            })
    }

    $http.get("/cart").then(function (response) {
        $scope.cart = response.data.records;
    })

    $scope.total = 0;

    // Catch the event to add
    $scope.$on('addProduct', function(event, data) {
        $scope.total += data;
    });

    // Catch the event to remove
    $scope.$on('removeProduct', function(event, data) {
        $scope.total -= data;
    });
});

app.controller('ProductsCtrl', function($scope, $rootScope) {
    $scope.products = [
        {
            'name': 'Product One',
            'price': 10,
            'qty': 0
        },
        {
            'name': 'Product two',
            'price': 20,
            'qty': 0
        }
    ];

    // Fire event to add
    $scope.add = function(product) {
        product.qty++;
        $rootScope.$broadcast('addProduct', product.price);
    }

    // Fire event to remove
    $scope.remove = function(product) {
        if(product.qty > 0) {
            product.qty--;
            $rootScope.$broadcast('removeProduct', product.price);
        }
    }

});