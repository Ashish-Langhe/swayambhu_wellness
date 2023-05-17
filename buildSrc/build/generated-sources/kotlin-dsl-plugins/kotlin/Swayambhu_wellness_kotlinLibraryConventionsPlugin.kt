/**
 * Precompiled [swayambhu_wellness.kotlin-library-conventions.gradle.kts][Swayambhu_wellness_kotlin_library_conventions_gradle] script plugin.
 *
 * @see Swayambhu_wellness_kotlin_library_conventions_gradle
 */
public
class Swayambhu_wellness_kotlinLibraryConventionsPlugin : org.gradle.api.Plugin<org.gradle.api.Project> {
    override fun apply(target: org.gradle.api.Project) {
        try {
            Class
                .forName("Swayambhu_wellness_kotlin_library_conventions_gradle")
                .getDeclaredConstructor(org.gradle.api.Project::class.java, org.gradle.api.Project::class.java)
                .newInstance(target, target)
        } catch (e: java.lang.reflect.InvocationTargetException) {
            throw e.targetException
        }
    }
}
