// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter_aws_rekognition/src/helpers/as_t.dart';

void main() {
  final List<SDMap> t = <SDMap>[
    <String, dynamic>{'Type': 'eyeLeft', 'X': 0.38549351692199707, 'Y': 0.3959200084209442},
    <String, dynamic>{'Type': 'eyeRight', 'X': 0.5773905515670776, 'Y': 0.394561767578125},
    <String, dynamic>{'Type': 'mouthLeft', 'X': 0.40410104393959045, 'Y': 0.6479480862617493},
    <String, dynamic>{'Type': 'mouthRight', 'X': 0.5623446702957153, 'Y': 0.647117555141449},
    <String, dynamic>{'Type': 'nose', 'X': 0.47763553261756897, 'Y': 0.5337067246437073},
    <String, dynamic>{'Type': 'leftEyeBrowLeft', 'X': 0.3114689588546753, 'Y': 0.3376390337944031},
    <String, dynamic>{'Type': 'leftEyeBrowRight', 'X': 0.4224424660205841, 'Y': 0.3232649564743042},
    <String, dynamic>{'Type': 'leftEyeBrowUp', 'X': 0.36654090881347656, 'Y': 0.3104579746723175},
    <String, dynamic>{'Type': 'rightEyeBrowLeft', 'X': 0.5353175401687622, 'Y': 0.3223199248313904},
    <String, dynamic>{'Type': 'rightEyeBrowRight', 'X': 0.6546239852905273, 'Y': 0.3348073363304138},
    <String, dynamic>{'Type': 'rightEyeBrowUp', 'X': 0.5936762094497681, 'Y': 0.3080498278141022},
    <String, dynamic>{'Type': 'leftEyeLeft', 'X': 0.3524211347103119, 'Y': 0.3936865031719208},
    <String, dynamic>{'Type': 'leftEyeRight', 'X': 0.4229775369167328, 'Y': 0.3973258435726166},
    <String, dynamic>{'Type': 'leftEyeUp', 'X': 0.38467878103256226, 'Y': 0.3836822807788849},
    <String, dynamic>{'Type': 'leftEyeDown', 'X': 0.38629674911499023, 'Y': 0.40618783235549927},
    <String, dynamic>{'Type': 'rightEyeLeft', 'X': 0.5374732613563538, 'Y': 0.39637991786003113},
    <String, dynamic>{'Type': 'rightEyeRight', 'X': 0.609208345413208, 'Y': 0.391626238822937},
    <String, dynamic>{'Type': 'rightEyeUp', 'X': 0.5750962495803833, 'Y': 0.3821527063846588},
    <String, dynamic>{'Type': 'rightEyeDown', 'X': 0.5740782618522644, 'Y': 0.40471214056015015},
    <String, dynamic>{'Type': 'noseLeft', 'X': 0.4441811740398407, 'Y': 0.5608476400375366},
    <String, dynamic>{'Type': 'noseRight', 'X': 0.5155643820762634, 'Y': 0.5569332242012024},
    <String, dynamic>{'Type': 'mouthUp', 'X': 0.47968366742134094, 'Y': 0.6176465749740601},
    <String, dynamic>{'Type': 'mouthDown', 'X': 0.4807897210121155, 'Y': 0.690782368183136},
    <String, dynamic>{'Type': 'leftPupil', 'X': 0.38549351692199707, 'Y': 0.3959200084209442},
    <String, dynamic>{'Type': 'rightPupil', 'X': 0.5773905515670776, 'Y': 0.394561767578125},
    <String, dynamic>{'Type': 'upperJawlineLeft', 'X': 0.27245330810546875, 'Y': 0.3902156949043274},
    <String, dynamic>{'Type': 'midJawlineLeft', 'X': 0.31561678647994995, 'Y': 0.6596118807792664},
    <String, dynamic>{'Type': 'chinBottom', 'X': 0.48385748267173767, 'Y': 0.8160444498062134},
    <String, dynamic>{'Type': 'midJawlineRight', 'X': 0.6625112891197205, 'Y': 0.656606137752533},
    <String, dynamic>{'Type': 'upperJawlineRight', 'X': 0.7042999863624573, 'Y': 0.3863988518714905},
  ];

  final List<SDMap> t2 = <SDMap>[
    <String, dynamic>{'Confidence': 0.042965151369571686, 'Type': 'DISGUSTED'},
    <String, dynamic>{'Confidence': 0.002022328320890665, 'Type': 'HAPPY'},
    <String, dynamic>{'Confidence': 0.4482877850532532, 'Type': 'SURPRISED'},
    <String, dynamic>{'Confidence': 0.007082826923578978, 'Type': 'ANGRY'},
    <String, dynamic>{'Confidence': 0, 'Type': 'CONFUSED'},
    <String, dynamic>{'Confidence': 99.47616577148438, 'Type': 'CALM'},
    <String, dynamic>{'Confidence': 0.017732391133904457, 'Type': 'SAD'}
  ];

  print('switch(this){');

  // t2.map<String>(
  //   (SDMap d) {
  //     final String type = d['Type'].toString();
  //     print("case '$type':\n return EmotionsType.$type;");
  //     return '';
  //   },
  // ).toList();

  t2.map<String>(
    (SDMap d) {
      final String type = d['Type'].toString();
      print("case EmotionsType.$type:\n return '$type';");
      return '';
    },
  ).toList();

  print('}');
}
