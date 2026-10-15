import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/models/promoted_app.dart';

/// Centralized registry for all sister Hadith & Islamic apps.
class OtherHadithApps {
  /// Developer identifier on Google Play Store.
  static const String developerName = 'Taha imam';
  static const String developerId = ''; // If numeric ID is available

  /// Complete list of authentic Hadith collections published by developer.
  static const List<PromotedApp> apps = [
    // 1. All Hadith Collection (Sahih - All in one)
    PromotedApp(
      id: 'all_hadith',
      titleEnglish: 'All Hadith Collection: Sahih',
      titleUrdu: 'تمام مستند احادیث کا مجموعہ',
      titleArabic: 'مجموع كتب الحديث الصحاح',
      descriptionEnglish:
          'Comprehensive collection of Kutub al-Sittah (Bukhari, Muslim, Abu Dawood, Tirmidhi, Nasa\'i, Ibn Majah) with multi-language translations & offline access.',
      descriptionUrdu:
          'تمام چھ مستند کتب احادیث (صحاح ستہ) کا مکمل انسائیکلوپیڈیا، اردو، عربی اور انگلش ترجمہ و تلاش کی سہولت۔',
      packageName: 'com.taha.allhadithshahih',
      assetIconPath: 'assets/images/other_apps/all_hadith.webp',
      iconData: Icons.auto_stories_rounded,
      badgeColor: Color(0xFFD4AF37), // Islamic Gold
      rating: '4.8 ★',
      isPublished: true,
    ),

    // 2. Sahih Muslim
    PromotedApp(
      id: 'sahih_muslim',
      titleEnglish: 'Sahih Muslim Ultimate',
      titleUrdu: 'صحیح مسلم شریف',
      titleArabic: 'صحيح مسلم',
      descriptionEnglish:
          'The second most authentic Hadith collection compiled by Imam Muslim. Full Arabic, Urdu & English translations with advanced search.',
      descriptionUrdu:
          'امام مسلم کی مرتب کردہ دوسری سب سے مستند حدیث کی کتاب، اردو اور انگریزی ترجمہ اور تلاش کی سہولت کے ساتھ۔',
      packageName: 'app.shahihmuslim',
      assetIconPath: 'assets/images/other_apps/sahih_muslim.webp',
      iconData: Icons.menu_book_rounded,
      badgeColor: Color(0xFF1565C0), // Royal Blue
      rating: '4.8 ★',
      isPublished: true,
    ),

    // 3. Sunan Abu Dawood
    PromotedApp(
      id: 'sunan_abu_dawood',
      titleEnglish: 'Sunan Abu Dawood',
      titleUrdu: 'سنن ابی داؤد شریف',
      titleArabic: 'سنن أبي داود',
      descriptionEnglish:
          'Primary source of Islamic legal traditions and rulings compiled by Imam Abu Dawood with full translations.',
      descriptionUrdu:
          'فقہی احادیث کا عظیم الشان ذخیرہ، مکمل اردو اور انگلش ترجمہ اور مستند ابواب کے ساتھ۔',
      packageName: 'com.sunan.abudawood',
      assetIconPath: 'assets/images/other_apps/sunan_abu_dawood.webp',
      iconData: Icons.library_books_rounded,
      badgeColor: Color(0xFF2E7D32), // Forest Green
      rating: '4.8 ★',
      isPublished: true,
    ),

    // 4. Jami at-Tirmidhi
    PromotedApp(
      id: 'jami_tirmidhi',
      titleEnglish: "Jami' at-Tirmidhi Hadith",
      titleUrdu: 'جامع ترمذی شریف',
      titleArabic: 'جامع الترمذي',
      descriptionEnglish:
          'Distinguished collection with Hadith grading (Sahih, Hasan, Da\'if) compiled by Imam at-Tirmidhi.',
      descriptionUrdu:
          'احادیث کی صحت و حسن کی درجہ بندی پر مشتمل امام ترمذی کا جامع مجموعہ حدیث۔',
      packageName: 'com.jami.at_tirmidhi',
      assetIconPath: 'assets/images/other_apps/jami_tirmidhi.webp',
      iconData: Icons.chrome_reader_mode_rounded,
      badgeColor: Color(0xFF6A1B9A), // Deep Leather Maroon/Purple
      rating: '4.8 ★',
      isPublished: true,
    ),

    // 5. Sunan An-Nasai
    PromotedApp(
      id: 'sunan_nasai',
      titleEnglish: "Sunan An-Nasai (3 Languages)",
      titleUrdu: 'سنن نسائی شریف',
      titleArabic: 'سنن النسائي',
      descriptionEnglish:
          'Renowned for its rigorous standards of Hadith verification compiled by Imam an-Nasa\'i with Urdu & English translations.',
      descriptionUrdu:
          'اسناد اور راویوں کی سخت جانچ پر مبنی امام نسائی کا معتبر مجموعہ۔',
      packageName: 'com.sunan.an_nasai',
      assetIconPath: 'assets/images/other_apps/sunan_nasai.webp',
      iconData: Icons.collections_bookmark_rounded,
      badgeColor: Color(0xFF00695C), // Dark Teal
      rating: '4.8 ★',
      isPublished: true,
    ),

    // 6. Sunan Ibn Majah
    PromotedApp(
      id: 'sunan_ibn_majah',
      titleEnglish: 'Sunan Ibn Majah - Hadith',
      titleUrdu: 'سنن ابن ماجہ شریف',
      titleArabic: 'سنن ابن ماجه',
      descriptionEnglish:
          'The sixth book of the Sihah Sittah, covering practical daily Islamic life and jurisprudence.',
      descriptionUrdu:
          'صحاح ستہ کی چھٹی اہم کتاب، اسلامی احکام اور روزمرہ زندگی کے لیے رہنمائی۔',
      packageName: 'com.sunan.ibnmajah',
      assetIconPath: 'assets/images/other_apps/sunan_ibn_majah.webp',
      iconData: Icons.import_contacts_rounded,
      badgeColor: Color(0xFFC2185B), // Elegant Ruby
      rating: '4.8 ★',
      isPublished: true,
    ),
  ];

  /// Opens the developer's full portfolio on Google Play Store.
  static Future<bool> launchDeveloperPage() async {
    final query = Uri.encodeComponent(developerName);
    final marketUri = Uri.parse('market://search?q=pub:$query');
    final webUri = Uri.parse('https://play.google.com/store/apps/developer?id=$query');

    try {
      final launched = await launchUrl(
        marketUri,
        mode: LaunchMode.externalApplication,
      );
      if (launched) return true;
    } catch (_) {}

    try {
      return await launchUrl(
        webUri,
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      return false;
    }
  }
}
