Cyclos 4.11.5
-------------------------------------------------------------------------------

Cyclos is an online and mobile payment system made by the
Social TRade Organisation (STRO).

The Cyclos license information is published in the license folder in the 
distribution archive, as well as the licenses for libraries and icons used 
in Cyclos.

In order to run Cyclos, a license key is needed. STRO offers free, social
and commercial licenses. The licenses can be requested through the license
management servers, at https://license.cyclos.org

For more information please visit:
http://www.cyclos.org
http://www.socialtrade.org


Requirements
-------------------------------------------------------------------------------
* Java 7 or higher (either Oracle (tm) or OpenJDK are fine)
* Tomcat 7 or higher (or other Servlet 3.0+ compliant application server)
* PostgreSQL 9.3 or higher
* PostGIS 2.1 or higher


Version policy
-------------------------------------------------------------------------------
The first released version of Cyclos 4 was 4.0 (or 4.0.0).
The next released version was 4.0.1. Each component, X.Y.Z are:
* X: The major version number. Will be 4 for then entire lifecycle of Cyclos 4.
* Y: The milestone number. This number indicates that new features are 
     available, and could bring incompatible API changes for those who use web
     services (despite our effort to keep those incompatible changes as minimal
     as possible). All those changes, however, are documented.
* Z: Contains only bug fixes, and maybe some backwards-compatible API changes.
     Upgrading to those releases is always recommended.


API disclaimer
-------------------------------------------------------------------------------
The API, which can be accessed by 3rd party java applications using Spring 
HttpInvoker (see the <cyclos-x.x.x.x>/web-services/java directory in the 
download bundle) or by 3rd party applications in other languages via web-rpc
(see the <cyclos-x.x.x.x>/web-services/php in the download bundle) is not 
stable yet.
However, as stated in the version policy section, we will document API changes
between each milestone version (4.1, 4.2, 4.3 and so on). 
We have planned to perform a full API review, in order to have it as consistent
and predictable as possible - and that will probably change slightly the API.
So, if you have web services connecting to your Cyclos installation, it is
advised to keep track of those eventual changes, updating the client
applications accordingly.  


Installation
-------------------------------------------------------------------------------
The installation manual can be found in chapter 1 of the attached document "cyclos-reference.pdf"
Please, pay special attention to the PostgresQL and PostGIS installation steps.

After all requirements are installed, you can proceed to the Cyclos
web application installation.

The cyclos-x.x.x/web folder in the distribution archive contains all files
which should be deployed on the application server. For example, in Tomcat,
it can be copied into <tomcat>/webapps/cyclos (make sure to not have still a
web folder inside it, but all files inside the web folder directly into the
deploy folder). In this example, the application will be available at
<Tomcat Server URL>/cyclos. For Cyclos to be on the root url on the server,
you will need to remove all folders in <tomcat>/webapps, and then copy the web
folder to <tomcat>/webapps/ROOT.  

On the web/WEB-INF/classes file you'll find the cyclos-release.properties.
The first thing to do is to copy it with the name cyclos.properties. The
original name is not shipped, so in future installations you can just
override the entire folder, and your customizations won't be overwritten.

In the cyclos.properties file, you can customize several settings, but pay
special attention to the following:
* cyclos.datasource.jdbcUrl: PostgreSQL server location
* cyclos.datasource.user: Database username
* cyclos.datasource.password: Database password


Upgrading from previous versions
-------------------------------------------------------------------------------
When upgrading from a prior version, just extract the download bundle and
copy the contents of the web folder to your <tomcat>/webapps/<name> directory.
Make sure that there are no duplicate jars of the same library (but with
different versions) in <tomcat>/webapps/<name>/WEB-INF/lib. 
A safe approach is to always remove all jars in the WEB-INF/lib directory and
then copy the web contents again. 
Or even better: backup the WEB-INF/classes/cyclos.properties file, remove all
files and directories from <tomcat>/webapps/<name>, copy the contents of the
web directory again, then restore the WEB-INF/classes/cyclos.properties file.


More documentation
-------------------------------------------------------------------------------
Please, refer to http://www.cyclos.org/documentation for more documentation,
including information on how to configure Cyclos, to integrate 3rd party
software with Cyclos via web services and to extend the Cyclos functionality
using the scripting module.