FROM ghcr.io/graalvm/graalvm-ce:java8-21.1.0
RUN gu install native-image
ENV VERSION 2.277.3
ADD https://repo.jenkins-ci.org/public/org/jenkins-ci/main/cli/$VERSION/cli-$VERSION.jar /cli.jar
RUN native-image \
        --install-exit-handlers \
        --initialize-at-build-time=io.jenkins.cli.shaded.org.apache.sshd,io.jenkins.cli.shaded.org.slf4j \
        --allow-incomplete-classpath \
        `# -H:IncludeResourceBundles=hudson.cli.client.Messages does not work (did not bother trying -H:-LocalizationOptimizedMode):` \
        -H:IncludeResources='hudson/cli/client/Messages.*[.]properties' \
        --enable-http --enable-https \
        -jar /cli.jar
ARG JENKINS_URL
# TODO -webSocket does not work: jakarta.websocket.DeploymentException: io.jenkins.cli.shaded.org.glassfish.tyrus.container.jdk.client.JdkClientContainer
RUN /cli who-am-i
