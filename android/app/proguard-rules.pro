# ==============================================================================
# R8 / ProGuard rules for Sahih Bukhari app (release, R8 full mode)
# Ad stack: Google Mobile Ads + UMP + Unity Ads adapter + Meta Audience Network
# ==============================================================================

# ---- CRITICAL: generic signatures / annotations / reflection ----------------
# R8 full mode strips generic type signatures. Gson's anonymous TypeToken<T>
# subclasses need them, otherwise: RuntimeException "Missing type parameter"
# in TypeToken.getSuperclassTypeParameter.
-keepattributes Signature,InnerClasses,EnclosingMethod,*Annotation*
-dontwarn com.google.gson.**
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * extends com.google.gson.reflect.TypeToken
-keep class * extends com.google.gson.reflect.TypeToken { *; }
-keepclassmembers class * extends com.google.gson.reflect.TypeToken { *; }
-keep class * implements com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keepclassmembers,allowobfuscation class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# ---- Google Mobile Ads & UMP -------------------------------------------------
-keep class io.flutter.plugins.googlemobileads.** { *; }
-dontwarn com.google.android.ump.**
-dontwarn com.google.android.gms.ads.**

# ---- Google Play In-App Review -----------------------------------------------
-keep class com.google.android.play.core.review.** { *; }
-keep class com.google.android.play.core.common.** { *; }
-dontwarn com.google.android.play.core.**

# ---- Sqflite plugin bridge ----------------------------------------------------
-keep class com.tekartik.sqflite.SqflitePlugin { *; }

# ---- Unity Ads SDK & Google mediation adapter --------------------------------
-keep public class com.google.ads.mediation.unity.** {
    public *;
    protected *;
}
-keep class com.google.ads.mediation.unity.** { *; }
-keep interface com.google.android.gms.ads.mediation.Adapter { *; }
-keep interface com.google.android.gms.ads.mediation.MediationAdapter { *; }
-keep class * extends com.google.android.gms.ads.mediation.Adapter { *; }
-keep class * implements com.google.android.gms.ads.mediation.Adapter { *; }
-keep class * implements com.google.android.gms.ads.mediation.MediationAdapter { *; }

-keep class com.unity3d.ads.** { *; }
-keep class com.unity3d.services.** { *; }
-dontwarn com.unity3d.ads.**
-dontwarn com.unity3d.services.**

# Unity Ads gateway protocol + protobuf reflection
# (fixes the obfuscated "SourceFile - j2.a.<init>" RuntimeException crash)
-keep class gatewayprotocol.v1.** { *; }
-keep class com.google.protobuf.** { *; }
-dontwarn gatewayprotocol.v1.**
-dontwarn com.google.protobuf.**

# ---- Meta Audience Network & mediation adapter -------------------------------
-keep class com.google.ads.mediation.facebook.** { *; }
-keep class com.facebook.ads.** { *; }
-dontwarn com.facebook.ads.**

# ---- Parcelable CREATOR (used by several ad SDKs) ----------------------------
-keepclassmembers class * implements android.os.Parcelable {
    public static final ** CREATOR;
}

# ---- WorkManager components required by Unity Ads in R8 full mode ------------
-keep class androidx.work.impl.WorkDatabase_Impl { *; }
-keep class * extends androidx.work.ListenableWorker { <init>(android.content.Context, androidx.work.WorkerParameters); }
-keep class * extends androidx.work.InputMerger { <init>(); }

# ---- Benign dynamic lookups ----------------------------------------------------
-dontwarn io.flutter.embedding.**
-dontwarn io.isar.**
