from maven:3.8.6-openjdk-18-slim AS build
run mkdir -p /spc
add . /spc
workdir /spc
run mvn package 


from maven:3.8.6-openjdk-18-slim
run addgroup -g 1000 spc && adduser -h "/spc" -u 1006 -G spc -s /bin/bash -D spc
copy --from=build /spc/target/spring-petclinic-3.1.0-SNAPSHOT.jar ./spring-petclinic-3.1.0-SNAPSHOT.jar
user spc
expose 8080
cmd ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]