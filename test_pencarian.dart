void main() {
 
  for(var i=0;i<100;i++){
//    uncomment to try the methode
//       solusi1(); 
//       solusi2(); 
//       solusi3(); 
//       solusi4(); 
  }
}

class Data {
  int lat;
  int lang;
  double jarak;

  Data({this.lat, this.jarak, this.lang});

  toJson() {
    return {'lat': lat, 'lang': lang, 'jarak': jarak};
  }
}

//simulasi terdapat 10 data training
//hanya ada 4 data yang dianggap masuk dalam area
//asumsi data yang ada dalam area adalah diatas 3 dan dibawah 8
//jarak terkecil yang akan diambil
final dataTrainig = [
  new Data(lat: 1, lang: 1, jarak: 3.45),
  new Data(lat: 2, lang: 2, jarak: 3.20),
  new Data(lat: 3, lang: 3, jarak: 3.50),
  new Data(lat: 4, lang: 4, jarak: 3.30),
  new Data(lat: 5, lang: 5, jarak: 5.10),
  new Data(lat: 6, lang: 6, jarak: 3.90),
  new Data(lat: 7, lang: 7, jarak: 7.0),
  new Data(lat: 8, lang: 8, jarak: 3.15),
  new Data(lat: 9, lang: 9, jarak: 9.0),
  new Data(lat: 10, lang: 10, jarak: 3.0),
];
solusi4() {
   final stopwatch = Stopwatch()..start();
  double jarakTerdekat = double.infinity;
  Data dataTerdekat;
  int totalData = dataTrainig.length;
  for (var i = 0; i < totalData; i++) {
    var data = dataTrainig[i];
    if (data.jarak > 3.0 && data.jarak < 8.0) {
      if (data.jarak < jarakTerdekat) {
        jarakTerdekat = data.jarak;
        dataTerdekat = data;
      }
    }
  }
  print('${stopwatch.elapsed.toString().split(':')[2].split('.')[1]}');
  return jarakTerdekat;
}

solusi3() {
   final stopwatch = Stopwatch()..start();
  double jarakTerdekat = double.infinity;
  Data dataTerdekat;
  for (var i = 0; i < dataTrainig.length; i++) {
    var data = dataTrainig[i];
    if (data.jarak > 3.0 && data.jarak < 8.0) {
      if (data.jarak < jarakTerdekat) {
        jarakTerdekat = data.jarak;
        dataTerdekat = data;
      }
    }
  }
  print('${stopwatch.elapsed.toString().split(':')[2].split('.')[1]}');
  return jarakTerdekat;
}

solusi2() {
   final stopwatch = Stopwatch()..start();
  double jarakTerdekat = double.infinity;
  Data dataTerdekat;
  for (Data data in dataTrainig) {
    if (data.jarak > 3.0 && data.jarak < 8.0) {
      if (data.jarak < jarakTerdekat) {
        jarakTerdekat = data.jarak;
        dataTerdekat = data;
      }
    }
  }
  print('${stopwatch.elapsed.toString().split(':')[2].split('.')[1]}');
  return jarakTerdekat;
}

solusi1() {
  final stopwatch = Stopwatch()..start();
  double jarakTerdekat = double.infinity;
  Data dataTerdekat;
  dataTrainig.forEach((data) {
    if (data.jarak > 3.0 && data.jarak < 8.0) {
      if (data.jarak < jarakTerdekat) {
        jarakTerdekat = data.jarak;
        dataTerdekat = data;
      }
    }
  });
  print('${stopwatch.elapsed.toString().split(':')[2].split('.')[1]}');
  return jarakTerdekat;
}
