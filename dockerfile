FROM openjdk:20
COPY OppenheimerProjectDev.jar /usr/app/
WORKDIR /usr/app/
ENTRYPOINT ["java", "-jar", "OppenheimerProjectDev.jar"]
