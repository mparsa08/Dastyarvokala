const String tableName = 'alarm';

class Alarm {
  final int? id;
  final String? onvan;
  final String? movakelname;
  final String? mahalmoraje;
  final String? tozihat;
  final String? ghazi;
  final String? shomareparvande;
  final String? tarikh;

  const Alarm({
    this.id,
    this.onvan,
    this.movakelname,
    this.mahalmoraje,
    this.tozihat,
    this.ghazi,
    this.shomareparvande,
    this.tarikh,
  });

  Alarm copy({
    int? id,
    String? onvan,
    String? movakelname,
    String? mahalmoraje,
    String? tozihat,
    String? ghazi,
    String? shomareparvande,
    String? tarikh,
  }) =>
      Alarm(
        id: id ?? this.id,
        onvan: onvan ?? this.onvan,
        movakelname: movakelname ?? this.movakelname,
        mahalmoraje: mahalmoraje ?? this.mahalmoraje,
        tozihat: tozihat ?? this.tozihat,
        ghazi: ghazi ?? this.ghazi,
        shomareparvande: shomareparvande ?? this.shomareparvande,
        tarikh: tarikh ?? this.tarikh,
      );

  static Alarm fromJson(Map<String, Object?> json) => Alarm(
        id: json['id'] as int?,
        onvan: json['onvan'] as String?,
        movakelname: json['movakelname'] as String?,
        mahalmoraje: json['mahalmoraje'] as String?,
        tozihat: json['tozihat'] as String?,
        ghazi: json['ghazi'] as String?,
        shomareparvande: json['shomareparvande'] as String?,
        tarikh: json['tarikh'] as String?,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'onvan': onvan,
        'movakelname': movakelname,
        'mahalmoraje': mahalmoraje,
        'tozihat': tozihat,
        'ghazi': ghazi,
        'shomareparvande': shomareparvande,
        'tarikh': tarikh,
      };
}

class AlarmFields {
  static final List<String> values = [
    id,
    onvan,
    movakelname,
    mahalmoraje,
    tozihat,
    ghazi,
    shomareparvande,
    tarikh,
  ];

  static const String id = 'id';
  static const String onvan = 'onvan';
  static const String movakelname = 'movakelname';
  static const String mahalmoraje = 'mahalmoraje';
  static const String tozihat = 'tozihat';
  static const String ghazi = 'ghazi';
  static const String shomareparvande = 'shomareparvande';
  static const String tarikh = 'tarikh';
}
