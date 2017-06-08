angular.module("main", ["ngResource"])
	.filter("reais", function() {
		return function(input) {
			return input ? "R$ " + parseFloat(input).toFixed(2) : "";
		};
	})
	.controller("index", ["$scope", "$resource",
		function($scope, $resource) {
			var res = $resource("/tickets/");

			$scope.getTickets = function() {
				$scope.tickets = res.query();
			};
		}
	]);