/*******************************************************************************
 * Directive Fire event on "Enter".
 ******************************************************************************/
(function() {

	'use strict';

	angular.module('directives.myenter', []).directive('myEnter', myEnter);

	/**
	 * Inject in directive.
	 */
	myEnter.$inject = [];

	/**
	 * Definition of the directive.
	 */
	function myEnter() {

		var directive = {
			restrict : 'A',
			link : linkFunc
		};

		return directive;

		// /// IMPLEMENTATION /////

		function linkFunc(scope, el, attrs, vm) {
		  
		  // Bind action on events keydown & keypress
			el.bind("keydown keypress", function(event) {
			  
			  // Apply myenter callback function
				if (event.which === 13) {
					scope.$apply(function() {
						scope.$eval(attrs.myEnter);
					});

					event.preventDefault();
				}
			});
		}

	}

})();