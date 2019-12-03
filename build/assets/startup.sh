#!/bin/bash

KNOWLEDGE_WEB_XML=/usr/local/tomcat/webapps/ROOT/WEB-INF/web.xml

sed -i "s/<param-value>COOKIE-ENCRIPT-KEY-PLACEHOLDER<\\/param-value>/<param-value>${COOKIE_ENCRYPT_KEY}<\\/param-value>/1" "$KNOWLEDGE_WEB_XML"

if [ "$(echo ${EDIT_PAGE_CUSTOM:-FALSE} | tr [:lower:] [:upper:])" = "TRUE" ]; then
    cp -f -R -v ./custom/*   /usr/local/tomcat/webapps/ROOT/WEB-INF/views/
fi

catalina.sh run
