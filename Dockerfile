FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY . .

RUN javac src/*.java

EXPOSE 8000

CMD ["java", "-cp", "src", "Main"]