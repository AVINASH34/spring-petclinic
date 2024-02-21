from maven:3.8.6-openjdk-18-slim AS build
run mkdir -p /spc
add . /spc
workdir /spc
run mvn package 


# from maven:3.8.6-openjdk-18-slim
# copy --from=build /spc