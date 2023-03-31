class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;
  final String countryCode;

  Language(this.id, this.flag, this.name, this.languageCode, this.countryCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, 'assets/l10n/hu.png', "Hungary", "fr", "FR"),
      Language(2, 'assets/l10n/en.png', "English", "en", "EN"),
      Language(3, 'assets/l10n/de.png', "German", "de", "DE"),
    ];
  }
}
