<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html language="${initializationData.builtinLanguage.isoLanguage}">
    <head>
        <title>${initializationData.applicationName}</title>

        <meta name="owner" content="<spring:escapeBody htmlEscape="true">${license.organizationName}</spring:escapeBody>">
        <meta name="copyright" content="<spring:escapeBody htmlEscape="true">Runs on Cyclos ${cyclosVersion} (revision ${cyclosCommitId}) registered with key ${license.licenseKey}</spring:escapeBody>">

        <link id="shortcutIconLink" rel="shortcut icon" href="${initializationData.shortcutIconUrl}">
        <link id="themeCssLink" rel="stylesheet" href="${rootUrl}/content/themes/${initializationData.themeId}.css?version=${cyclosVersion}">
        
        <style>
            #licensedTo {
              background-color: #FFFFFF;
              border-top: 1px solid #CCCCCC;
              color: #333333;
              display: block;
              height: auto;
              margin-top: 40px;
              opacity: 1;
              overflow: auto;
              padding-top: 20px;
              text-align: center;
            }
        </style>                            
    </head>
    <body class="help">
    	<a name="top"></a>
        <div class="mainFull">
            <div class="mainSized layoutBar-small">
                <div class="mainContent">
                    <div class="mainCenter">
                        <div class="helpContainer">
                            ${helpContent}
                        </div>
                        <div id="licensedTo">
                            <spring:escapeBody htmlEscape="true">${licensedTo}</spring:escapeBody>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
