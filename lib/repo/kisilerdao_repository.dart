import 'package:firebase_database/firebase_database.dart';
import 'package:kisiler_uygulamasi/entity/kisiler.dart';

class KisilerDaoRepository {// dao: Database Access Object
  var refKisiler = FirebaseDatabase.instance.ref().child('kisiler');

  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    var yeniKisi = Map<String,dynamic>();
    yeniKisi["kisi_id"] = "";
    yeniKisi["kisi_ad"] = kisi_ad;
    yeniKisi["kisi_tel"] = kisi_tel;
    refKisiler.push().set(yeniKisi);
  }

  Future<void> kisiGuncelle(String kisi_id, String kisi_ad, String kisi_tel) async {
    var guncellenenKisi = Map<String,dynamic>();
    guncellenenKisi["kisi_ad"] = kisi_ad;
    guncellenenKisi["kisi_tel"] = kisi_tel;
    refKisiler.child(kisi_id).update(guncellenenKisi);
  }

  Future<void> kisiSil(String kisi_id) async {
    print("Kişi sil : $kisi_id");
  }
}