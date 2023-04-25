const String tableName = 'sample';

class Dav {
  final int? id;
  final String? movakelFirstname;
  final String? movakelLastname;
  final String? movakelNamepedar;
  final int? movakelKodemeli;
  final int? movakelShomareshenasname;
  final String? movakelAddres;
  final String? movakelshomaretamas;
  final int? parvandeShomareparvande;
  final int? parvandeShomareshobe;
  final int? parvandeShomarebaygani;
  final String? parvandeNamekhande;
  final String? parvandeMozooe;
  final String? parvandeMojtamaghazayi;
  final String? parvandeKholaseparvande;
  final String? khandeFirstname;
  final String? khandeLastname;
  final String? khandeNamepedar;
  final int? khandeKodemeli;
  final int? khandeShomareshenasname;
  final String? khandeAddres;
  final String? khandeshomaretamas;
  final int? gharardadShomarevekalatname;
  final String? gharardadTarikh;
  final int? gharardadMablaghkol;
  final int? gharardadPishpardakht;
  final String? gharardadTozihat;
  final int? parvandeEjrayiShomareparvandeejrayi;
  final String? parvandeEjrayiTozihat;

  const Dav(
      {this.id,
      this.movakelFirstname,
      this.movakelLastname,
      this.movakelNamepedar,
      this.movakelKodemeli,
      this.movakelShomareshenasname,
      this.movakelAddres,
      this.movakelshomaretamas,
      this.parvandeShomareparvande,
      this.parvandeShomareshobe,
      this.parvandeShomarebaygani,
      this.parvandeNamekhande,
      this.parvandeMozooe,
      this.parvandeMojtamaghazayi,
      this.parvandeKholaseparvande,
      this.khandeFirstname,
      this.khandeLastname,
      this.khandeNamepedar,
      this.khandeKodemeli,
      this.khandeShomareshenasname,
      this.khandeAddres,
      this.khandeshomaretamas,
      this.gharardadShomarevekalatname,
      this.gharardadTarikh,
      this.gharardadMablaghkol,
      this.gharardadPishpardakht,
      this.gharardadTozihat,
      this.parvandeEjrayiShomareparvandeejrayi,
      this.parvandeEjrayiTozihat});

  Dav copy({
    int? id,
    String? movakelFirstname,
    String? movakelLastname,
    String? movakelNamepedar,
    int? movakelKodemeli,
    int? movakelShomareshenasname,
    String? movakelAddres,
    String? movakelshomaretamas,
    int? parvandeShomareparvande,
    int? parvandeShomareshobe,
    int? parvandeShomarebaygani,
    String? parvandeNamekhande,
    String? parvandeMozooe,
    String? parvandeMojtamaghazayi,
    String? parvandeKholaseparvande,
    String? khandeFirstname,
    String? khandeLastname,
    String? khandeNamepedar,
    int? khandeKodemeli,
    int? khandeShomareshenasname,
    String? khandeAddres,
    String? khandeshomaretamas,
    int? gharardadShomarevekalatname,
    String? gharardadTarikh,
    int? gharardadMablaghkol,
    int? gharardadPishpardakht,
    String? gharardadTozihat,
    int? parvandeEjrayiShomareparvandeejrayi,
    String? parvandeEjrayiTozihat,
  }) =>
      Dav(
        id: id ?? this.id,
        movakelFirstname: movakelFirstname ?? this.movakelFirstname,
        movakelLastname: movakelLastname ?? this.movakelLastname,
        movakelNamepedar: movakelNamepedar ?? this.movakelNamepedar,
        movakelShomareshenasname:
            movakelShomareshenasname ?? this.movakelShomareshenasname,
        movakelKodemeli: movakelKodemeli ?? this.movakelKodemeli,
        movakelAddres: movakelAddres ?? this.movakelAddres,
        movakelshomaretamas: movakelshomaretamas ?? this.movakelshomaretamas,
        parvandeShomareparvande:
            parvandeShomareparvande ?? this.parvandeShomareparvande,
        parvandeShomareshobe: parvandeShomareshobe ?? this.parvandeShomareshobe,
        parvandeShomarebaygani:
            parvandeShomarebaygani ?? this.parvandeShomarebaygani,
        parvandeNamekhande: parvandeNamekhande ?? this.parvandeNamekhande,
        parvandeMozooe: parvandeMozooe ?? this.parvandeMozooe,
        parvandeMojtamaghazayi:
            parvandeMojtamaghazayi ?? this.parvandeMojtamaghazayi,
        parvandeKholaseparvande:
            parvandeKholaseparvande ?? this.parvandeKholaseparvande,
        khandeFirstname: khandeFirstname ?? this.khandeFirstname,
        khandeLastname: khandeLastname ?? this.khandeLastname,
        khandeNamepedar: khandeNamepedar ?? this.khandeNamepedar,
        khandeKodemeli: khandeKodemeli ?? this.khandeKodemeli,
        khandeShomareshenasname:
            khandeShomareshenasname ?? this.khandeShomareshenasname,
        khandeAddres: khandeAddres ?? this.khandeAddres,
        khandeshomaretamas: khandeshomaretamas ?? this.khandeshomaretamas,
        gharardadShomarevekalatname:
            gharardadShomarevekalatname ?? this.gharardadShomarevekalatname,
        gharardadTarikh: gharardadTarikh ?? this.gharardadTarikh,
        gharardadMablaghkol: gharardadMablaghkol ?? this.gharardadMablaghkol,
        gharardadPishpardakht:
            gharardadPishpardakht ?? this.gharardadPishpardakht,
        gharardadTozihat: gharardadTozihat ?? this.gharardadTozihat,
        parvandeEjrayiShomareparvandeejrayi:
            parvandeEjrayiShomareparvandeejrayi ??
                this.parvandeEjrayiShomareparvandeejrayi,
        parvandeEjrayiTozihat:
            parvandeEjrayiTozihat ?? this.parvandeEjrayiTozihat,
      );

  static Dav fromJson(Map<String, Object?> json) => Dav(
        id: json['id'] as int?,
        movakelFirstname: json['movakel_firstname'] as String?,
        movakelLastname: json['movakel_lastname'] as String?,
        movakelNamepedar: json['movakel_namepedar'] as String?,
        movakelKodemeli: int.parse(json['movakel_kodemeli'] as String),
        movakelShomareshenasname:
            int.parse(json['movakel_shomareshenasname'] as String),
        movakelAddres: json['movakel_addres'] as String?,
        movakelshomaretamas: json['movakel_shomaretamas'] as String?,
        parvandeShomareparvande:
            int.parse(json['parvande_shomareparvande'] as String),
        parvandeShomareshobe:
            int.parse(json['parvande_shomareshobe'] as String),
        parvandeShomarebaygani:
            int.parse(json['parvande_shomarebaygani'] as String),
        parvandeNamekhande: json['parvande_namekhande'] as String?,
        parvandeMozooe: json['parvande_mozooe'] as String?,
        parvandeMojtamaghazayi: json['parvande_mojtamaghazayi'] as String?,
        parvandeKholaseparvande: json['parvande_kholaseparvande'] as String?,
        khandeFirstname: json['khande_firstname'] as String?,
        khandeLastname: json['khande_lastname'] as String?,
        khandeNamepedar: json['khande_namepedar'] as String?,
        khandeKodemeli: int.parse(json['khande_kodemeli'] as String),
        khandeShomareshenasname:
            int.parse(json['khande_shomareshenasname'] as String),
        khandeAddres: json['khande_addres'] as String?,
        khandeshomaretamas: json['khande_shomaretamas'] as String?,
        gharardadShomarevekalatname:
            int.parse(json['gharardad_shomarevekalatname'] as String),
        gharardadTarikh: json['gharardad_tarikh'] as String?,
        gharardadMablaghkol: int.parse(json['gharardad_mablaghkol'] as String),
        gharardadPishpardakht:
            int.parse(json['gharardad_pishpardakht'] as String),
        gharardadTozihat: json['gharardad_tozihat'] as String?,
        parvandeEjrayiShomareparvandeejrayi:
            int.parse(json['parvandeEjrayi_shomareparvandeejrayi'] as String),
        parvandeEjrayiTozihat: json['parvandeEjrayi_tozihat'] as String?,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'movakel_firstname': movakelFirstname,
        'movakel_lastname': movakelLastname,
        'movakel_namepedar': movakelNamepedar,
        'movakel_kodemeli': movakelKodemeli,
        'movakel_shomareshenasname': movakelShomareshenasname,
        'movakel_addres': movakelAddres,
        'movakel_shomaretamas': movakelshomaretamas,
        'parvande_shomareparvande': parvandeShomareparvande,
        'parvande_shomareshobe': parvandeShomareshobe,
        'parvande_shomarebaygani': parvandeShomarebaygani,
        'parvande_namekhande': parvandeNamekhande,
        'parvande_mozooe': parvandeMozooe,
        'parvande_mojtamaghazayi': parvandeMojtamaghazayi,
        'parvande_kholaseparvande': parvandeKholaseparvande,
        'khande_firstname': khandeFirstname,
        'khande_lastname': khandeLastname,
        'khande_namepedar': khandeNamepedar,
        'khande_kodemeli': khandeKodemeli,
        'khande_shomareshenasname': khandeShomareshenasname,
        'khande_addres': khandeAddres,
        'khande_shomaretamas': khandeshomaretamas,
        'gharardad_shomarevekalatname': gharardadShomarevekalatname,
        'gharardad_tarikh': gharardadTarikh,
        'gharardad_mablaghkol': gharardadMablaghkol,
        'gharardad_pishpardakht': gharardadPishpardakht,
        'gharardad_tozihat': gharardadTozihat,
        'parvandeEjrayi_shomareparvandeejrayi':
            parvandeEjrayiShomareparvandeejrayi,
        'parvandeEjrayi_tozihat': parvandeEjrayiTozihat,
      };
}

class DavFields {
  static final List<String> values = [
    id,
    movakelFirstname,
    movakelLastname,
    movakelNamepedar,
    movakelKodemeli,
    movakelShomareshenasname,
    movakelAddres,
    movakelshomaretamas,
    parvandeShomareparvande,
    parvandeShomareshobe,
    parvandeShomarebaygani,
    parvandeNamekhande,
    parvandeMozooe,
    parvandeMojtamaghazayi,
    parvandeKholaseparvande,
    khandeFirstname,
    khandeLastname,
    khandeNamepedar,
    khandeKodemeli,
    khandeShomareshenasname,
    khandeAddres,
    khandeshomaretamas,
    gharardadShomarevekalatname,
    gharardadTarikh,
    gharardadMablaghkol,
    gharardadPishpardakht,
    gharardadTozihat,
    parvandeEjrayiShomareparvandeejrayi,
    parvandeEjrayiTozihat,
  ];

  static const String id = 'id';
  static const String movakelFirstname = 'movakel_firstname';
  static const String movakelLastname = 'movakel_lastname';
  static const String movakelNamepedar = 'movakel_namepedar';
  static const String movakelKodemeli = 'movakel_kodemeli';
  static const String movakelShomareshenasname = 'movakel_shomareshenasname';
  static const String movakelAddres = 'movakel_addres';
  static const String movakelshomaretamas = 'movakel_shomaretamas';
  static const String parvandeShomareparvande = 'parvande_shomareparvande';
  static const String parvandeShomareshobe = 'parvande_shomareshobe';
  static const String parvandeShomarebaygani = 'parvande_shomarebaygani';
  static const String parvandeNamekhande = 'parvande_namekhande';
  static const String parvandeMozooe = 'parvande_mozooe';
  static const String parvandeMojtamaghazayi = 'parvande_mojtamaghazayi';
  static const String parvandeKholaseparvande = 'parvande_kholaseparvande';
  static const String khandeFirstname = 'khande_firstname';
  static const String khandeLastname = 'khande_lastname';
  static const String khandeNamepedar = 'khande_namepedar';
  static const String khandeKodemeli = 'khande_kodemeli';
  static const String khandeShomareshenasname = 'khande_shomareshenasname';
  static const String khandeAddres = 'khande_addres';
  static const String khandeshomaretamas = 'khande_shomaretamas';
  static const String gharardadShomarevekalatname =
      'gharardad_shomarevekalatname';
  static const String gharardadTarikh = 'gharardad_tarikh';
  static const String gharardadMablaghkol = 'gharardad_mablaghkol';
  static const String gharardadPishpardakht = 'gharardad_pishpardakht';
  static const String gharardadTozihat = 'gharardad_tozihat';
  static const String parvandeEjrayiShomareparvandeejrayi =
      'parvandeEjrayi_shomareparvandeejrayi';
  static const String parvandeEjrayiTozihat = 'parvandeEjrayi_tozihat';
}
