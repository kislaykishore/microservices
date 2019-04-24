#Run ./gradlew clean build
#After building, unzip


FROM openjdk:8u212-jre-stretch
RUN mkdir -p /app/classes /app/lib /app/spring
WORKDIR /app
ADD WEB-INF/classes/ /app/classes/
ADD spring/ /app/spring/
COPY WEB-INF/lib/* /app/lib/
ENTRYPOINT ["java", "-cp", "classes/:lib/*:spring/", "hello.App"]
