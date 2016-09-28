/*******************************************************************************
 * Directive Auto focus on input field.
 ******************************************************************************/
(function() {

	'use strict';

	angular.module('directives.autofocus', []).directive('autofocus', autofocus);

	/**
	 * Inject in directive.
	 */
	autofocus.$inject = [ '$timeout' ];

	/**
	 * Definition of the directive.
	 */
	function autofocus($timeout) {

		var directive = {
			restrict : 'A',
			link : linkFunc
		};

		return directive;

		// /// IMPLEMENTATION /////

		function linkFunc(scope, el, attrs, vm) {
			var dom = el[0];
			
  			// if a value name is defined with autofocus attribute, we listen on its value
			if (attrs.autofocus) {
				scope.$watch(attrs.autofocus, focus);
			} else {
				focus(true);
			}
			
			function focus(condition) {
			  // If condition is true, we fire focus on element DOM with a delay
				if (condition) {
					$timeout(function() {
						dom.focus();
					}, scope.$eval(attrs.focusDelay) || 250);
				}
			}
		}

	}

})();