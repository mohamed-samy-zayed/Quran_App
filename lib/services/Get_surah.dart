import 'package:quran_app/helper/Api.dart';
import 'package:quran_app/models/quran_model.dart';

class GetSurah {
 String urlBase= 'https://api.alquran.cloud/v1/quran';
 Future<List<QuranModel>> getSurah()async{

  Map<String,dynamic> dataFormat = await Api().get(url: urlBase) ;
  
   Map<String,dynamic> data = dataFormat["data"];
   

  List<dynamic> sourah = data["surahs"];
  
  List<QuranModel> quranSourah = [];
  for(int i =0 ; i<sourah.length;i++){
     quranSourah.add(QuranModel.fromJson(sourah[i]));
       
  }
  return quranSourah;
 }


}