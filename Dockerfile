FROM openjdk:8
EXPOSE 8080
ADD target/johnclintonm/devops-oo.jar johnclintonm/devops-oo.jar
ENTRYPOINT ["java","-jar","/johnclintonm/devops-oo.jar"]
