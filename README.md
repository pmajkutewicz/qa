# QA for java projects

## maven build

### QA plugins
There is a switch `skipQA` which allow to skip all QA plugins.  
Example usage: ```maven install -DskipQA```.  

You can also skip individual plugins:  
`skipQA.checkstyle` - disables execution of maven-checkstyle-plugin.  
`skipQA.pmd` - disables execution of maven-pmd-plugin.  
`skipQA.jqassistant` - disables execution of jqassistant-maven-plugin.  
`skipQA.findbugs` - disables execution of findbugs-maven-plugin.  
`skipQA.owasp` - disables execution of dependency-check-maven.  

By default all plugins except owasp will fail build on any errors. To change this behaviour there are following properties:  
`failOnQAErrors` - build will fail when checkstyle/findbugs errors are found.  
`failOnQAErrors.checkstyle` - fail only on checkstyle errors.  
`failOnQAErrors.pmd` - fail only on pmd errors.  
`failOnQAErrors.jqassistant` - fail only on jqassistant errors.  
`failOnQAErrors.findbugs` - fail only on findbugs errors.  
`failOnQAErrors.owasp` - fail only on owasp scanner errors.  

Also there is `fast` profile - which sets `skipQA` to true and `failOnQAErrors` to false.