<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:url var="redirectUrl" value="${urlPrefix}#${item.hash}"/>

<!DOCTYPE html>
<html language="${initializationData.builtinLanguage.isoLanguage}">
    <head>
        <title>${item.title}</title>
        <meta name="owner" content="<spring:escapeBody htmlEscape="true">${license.organizationName}</spring:escapeBody>">
        <meta name="copyright" content="<spring:escapeBody htmlEscape="true">Runs on Cyclos ${cyclosVersion} (revision ${cyclosCommitId}) registered with key ${license.licenseKey}</spring:escapeBody>">
        <link rel="shortcut icon" href="${initializationData.shortcutIconUrl}">
        
        <c:if test="${not empty item.description}">
           <meta name="description" content="<spring:escapeBody htmlEscape="true">${item.description}</spring:escapeBody>">
        </c:if>
        <c:if test="${not empty lastModified}">
            <meta http-equiv="last-modified" content="${lastModified}" />
        </c:if>
        <c:if test="${not empty redirectUrl}">
            <script>
                self.location.replace("${redirectUrl}");
            </script>
        </c:if>
    </head>
    <body>
        <div class="header">${item.header}</div>
        <c:if test="${not empty item.title}">
            <h1>${item.title}</h1>
        </c:if>
        <c:if test="${not empty item.fields}">
            <c:forEach items="${item.fields}" var="field">
                <div class="field">${field.key}: ${field.value}</div>    
            </c:forEach>
            <hr>
        </c:if>
        <c:if test="${not empty item.content}">
            <div class="content">${item.content}</div>
        </c:if>
        <br>
        <div class="footer">${item.footer}</div>
    </body>
</html>
