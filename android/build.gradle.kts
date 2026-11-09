allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// AGP 8+ requires every Android module to declare a namespace.
// Some third-party Flutter plugins still omit it, so we set a safe fallback.
subprojects {
    plugins.withId("com.android.library") {
        val androidExt = extensions.findByName("android") ?: return@withId
        val currentNamespace =
            runCatching {
                androidExt.javaClass.getMethod("getNamespace").invoke(androidExt) as? String
            }.getOrNull()
        if (!currentNamespace.isNullOrBlank()) return@withId

        val fallbackNamespace =
            "com.generated.${name.replace("-", "_").replace(".", "_")}"
        runCatching {
            androidExt.javaClass
                .getMethod("setNamespace", String::class.java)
                .invoke(androidExt, fallbackNamespace)
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
