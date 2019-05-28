<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html language="en">
    <head>
        <title>${info.applicationName}</title>
       	<style>
       		body {
				font-family: Arial, helvetica, sans-serif;
			    font-size: 10pt;
       		}
       		h1 {
       			font-size: 1.5em;
       			font-weight: bold;
       		}
       		.description {
       			font-style: italic;
       		}
       	</style>
    </head>
    <body>
        <h1>${info.applicationName}</h1>
		<c:if test="${not empty info.applicationDescription}">
			<div class="description">${info.applicationDescription}</div>
		</c:if>
		<div>URL: <a href="${info.url}">${info.url}</a></div>
		<div>Network: ${empty info.networkName ? 'Global' : info.networkName}</div>
		<div>Language: ${language}</div>
		<div>Country: ${country}</div>
    </body>
</html>
