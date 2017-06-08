angular.module("main", ["ngResource"])
	.filter("reais", function() {
		return function(input) {
			return input ? "R$ " + parseFloat(input).toFixed(2) : "";
		};
	})
	.controller("index", ["$scope", "$resource",
		function($scope, $resource) {
			var res = $resource("/tickets/");

			$scope.types = [
				{name: "Somente Passagem", value: "ticket"}
			];

			$scope.orders = [
				{name: "Nada", value: "none"},
				{name: "Preço crescente", value: "price-asc"},
				{name: "Preço decrescente", value: "price-desc"},
				{name: "Data mais próxima", value: "departure_date-asc"},
				{name: "Data mais distante", value: "departure_date-desc"},
				{name: "Companhia em ordem alfabética", value: "company-asc"},
				{name: "Companhia em ordem alfabética-invertida", value: "company-desc"}
			];

			$scope.form = {type: $scope.types[0].value, order: $scope.orders[0].value};

			$scope.getTickets = function() {
				var from = $scope.form.from;
				var to = $scope.form.to;
				var orderTemp = $scope.form.order;
				var order = "";
				var order_type = "";

				if (orderTemp && orderTemp != "" && orderTemp != "none") {
					var arr = orderTemp.split('-');
					order = arr[0];
					order_type = arr[1];
				}

				console.log('From: "' + from + '", To: "' + to + '", OrderTemp: "' + orderTemp + '", Order: "' + order + '", Order_type: "' + order_type + '".');

				$scope.tickets = res.query({from: from, to: to, order: order, order_type: order_type});
			};
		}
	]);