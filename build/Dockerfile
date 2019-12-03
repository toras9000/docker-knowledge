FROM tomcat:9-jdk8-adoptopenjdk-hotspot as extractor

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl xmlstarlet

ARG KNOWLEDGE_VER=v1.13.1

WORKDIR /work

RUN curl -s -L https://github.com/support-project/knowledge/releases/download/${KNOWLEDGE_VER}/knowledge.war -o knowledge.war

RUN mkdir knowledge
RUN cd knowledge && jar xf ../knowledge.war

RUN xmlstarlet ed -L -N n=http://xmlns.jcp.org/xml/ns/javaee \
                  -a "/n:web-app/n:filter[n:filter-name='AuthenticationFilter']/n:init-param[last()]" -t elem -n "init-param"  -v "" \
                  ./knowledge/WEB-INF/web.xml

RUN xmlstarlet ed -L -N n=http://xmlns.jcp.org/xml/ns/javaee \
                  -s "/n:web-app/n:filter[n:filter-name='AuthenticationFilter']/n:init-param[last()]" -t elem -n "param-name"  -v "cookie-encrypt-key" \
                  -s "/n:web-app/n:filter[n:filter-name='AuthenticationFilter']/n:init-param[last()]" -t elem -n "param-value" -v "COOKIE-ENCRIPT-KEY-PLACEHOLDER" \
                  ./knowledge/WEB-INF/web.xml

FROM tomcat:9-jre8-slim

# Delete unnecessary files
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
 && rm -rf /usr/local/tomcat/webapps/examples \
 && rm -rf /usr/local/tomcat/webapps/docs \
 && rm -rf /usr/local/tomcat/webapps/manager \
 && rm -rf /usr/local/tomcat/webapps/host-manager

RUN apt-get update \
 && apt-get install -y --no-install-recommends dumb-init \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# Copy app files from extractor container
COPY --from=extractor /work/knowledge /usr/local/tomcat/webapps/ROOT

# Copy assets.
COPY ./assets/startup.sh ./startup.sh
COPY ./assets/custom     ./custom

EXPOSE 8080

# Startup command
CMD ["dumb-init", "bash", "./startup.sh"]
