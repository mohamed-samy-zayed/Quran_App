class QuranModel {
  final String title;
  final String type;
  final int ayat;
  final int id;
   List <SurahModel> surahs;

  QuranModel({
    required this.id,
    required this.title,
    required this.surahs,
    required this.type,
    required this.ayat,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    List<SurahModel> surahList = [];
    for ( int i = 0; i<  json['ayahs'].length; i++) {
      surahList.add(SurahModel.fromJson(json['ayahs'][i]));
    }
    

    return QuranModel(
      title: json['name'],
      surahs: surahList ,
      type: json['revelationType'],
      ayat: json['ayahs'].length, 
      id: json['number'],
    );
  }
}

class SurahModel {
  final String surahs;

  SurahModel({required this.surahs});

  factory SurahModel.fromJson(Map<String, dynamic> jsonData) {
    return SurahModel(
      surahs: jsonData['text'], 
    );
  }
}
