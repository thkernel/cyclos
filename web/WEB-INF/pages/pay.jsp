<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<!doctype html>
<html>

<head>
<jsp:include page="root-path.jsp" flush="false" />
<script>rootPath += '/pay/';</script>
  
<meta charset="utf-8">
  
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<script>document.write('<base href="' + rootPath + '">');</script>
  
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
  
<link id="pageIcon" rel="icon" href="data:image/png;base64,iVBORw0KGgo=">
  <script>
    var apiRoot = getRootPath() + "/api";
    var dataForUi = ${dataForUi == null ? 'null' : dataForUi};
    var translations = ${translations == null ? 'null' : translations};
    var ticket = ${ticket == null ? 'null' : ticket};
    var easyInvoice = ${easyInvoice == null ? 'null' : easyInvoice};
    var error = ${error == null ? 'null' : error};

    // Returns if the device browser is Android based
    function isAndroid() {
      var ua = navigator.userAgent.toLowerCase(); return ua.indexOf("android") > -1;
    }
    // Returns if the device browser is IOS based
    function isIos() {
      var ua = navigator.userAgent.toLowerCase(); return ua.indexOf("ipad") > -1 || ua.indexOf("iphone") > -1 || ua.indexOf("ipod") > -1;
    }
    var isMobile = isAndroid() || isIos();
  </script>

<link rel="stylesheet" href="styles.5b77b8b05710b2f579cd.css">
</head>
<body>
  <app-root></app-root>

<script>includeScript("runtime.a66f828dca56eeb90e02.js");</script></script>
<script>includeScript("polyfills.d043689a58441421fd48.js");</script></script>
<script>includeScript("scripts.94b00c028c2663a5cba8.js");</script></script>
<script>includeScript("main.7c9df2a85c7be3af298b.js");</script></script>
</body>
</html>
