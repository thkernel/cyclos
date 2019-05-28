<%@ page contentType="text/html; charset=UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
    var RESERVED_URIS = ${reservedUris == null ? '[]' : reservedUris};
    
    function getRootPath() {
	    var path = window.location.pathname;
	    if (path.length > 0 && path.charAt(0) == '/') {
	    	path = path.substr(1);
	    }
	    if (path == '') return '';
	    var parts = path.split('/');
	    var rootPos = 0;
	    for (var i = 0; i < parts.length; i++) {
	    	var part = parts[i];
	    	var pos = RESERVED_URIS.indexOf(part);
	    	if (pos >= 0) {
	    		break;
	    	} else {
	    		rootPos++;
	    	}
	    }
	    if (rootPos <= 0) return '';
	    return '/' + parts.slice(0, rootPos).join('/');
    }
    //set the full URL
    var rootPath = window.location.protocol + '//' + window.location.host + getRootPath();
    
    function includeScript(file, defer) {
        var src = rootPath + file + "?_k=${resourceCacheKey}";
        defer = defer === true ? " defer" : "";
        document.write("<scr" + "ipt type='text/javascript' src='" + src + "' " + defer + "></scr" + "ipt>");
    }

    function includeStyle(file, media) {
        var src = rootPath + file + "?_k=${resourceCacheKey}";
       	media = media ? " media='" + media + "'" : "";
        document.write("<link href='" + src + "'" + media + " rel='stylesheet' type='text/css' />");
    }

</script>