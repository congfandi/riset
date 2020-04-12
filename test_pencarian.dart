/*
 * test_pencarian.dart
 * Created by Cong Fandi on 17/3/2020
 * Email : congfandi@gmail.com
 * Copyright © 2020 Cong Fandi. All rights reserved.
 */
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:planimal/utils/convert_price.dart';

void main() {

//simulasi jika ada 10.000 data
//asumsi data yang ada dalam area adalah diatas 3 dan dibawah 8
//jarak terkecil yang akan diambil

  for (var i = 0; i < 10000; i++) {
//    generate 10k Data
    dataTrainig
        .add(new Data(lat: i, lang: i, jarak: new Random().nextDouble() * 10));
  }

  for (var i = 0; i < 100; i++) {
//    finding Solution
    final stopwatch = Stopwatch()..start();
//        solusi1();
//        solusi2();
//        solusi3();
//        solusi4();
        solusi5(double.infinity, 0, new Data());
    print('${stopwatch.elapsed.toString().split(':')[2].split('.')[1]}');
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

final dataTrainig = [];

solusi5(double jarakTerdekat, int index, Data dataTerdekat) {
  if (index < dataTrainig.length - 1) {
    if (jarakTerdekat > dataTrainig[index].jarak) {
      jarakTerdekat = dataTrainig[index].jarak;
      dataTerdekat = dataTrainig[index];
      index++;
      solusi5(jarakTerdekat, index, dataTerdekat);
    } else {
      index++;
      solusi5(jarakTerdekat, index, dataTerdekat);
    }
  } else {
    jarakTerdekat = dataTerdekat.jarak;
  }
  return jarakTerdekat;
}

solusi4() {
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
  return jarakTerdekat;
}

solusi3() {
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
  return jarakTerdekat;
}

solusi2() {
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
  return jarakTerdekat;
}

solusi1() {
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
  return jarakTerdekat;
}
