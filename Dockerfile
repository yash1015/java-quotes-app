# Use OpenJDK 17 lightweight image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy source code
COPY src/ /app/

# Copy HTML file
COPY quotes.html /app/

# Compile Java file
RUN javac Main.java

# Expose port
EXPOSE 8000

# Run application
CMD ["java", "Main"]
