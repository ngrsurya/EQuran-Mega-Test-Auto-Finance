import 'package:e_quran/features/home/domain/entities/daftar_surat.dart';
import 'package:e_quran/features/home/domain/usecases/get_data_daftar_surat.dart';
import 'package:get/get.dart';

enum DaftarSuratState { initial, getData, error, loading }

class HomeController extends GetxController {
  GetDataDaftarSurat getDataDaftarSurat;

  //STATE
  Rx<DaftarSuratState> daftarSuratState = DaftarSuratState.initial.obs;

  //DATA
  Rx<DaftarSuratInfo>? daftarSuratData;

  HomeController({required this.getDataDaftarSurat});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    doGetDataDaftarSurat();
  }

  //------------------------------------------------------------------------------------------------
  //State Changer
  void onChangeDaftarSuratState(DaftarSuratState val) {
    daftarSuratState.value = val;
  }

  //------------------------------------------------------------------------------------------------

  Future doGetDataDaftarSurat() async {
    onChangeDaftarSuratState(DaftarSuratState.loading);

    final result = await getDataDaftarSurat();
    result.fold((l) {
      // ignore: unused_local_variable
      var error = Rx(l).toJson().toString();

      onChangeDaftarSuratState(DaftarSuratState.error);
    }, (r) {
      var data = Rx(r);
      daftarSuratData = data;

      onChangeDaftarSuratState(DaftarSuratState.getData);
    });
  }
}
