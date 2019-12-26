plugins {
    application
    java
    kotlin("jvm") version "1.3.50"
}

repositories {
    jcenter()
}

sourceSets {
    main {
        java.srcDir("src")
    }
}

dependencies {
    implementation(kotlin("stdlib"))
}

application {
    mainClassName = "io.github.rainbyte.MainKt"
}