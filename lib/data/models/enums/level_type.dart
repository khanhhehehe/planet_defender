enum AcademicType {
  a1('A1 [Beginner]'),
  a2('A2 [Elementary]'),
  b1('B1 [Lower-intermediate]'),
  b1Plus('B1+ [Intermediate]'),
  b2('B2 [Upper-intermediate]'),
  c1('C1 [Advanced]'),
  unknown("Unknown");

  final String name;
  const AcademicType(this.name);
}

enum IeltsType {
  ms1('5.0+'),
  ms2('6.0+'),
  ms3('7.0+'),
  unknown("Unknown");

  final String name;
  const IeltsType(this.name);
}

extension IeltsTypeEx on IeltsType {
  String get displayName {
    switch (this) {
      case IeltsType.ms1:
        return 'MS1';
      case IeltsType.ms2:
        return 'MS2';
      case IeltsType.ms3:
        return 'MS3';
      default:
        return '';
    }
  }
}

enum SelectTabLevelType {
  academic('Academic'),
  ielts('IELTS');

  final String name;
  const SelectTabLevelType(this.name);
}
