angular.module("main", ["ngResource"])
	.controller("index", ["$scope", "$resource",
		function($scope, $resource) {
			var res = $resource("/tickets/");

			$scope.getTickets = function() {
				$scope.tickets = res.query();
			};
		}
	]);