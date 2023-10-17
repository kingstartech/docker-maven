FROM eclipse-temurin:17-jdk

ARG MAVEN_VERSION=3.9.5
ARG USER_HOME_DIR="/root"
ARG SHA=9450dc952dd2f10ae673e8175cd08dfe01f59bcb8d758f560a20d845aab0197aafc5edbc113199015529cbefa6b226b02162ae1df16a9e05dd956a4cd2b92303
ARG BASE_URL=http://mirrors.ustc.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries

RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY settings-docker.xml /usr/share/maven/ref/
COPY settings.xml /usr/share/maven/conf/

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
