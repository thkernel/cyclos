/**
 * Applies a mask for hex color codes on the given field
 */
function applyHexColorMask(field) {
	var maskFields = [
	                  fieldBuilder.literal("#"),
	                  fieldBuilder.input("0123456789aAbBcCdDeEfF", 6, 6, true)
	                  ];
	return new InputMask(maskFields, field);
}

/**
 * Gets the current position of the user
 */
function locate(onSuccess, onFailure) {
	if (navigator.geolocation) {
		navigator.geolocation
				.getCurrentPosition(
						function(position) {
							onSuccess(position);							
						},
						function(error) {
							onFailure(error);
						});
	} else {
		onFailure(null);
	}
}

/**
 * Loading application
 */
var loadingInterval = null;
var delay = 150;
var containerId = 'loadingContainerBoxes';
var normalStyle = 'loadingContainerBox-normal';
var highlightStyle = 'loadingContainerBox-highlight';

/**
 * Starts loading application animation
 */
var problemsLoadingInterval;
function startLoading() {
	if (loadingInterval != null) {
		return;
	}
	var children = document.getElementById(containerId).children;
	var currentBox = 0;
	loadingInterval = setInterval(function () { 		   				
		currentBox = currentBox < children.length-1 ? currentBox += 1 : 0;		   				
		var box = children[currentBox];
		var previousBox = currentBox > 0 ? children[currentBox-1] : children[children.length-1];
		previousBox.className = normalStyle;	   					
		box.className = highlightStyle;   						   				
	}, delay);
	setProblemsLoadingVisible(false);
	problemsLoadingInterval = setTimeout(function() {
		setProblemsLoadingVisible(true);
	}, 15000);
}
/**
 * Stops loading application animation
 */
function stopLoading() {
	setProblemsLoadingVisible(false);
	clearInterval(loadingInterval);
	loadingInterval = null;
	resetLoading();
}

/**
 * Shows / hides the problems loading message
 */
function setProblemsLoadingVisible(visible) {
	getObject("problemsLoading").style.display = visible ? '' : 'none';
	if (!visible) {
		clearInterval(problemsLoadingInterval);
	}
}

/**
 * Resets loading application styles
 */
function resetLoading() {
	var children = document.getElementById(containerId).children;
	children[0].className = highlightStyle;
	for (var i = 1; i < children.length; i++) {
		var box = children[i];
		box.className = normalStyle;
	}	    		
}	
var spinnerInterval;
/**
 *	Rotates the given element 
 */
function rotate(element) {
	var property = getTransformProperty(element);
	if (property) {
		var d = 0;
		spinnerInterval = setInterval(function () { element.style[property] = 'rotate(' + ((d++ % 36)*10) + 'deg)'; }, 50);
	}	
}
/**
 * Stop rotating element
 */
function stopRotate() {
	if (spinnerInterval) {
		clearInterval(spinnerInterval);
		spinnerInterval = null;
	}
}
/**
 * Returns the correct transform property depending on the browser
 */
function getTransformProperty(element) {
    var properties = ['transform', 'WebkitTransform', 'MozTransform', 'msTransform', 'OTransform'];
    var p;
    while (p = properties.shift()) {
        if (!isUndefined(element.style[p])) {
            return p;
        }
    }
    return false;
}

/**
 * Add the correct style to make the footer sit on the bottom of the page even if the content is smaller than the viewport
 */
function doStickyFooter(layoutWrapper, footerSeparator, footerBar) {
	if (!layoutWrapper || !footerSeparator || !footerBar) {
		return;
	}
	footerBar.style.height = "";
	var height = footerBar.offsetHeight;
	layoutWrapper.style.marginBottom = -height + "px";
	footerBar.style.height = height + "px";
	footerSeparator.style.height = height + "px";
}
