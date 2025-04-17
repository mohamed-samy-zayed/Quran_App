import 'package:quran_app/core/utils/Api.dart';
import 'package:quran_app/features/home/data/models/quran_model.dart';

class GetSurah {
 String urlBase= 'https://api.alquran.cloud/v1/quran';
 Future<List<QuranModel>> getSurah()async{

  Map<String,dynamic> dataFormat = await Api().get(url: urlBase) ;
  
   Map<String,dynamic> data = dataFormat["data"];
   

  List<dynamic> sourah = data["surahs"];
  
  List<QuranModel> quranSourah = [];
  for(int i =0 ; i<sourah.length;i++){
     quranSourah.add(QuranModel.fromJson(sourah[i]));

     // Parse the QuranModel and remove "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ" from surahs content
      QuranModel quranModel = QuranModel.fromJson(sourah[i]);
      quranModel.surahs = quranModel.surahs
          .map((s) => s.surahs.replaceAll("بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ", '')).cast<SurahModel>()
          .toList();
      quranSourah.add(quranModel);
    
       
  }
  return quranSourah;
 }


}