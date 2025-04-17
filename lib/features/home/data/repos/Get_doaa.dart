
import 'package:quran_app/core/utils/Api.dart';
import 'package:quran_app/features/home/data/models/doaa_model.dart';

class GetDoaa {
  String baseUrl =
      'https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json';
  Future<List<DoaaModel>> getDoaa() async {
    Map<String, dynamic> data = await Api().get(url: baseUrl);

    // List<dynamic> morning = data['أذكار الصباح'];
    // List<dynamic> evening = data['أذكار المساء'];
    // List<dynamic> pray = data["أذكار بعد السلام من الصلاة المفروضة"];
    // List<dynamic> tasbeeh = data["تسابيح"];
    // List<dynamic> sleeping = data["أذكار النوم"];
    // List<dynamic> wakeing = data["أذكار الاستيقاظ"];
    // List<dynamic> doaaQuran = data["أدعية قرآنية"];
    // List<dynamic> doaaProphit = data["أدعية الأنبياء"];
    // print(doaaProphit);
    // List<DoaaModel> azkar = [];
    // for (int index = 0; index < morning.length; index++) {
    //   azkar.add(DoaaModel.fromJson(morning[index]));
    // }
    // for (int index = 0; index < evening.length; index++) {
    //   azkar.add(DoaaModel.fromJson(evening[index]));
    // }
    // for (int index = 0; index < pray.length; index++) {
    //   azkar.add(DoaaModel.fromJson(pray[index]));
    // }
    // for (int index = 0; index < tasbeeh.length; index++) {
    //   azkar.add(DoaaModel.fromJson(tasbeeh[index]));
    // }
    // for (int index = 0; index < sleeping.length; index++) {
    //   azkar.add(DoaaModel.fromJson(sleeping[index]));
    // }
    // for (int index = 0; index < wakeing.length; index++) {
    //   azkar.add(DoaaModel.fromJson(wakeing[index]));
    // }
    // for (int index = 0; index < doaaQuran.length; index++) {
    //   azkar.add(DoaaModel.fromJson(doaaQuran[index]));
    // }
    // for (int index = 0; index < doaaProphit.length; index++) {
    //   azkar.add(DoaaModel.fromJson(doaaProphit[index]));
    // }
    // print(azkar);
    // return azkar;

    

      final List<String> categories = [
        'أذكار الصباح',
        'أذكار المساء',
        'أذكار بعد السلام من الصلاة المفروضة',
        'تسابيح',
        'أذكار النوم',
        'أذكار الاستيقاظ',
        'أدعية قرآنية',
        'أدعية الأنبياء',
      ];

      List<DoaaModel> azkar = [];

      for (String category in categories) {
        if (data.containsKey(category)) {
          List<dynamic> items = data[category];
          azkar.addAll(items.map((item) => DoaaModel.fromJson(item)));
        }
      }

      return azkar;
  }
}
