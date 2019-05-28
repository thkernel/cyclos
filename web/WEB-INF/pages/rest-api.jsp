<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html language="en">
<head>
    <title>Cyclos ${cyclosVersion} REST API</title>
    <jsp:include page="root-path.jsp" flush="false" />

    <link id="shortcutIconLink" rel="shortcut icon" href="${initializationData.shortcutIconUrl}">
    <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css' />

    <script>
        var swaggerRoot = "/js/swagger-ui";
        includeStyle(swaggerRoot + "/css/reset.css", "screen");
        includeStyle(swaggerRoot + "/css/screen.css", "screen");
        includeStyle(swaggerRoot + "/css/reset.css", "print");
        includeStyle(swaggerRoot + "/css/print.css", "print");
        includeStyle(swaggerRoot + "/css/style.css", "screen");
        
	    includeScript(swaggerRoot + "/lib/jquery-1.8.0.min.js");
	    includeScript(swaggerRoot + "/lib/jquery.slideto.min.js");
	    includeScript(swaggerRoot + "/lib/jquery.wiggle.min.js");
	    includeScript(swaggerRoot + "/lib/jquery.ba-bbq.min.js");
	    includeScript(swaggerRoot + "/lib/handlebars-2.0.0.js");
	    includeScript(swaggerRoot + "/lib/underscore-min.js");
	    includeScript(swaggerRoot + "/lib/backbone-min.js");
	    includeScript(swaggerRoot + "/swagger-ui.min.js");
	    includeScript(swaggerRoot + "/lib/highlight.7.3.pack.js");
	    includeScript(swaggerRoot + "/lib/jsoneditor.min.js");
	    includeScript(swaggerRoot + "/lib/marked.js");
	    
	    function fetchLanguages() {
	    	var xhr = new XMLHttpRequest();
	    	xhr.open("GET", "https://generator.swagger.io/api/gen/clients");
	    	xhr.setRequestHeader("Accept", "application/json");
	    	xhr.onreadystatechange = function () {
	    	    if(xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
	    	        var languages = JSON.parse(xhr.responseText);
	    	    	var lang = $('#lang');
	    	    	lang.empty().append($("<option value=''>Please, select...</option>"));
	    	    	$.each(languages, function(ix, l) {
	    	    	    lang.append($('<option></option>').attr('value', l).text(l));
	    	    	});
	    	    	$('#generate').disabled = false;
	    	    }
	    	};
	    	xhr.send();
	    }
	    
	    function initGenerator() {
	    	$('#generate').click(function() {
	    		$('#generate').prop('disabled', true);
	            var lang = $('#lang').val();
	            $('#lang').prop('selectedIndex', 0);
	    		$('#downloadContainer').html("Generating client for " + lang + "...");
	            var xhr = new XMLHttpRequest();
	            if (lang == null || lang === '') {
	            	return;
	            }
	            var body = {
	            	swaggerUrl: "<spring:escapeBody javaScriptEscape='true'>${swaggerDescriptor}</spring:escapeBody>"
	            };
	            xhr.open("POST", "https://generator.swagger.io/api/gen/clients/" + lang);
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	            xhr.onreadystatechange = function () {
	                if(xhr.readyState === XMLHttpRequest.DONE) {
	                	if (xhr.status === 200) {
		                    var resp = JSON.parse(xhr.responseText);
		                    $('#downloadContainer').html("The generated code is ready: <a href='" + resp.link + "'>" + resp.link + "</a>");
	                	} else {
	                		$('#downloadContainer').html("There was an error while generating the code: <pre>" + xhr.responseText + "</pre>");
	                	}
	                }
	            };
	            xhr.send(JSON.stringify(body));
	    	});
	    	$('#lang').change(function() {
	    		var lang = $('#lang').val();
	    		$('#generate').prop('disabled', lang == '');
	    	});
	    }
	    
	    function initialize() {
	        $(function () {
	        	
	        	fetchLanguages();
	        	initGenerator();
	        	
		        window.swaggerUi = new SwaggerUi({
		            url: "${swaggerDescriptor}",
		            dom_id: "swagger-ui-container",
		            supportedSubmitMethods: ['get', 'post', 'put', 'delete', 'patch'],
		            onComplete: function(swaggerApi, swaggerUi){
		                $('pre code').each(function(i, e) {
		                    hljs.highlightBlock(e)
		                });
		                applyAuth();
		            },
		            onFailure: function(data) {
		              log("Unable to Load SwaggerUI");
		            },
		            docExpansion: "none",
		            jsonEditor: false,
		            apisSorter: "alpha",
		            validatorUrl: null
		        });
		        
		        function applyAuth() {
		            var type = $('input[name="authType"]:checked').val() || 'guest';
		            var clientAuths = window.swaggerUi.api.clientAuthorizations;
		            clientAuths.remove("basic");
		            clientAuths.remove("session");
		            clientAuths.remove("accessClient");
		            $("#auth-fields")[type == 'guest' ? 'hide' : 'show']();
		            $(".auth").hide();
		            $(".auth_" + type).show();
		            
		            switch (type) {
		                case 'basic':
		                    var user = ($('#input_user').val() || '').trim();
		                    var password = ($('#input_password').val() || '').trim();
		                    if (user && password) {
		                        var auth = "Basic " + btoa(user + ":" + password);
		                        clientAuths.add("basic", new SwaggerClient.ApiKeyAuthorization("Authorization", auth, "header"));
		                        log("Using basic auth for " + user);
		                    } 
		                    break;
		                case 'session':
		                    var token = ($('#input_sessionToken').val() || '').trim();
		                    if (token) {
		                        var apiKeyAuth = new SwaggerClient.ApiKeyAuthorization("Session-Token", token, "header");
		                        clientAuths.add("session", apiKeyAuth);
		                        log("Using session token " + token);
		                    }
		                    break;
		                case 'accessClient':
		                    var token = ($('#input_accessClientToken').val() || '').trim();
		                    if (token) {
		                        var apiKeyAuth = new SwaggerClient.ApiKeyAuthorization("Access-Client-Token", token, "header");
		                        clientAuths.add("accessClient", apiKeyAuth);
		                        log("Using access client " + token);
		                    }
		                    break;
		            }
		        }
		        
		        function applyFocus() {
		            var type = $('input[name="authType"]:checked').val() || 'guest';
		            var toFocus = null;
		            
		            switch (type) {
		                case 'basic':
		                    toFocus = '#input_user';
		                    break;
		                case 'session':
		                    toFocus = '#input_sessionToken';
		                    break;
		                case 'accessClient':
		                    toFocus = '#input_accessClientToken';
		                    break;
		            }
		            
		            if (toFocus) $(toFocus).focus();
		        }
		    
		        $('input[name="authType"],#input_user,#input_password,#input_sessionToken,#input_accessClientToken').change(applyAuth);
		        $('input[name="authType"]').change(applyFocus);
		    
		        window.swaggerUi.load();
		    
		        function log() {
		            if ('console' in window) {
		                console.log.apply(console, arguments);
		            }
		        }	
		    });
	    }
	    function checkInit() {
	    	if (!window.$) {
	    		  setTimeout(checkInit, 200);
	    	} else {
	    		initialize();
	    	}
	    }
	    checkInit();
    </script>
</head>
    
<body>
<div class="wrapper">
    <div class="preface">
        <div class="header">
            <h1>Cyclos ${cyclosVersion} REST API reference</h1>
        </div>
        
        <p>
        The Cyclos REST API is described using <a href="http://swagger.io/">Swagger 2.0</a>.
        The descriptor for the api can be downloaded from <a href="${swaggerDescriptor}">${swaggerDescriptor}</a>.
        This file can be used on tools that support Swagger.
        </p>
        
        <p>
        You can also generate a client library, courtesy of <a href="http://generator.swagger.io">http://generator.swagger.io</a>.
        Just fill in the language / framework you want to generate:<br>
        <select id="lang"><option value="">Loading options...</option></select>
        <button id="generate" disabled type="button">Generate</button>
        <span id="downloadContainer">This is a quick way to generate a client library. For more options, visit the online swagger generator.</span>
        </p>
        
        <p>
        In the API, whenever some data is referenced, for example, a group, or payment type, either id or internal name can
        be used. When an user is to be referenced, the special word 'self' (sans quotes) always refers to the currently
        authenticated user, and any identification method (login name, e-mail, mobile phone, account number or custom field)
        that can be used on keywords search (as configured in the products) can also be used to identify users.
        Some specific data types have other identification fields, like accounts can have a number and payments can have a
        transaction number. This all depends on the current configuration.
        </p>
        
        <p>
        Below is a list of all available REST urls handled by the API.
        Each one has a "Try it out!" button that can run the operation live.
        If you are going to perform any of these operations, please, select below the authentication method to be used.
        </p>
        
        <p>
        For details of the deprecated elements (operations and model) please visit the 
        <a href="https://documentation.cyclos.org/${cyclosVersion}/api-deprecation.html">deprecation notes</a> page for this version.
        </p>
        
        <form id='auth'>
          <div id="auth-select">
              <div class='input'>
                <label>
                <input type="radio" id="authType_guest" name="authType" value="guest" checked/>
                Guest
                </label>
              </div>
              <div class='input'>
                <label>
                <input type="radio" id="authType_basic" name="authType" value="basic"/>
                User / password
                </label>
              </div>
              <div class='input'>
                <label>
                <input type="radio" id="authType_session" name="authType" value="session"/>
                Session
                </label>
              </div>
              <div class='input'>
                <label>
                <input type="radio" id="authType_accessClient" name="authType" type="radio" value="accessClient"/>
                Access client
                </label>
              </div>
          </div>
          <div id="auth-fields" style="display:none">
              <div class='input auth auth_basic'><input placeholder="User" id="input_user" name="user" type="text" /></div>
              <div class='input auth auth_basic'><input placeholder="Password" id="input_password" name="password" type="password" /></div>
              <div class='input auth auth_session'><input placeholder="Session token" id="input_sessionToken" name="sessionToken" type="text" /></div>
              <div class='input auth auth_accessClient'><input placeholder="Access client token" id="input_accessClientToken" name="accessClientToken" type="text" /></div>
          </div>
        </form>
    </div>
    <div class="swagger-section">
        <div id="swagger-ui-container" class="swagger-ui-wrap"></div>
    </div>
</div>
</body>
</html>
