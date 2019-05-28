<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html language="${initializationData.builtinLanguage.isoLanguage}">
    <head>
        <title>${initializationData.applicationName}</title>

        <c:if test="${not empty initializationData.applicationDescription}">
           <meta name="description" content="<spring:escapeBody htmlEscape="true">${initializationData.applicationDescription}</spring:escapeBody>">
        </c:if>

        <meta name="owner" content="<spring:escapeBody htmlEscape="true">${license.organizationName}</spring:escapeBody>">
        <meta name="copyright" content="<spring:escapeBody htmlEscape="true">Runs on Cyclos ${cyclosVersion} (revision ${cyclosCommitId}) registered with key ${license.licenseKey}</spring:escapeBody>">
        
        <link id="shortcutIconLink" rel="shortcut icon" href="${initializationData.shortcutIconUrl}">
        <jsp:include page="basicStyle.html" flush="false" />
        <jsp:include page="root-path.jsp" flush="false" />
        <script>
            var cyclosVersion = "${cyclosVersion}";
            var configurationId = "${initializationData.configurationId}";            
            var languageId = "${initializationData.languageId}";
            var languageLastModified = "${initializationData.languageLastModified}";
            var themeId = "${initializationData.themeId}";
            var themeLastModified = "${initializationData.themeLastModified}";
            var pushNotificationsClientId = "${pushNotificationsClientId}";
            var countries = "<spring:escapeBody javaScriptEscape='true'>${countries}</spring:escapeBody>";
            var resourceCacheKey = "${resourceCacheKey}";
            <c:choose><c:when test="${not empty notificationMessage}">
                <c:set var="notificationMessageJS"><spring:escapeBody javaScriptEscape="true">${notificationMessage}</spring:escapeBody></c:set>
                var notificationLevel = "${notificationLevel}";
                var notificationMessage = "${notificationMessageJS}";
                var notificationOnly = "${notificationOnly}";
            </c:when><c:otherwise>
                var notificationLevel = null;
                var notificationMessage = null;
                var notificationOnly = false; 
                if (localStorage) {
                	notificationLevel = localStorage.notificationLevel;
                	notificationMessage = localStorage.notificationMessage;
                	delete localStorage.notificationLevel;
                	delete localStorage.notificationMessage;
                }
            </c:otherwise></c:choose>

            // IE < 10 doesn't support native Base64 methods
            if (typeof(window.atob) === "undefined") {
                var sc = document.createElement("script");
                sc.src = rootPath + "/js/base64.js";
                sc.onload = function() {
                    window.btoa = Base64.encode;
                    window.atob = Base64.decode;
                }                
                document.head.appendChild(sc);
            }
            // IE doesn't support EventSource
            if (typeof(window.EventSource) === "undefined") {
                var sc = document.createElement("script");
                sc.src = rootPath + "/js/eventsource.js";
                document.head.appendChild(sc);
            }
            
            <%--
            Use the uncompressed scripts for debugging only. In production, include only the script.min.js
            --%>
            <%--
            includeScript("/js/cssua.js");
            includeScript("/js/JavaScriptUtil.js");
            includeScript("/js/Parsers.js");
            includeScript("/js/InputMask.js");
            includeScript("/js/he.js");
            includeScript("/js/file-download.js");
            includeScript("/js/cyclos.js");
            --%>
            <%--Not included in script.min because it fails in the minifying process--%>
            includeScript("/js/load-image.all.min.js"); 
            includeScript("/js/script.min.js");
        </script>
    </head>
    <body class="main">
        <iframe src="javascript:''" id="__gwt_historyFrame" style="width:0;height:0;border:0;position:absolute;"></iframe>
        <div id="loadingContainer">
            <div class="loadingContainerWrapper"> 
                <div id="problemsLoading" style="display:none"><div>${problemsLoading}</div></div>
				<div class="loadingContainerText">${loadingApplication}</div>
				<div id="loadingContainerBoxes">
				    <div class="loadingContainerBox-highlight"></div>
				    <div class="loadingContainerBox-normal"></div>
				    <div class="loadingContainerBox-normal"></div>
				    <div class="loadingContainerBox-normal"></div>
				    <div class="loadingContainerBox-normal"></div>
				    <div class="loadingContainerBox-normal"></div>
				    <div class="loadingContainerBox-normal"></div>
                </div>
            </div>    
        </div>
        <c:set var="browserNotSupportedJS"><spring:escapeBody javaScriptEscape="true">${browserNotSupported}</spring:escapeBody></c:set>
        <script>
            if (cssua.ua.ie >= 8.0 || cssua.ua.webkit || cssua.ua.firefox >= 10.0) {
                startLoading();
                includeScript("/cyclos.gwt/cyclos.gwt.nocache.js", true);
            } else {
                document.body.innerHTML = "<div id='browserNotSupported'><div id='browserNotSupportedFrame'>${browserNotSupportedJS}</div></div>";
            }
        </script>
        <noscript>
            <div id='browserNotSupported'><div id='browserNotSupportedFrame'>${browserNotSupported}</div></div>
        </noscript>
    </body>
</html>
