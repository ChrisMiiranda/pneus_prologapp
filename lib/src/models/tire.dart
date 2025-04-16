class Tire {
  final int id;
  final String? serialNumber;
  final String? additionalId;
  final String? companyGroupName;
  final String? branchOfficeName;
  final int? currentLifeCycle;
  final int? timesRetreaded;
  final int? maxRetreadsExpected;
  final int? recommendedPressure;
  final int? currentPressure;
  final double? middleInnerTreadDepth;
  final double? outerTreadDepth;
  final double? middleOuterTreadDepth;
  final double? innerTreadDepth;
  final String? dot;
  final bool? newTire;
  final String? status;
  final String? createdAt;

  final TireSize? tireSize;
  final Make? make;
  final Model? model;
  final Retread? currentRetread;
  final Installation? installed;
  final Disposal? disposal;
  final Analysis? analysis;
  final List<RegistrationImage> registrationImages;

  Tire({
    required this.id,
    this.serialNumber,
    this.additionalId,
    this.companyGroupName,
    this.branchOfficeName,
    this.currentLifeCycle,
    this.timesRetreaded,
    this.maxRetreadsExpected,
    this.recommendedPressure,
    this.currentPressure,
    this.middleInnerTreadDepth,
    this.outerTreadDepth,
    this.middleOuterTreadDepth,
    this.innerTreadDepth,
    this.dot,
    this.newTire,
    this.status,
    this.createdAt,
    this.tireSize,
    this.make,
    this.model,
    this.currentRetread,
    this.installed,
    this.disposal,
    this.analysis,
    required this.registrationImages,
  });

  factory Tire.fromJson(Map<String, dynamic> json) {
    return Tire(
      id: json['id'] as int,
      serialNumber: json['serialNumber'] as String?,
      additionalId: json['additionalId'] as String?,
      companyGroupName: json['companyGroupName'] as String?,
      branchOfficeName: json['branchOfficeName'] as String?,
      currentLifeCycle: (json['currentLifeCycle'] as num?)?.toInt(),
      timesRetreaded: (json['timesRetreaded'] as num?)?.toInt(),
      maxRetreadsExpected: (json['maxRetreadsExpected'] as num?)?.toInt(),
      recommendedPressure: (json['recommendedPressure'] as num?)?.toInt(),
      currentPressure: (json['currentPressure'] as num?)?.toInt(),
      middleInnerTreadDepth: (json['middleInnerTreadDepth'] as num?)?.toDouble(),
      outerTreadDepth: (json['outerTreadDepth'] as num?)?.toDouble(),
      middleOuterTreadDepth: (json['middleOuterTreadDepth'] as num?)?.toDouble(),
      innerTreadDepth: (json['innerTreadDepth'] as num?)?.toDouble(),
      dot: json['dot'] as String?,
      newTire: json['newTire'] as bool?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      tireSize: json['tireSize'] != null ? TireSize.fromJson(json['tireSize']) : null,
      make: json['make'] != null ? Make.fromJson(json['make']) : null,
      model: json['model'] != null ? Model.fromJson(json['model']) : null,
      currentRetread: json['currentRetread'] != null ? Retread.fromJson(json['currentRetread']) : null,
      installed: json['installed'] != null ? Installation.fromJson(json['installed']) : null,
      disposal: json['disposal'] != null ? Disposal.fromJson(json['disposal']) : null,
      analysis: json['analysis'] != null ? Analysis.fromJson(json['analysis']) : null,
      registrationImages: (json['registrationImages'] as List? ?? [])
          .map((i) => RegistrationImage.fromJson(i))
          .toList(),
    );
  }
}

class TireSize {
  final int id;
  final int? height;
  final int? width;
  final double? rim;

  TireSize({
    required this.id,
    this.height,
    this.width,
    this.rim,
  });

  factory TireSize.fromJson(Map<String, dynamic> json) {
    return TireSize(
      id: json['id'] as int,
      height: (json['height'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      rim: (json['rim'] as num?)?.toDouble(),
    );
  }
}

class Make {
  final int id;
  final String? name;

  Make({required this.id, this.name});

  factory Make.fromJson(Map<String, dynamic> json) {
    return Make(
      id: json['id'] as int,
      name: json['name'] as String?,
    );
  }
}

class Model {
  final int id;
  final String? name;
  final int? groovesQuantity;
  final int? treadDepth;

  Model({
    required this.id,
    this.name,
    this.groovesQuantity,
    this.treadDepth,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'] as int,
      name: json['name'] as String?,
      groovesQuantity: (json['groovesQuantity'] as num?)?.toInt(),
      treadDepth: (json['treadDepth'] as num?)?.toInt(),
    );
  }
}

class Retread {
  final Make? make;
  final Model? model;
  final int? retreadCost;

  Retread({
    this.make,
    this.model,
    this.retreadCost,
  });

  factory Retread.fromJson(Map<String, dynamic> json) {
    return Retread(
      make: json['make'] != null ? Make.fromJson(json['make']) : null,
      model: json['model'] != null ? Model.fromJson(json['model']) : null,
      retreadCost: (json['retreadCost'] as num?)?.toInt(),
    );
  }
}

class Installation {
  final int? vehicleId;
  final String? licensePlate;
  final String? fleetId;
  final int? installedPosition;
  final String? installedPositionName;

  Installation({
    this.vehicleId,
    this.licensePlate,
    this.fleetId,
    this.installedPosition,
    this.installedPositionName,
  });

  factory Installation.fromJson(Map<String, dynamic> json) {
    return Installation(
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
      licensePlate: json['licensePlate'] as String?,
      fleetId: json['fleetId'] as String?,
      installedPosition: (json['installedPosition'] as num?)?.toInt(),
      installedPositionName: json['installedPositionName'] as String?,
    );
  }
}

class Disposal {
  final int? disposalReasonId;
  final String? disposalReasonDescription;
  final List<String> disposalImagesUrl;

  Disposal({
    this.disposalReasonId,
    this.disposalReasonDescription,
    required this.disposalImagesUrl,
  });

  factory Disposal.fromJson(Map<String, dynamic> json) {
    return Disposal(
      disposalReasonId: (json['disposalReasonId'] as num?)?.toInt(),
      disposalReasonDescription: json['disposalReasonDescription'] as String?,
      disposalImagesUrl: List<String>.from(json['disposalImagesUrl'] ?? []),
    );
  }
}

class Analysis {
  final int? recapperId;
  final String? recapperName;
  final String? recapperPickUpId;
  final String? reason;

  Analysis({
    this.recapperId,
    this.recapperName,
    this.recapperPickUpId,
    this.reason,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      recapperId: (json['recapperId'] as num?)?.toInt(),
      recapperName: json['recapperName'] as String?,
      recapperPickUpId: json['recapperPickUpId'] as String?,
      reason: json['reason'] as String?,
    );
  }
}

class RegistrationImage {
  final int id;
  final String? url;

  RegistrationImage({required this.id, this.url});

  factory RegistrationImage.fromJson(Map<String, dynamic> json) {
    return RegistrationImage(
      id: json['id'] as int,
      url: json['url'] as String?,
    );
  }
}
