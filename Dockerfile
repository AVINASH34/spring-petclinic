from maven:3.8.6-openjdk-18-slim AS build
run mkdir -p /spc
add . /spc
workdir /spc
run mvn package 


from maven:3.8.6-openjdk-18-slim
copy --from=build /spc/target/spring-petclinic-3.1.0-SNAPSHOT.jar ./spring-petclinic-3.1.0-SNAPSHOT.jar
expose 8080
cmd ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]