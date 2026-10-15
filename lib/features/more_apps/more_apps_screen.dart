import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/constants/other_apps.dart';
import '../../domain/models/promoted_app.dart';
import '../../theme/app_theme.dart';

class MoreAppsScreen extends StatelessWidget {
  const MoreAppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Other Hadith Apps',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            tooltip: 'Share App Collection',
            onPressed: () {
              HapticFeedback.lightImpact();
              Share.share(
                'Explore our authentic collection of Hadith apps (Sahih Bukhari, Sahih Muslim, Abu Dawood, Tirmidhi & more) with Urdu & English translations:\nhttps://play.google.com/store/apps/details?id=com.albukhari.hadith',
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // ─── Header Hero Card ──────────────────────────────────────────
            _buildHeroCard(context, isDark, primaryColor),
            const SizedBox(height: 16),

            // ─── Section Title ─────────────────────────────────────────────
            Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Authentic Hadith Collections',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const Spacer(),
                Text(
                  'مستند کتب احادیث',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.amiri(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ─── Promoted Apps List ────────────────────────────────────────
            ...OtherHadithApps.apps.asMap().entries.map((entry) {
              final index = entry.key;
              final app = entry.value;
              return _buildAppCard(context, app, isDark, primaryColor, index);
            }),

            const SizedBox(height: 12),

            // ─── View All On Play Store Banner ─────────────────────────────
            _buildDeveloperButton(context, isDark, primaryColor),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context, bool isDark, Color primaryColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  const Color(0xFF0F3E26),
                  const Color(0xFF132F20),
                ]
              : [
                  primaryColor,
                  const Color(0xFF0E9C58),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: isDark ? 0.3 : 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.15),
            ),
            child: const Icon(
              Icons.auto_stories_rounded,
              color: Colors.amber,
              size: 32,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'احادیث نبوی ﷺ کا مکمل ذخیرہ',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: GoogleFonts.amiri(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Explore other authentic Hadith books by our team with Urdu, Arabic, and English translations. Free & offline.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.05, end: 0);
  }

  Widget _buildAppCard(
    BuildContext context,
    PromotedApp app,
    bool isDark,
    Color primaryColor,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row: Icon + Title + Rating Badge
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: app.badgeColor.withValues(alpha: isDark ? 0.25 : 0.12),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: app.badgeColor.withValues(alpha: 0.3),
                          width: 1.2,
                        ),
                      ),
                      child: app.assetIconPath != null
                          ? Image.asset(
                              app.assetIconPath!,
                              width: 54,
                              height: 54,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(
                                app.iconData,
                                color: app.badgeColor,
                                size: 28,
                              ),
                            )
                          : Icon(
                              app.iconData,
                              color: app.badgeColor,
                              size: 28,
                            ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                app.titleEnglish,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (app.rating != null)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  app.rating!,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              app.titleUrdu,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            const Text('  •  ', style: TextStyle(color: Colors.grey)),
                            Text(
                              app.titleArabic,
                              style: GoogleFonts.amiri(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.grey.shade400 : Colors.grey.shade700,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Description English
              Text(
                app.descriptionEnglish,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.4,
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 4),

              // Description Urdu
              Text(
                app.descriptionUrdu,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.5,
                  color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 14),

              // CTA Button: Install on Google Play
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: app.badgeColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.download_rounded, size: 20),
                  label: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Install on Google Play',
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'مفت ڈاؤنلوڈ کریں',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  onPressed: () {
                    HapticFeedback.mediumImpact();
                    app.launchPlayStore();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(
          delay: (100 * index).ms,
          duration: 400.ms,
        ).slideY(begin: 0.05, end: 0);
  }

  Widget _buildDeveloperButton(
    BuildContext context,
    bool isDark,
    Color primaryColor,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.apps_rounded, color: primaryColor, size: 22),
              const SizedBox(width: 8),
              const Text(
                'Complete Islamic App Catalog',
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Check out all apps published under our developer account on Google Play',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: primaryColor,
              side: BorderSide(color: primaryColor, width: 1.5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.open_in_new_rounded, size: 18),
            label: const Text(
              'View All Apps on Google Play',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              OtherHadithApps.launchDeveloperPage();
            },
          ),
        ],
      ),
    );
  }
}
