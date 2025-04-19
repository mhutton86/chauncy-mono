plugins {
  id("org.springframework.boot") version "3.4.4"
  id("io.spring.dependency-management") version "1.1.6"
  kotlin("jvm") version "1.9.25"
  kotlin("plugin.spring") version "1.9.25"
}

group = "com.mediokr"
version = "0.0.1-SNAPSHOT"

repositories {
  mavenCentral()
}

java {
  toolchain {
    languageVersion.set(JavaLanguageVersion.of(21)) // Use Java 21
  }
  sourceCompatibility = JavaVersion.VERSION_21
  targetCompatibility = JavaVersion.VERSION_21
}

kotlin {
  jvmToolchain {
    languageVersion.set(JavaLanguageVersion.of(21)) // Ensure Kotlin uses Java 21
  }
}

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile> {
  kotlinOptions {
    freeCompilerArgs = listOf("-Xjsr305=strict")
    jvmTarget = "21" // Kotlin target should also be 21
  }
}

dependencies {
  // Spring Boot
  implementation("org.springframework.boot:spring-boot-starter")
  implementation("org.springframework.boot:spring-boot-starter-web")
  developmentOnly("org.springframework.boot:spring-boot-devtools") // DevTools for development only

  // Google API
  implementation("com.google.api-client:google-api-client:1.32.1")
  implementation("com.google.oauth-client:google-oauth-client-jetty:1.39.0")
  implementation("com.google.apis:google-api-services-gmail:v1-rev110-1.25.0")

  // Kotlin
  implementation("org.jetbrains.kotlin:kotlin-reflect")
  testImplementation("org.jetbrains.kotlin:kotlin-test-junit5")

  // External Libraries
  implementation("io.github.sashirestela:simple-openai:3.14.0")

  // Testing
  testImplementation("org.springframework.boot:spring-boot-starter-test")
  testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

// Exclude slf4j-simple to avoid conflicts with logback
configurations {
  all {
    exclude(group = "org.slf4j", module = "slf4j-simple")
  }
}

tasks.withType<Test> {
  useJUnitPlatform()
}
