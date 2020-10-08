FROM alpine:3.11

RUN set -eux; \
    # install jre 11
    apk --no-cache add openjdk11-jre=11.0.5_p10-r0; \
    \
    # https://github.com/docker-library/openjdk/issues/212#issuecomment-420979840
    # https://openjdk.java.net/jeps/341
    java -Xshare:dump; \
    \
    # basic smoke test
    java --version;

ENV JAVA_HOME /usr/bin/java

ENV PATH $JAVA_HOME:$PATH

CMD ["java", "--version"]