FROM eclipse-temurin:17
WORKDIR /app
COPY EaglerSPRelay.jar .
COPY config.yml .
EXPOSE 10000
CMD ["java", "-jar", "EaglerSPRelay.jar"]
