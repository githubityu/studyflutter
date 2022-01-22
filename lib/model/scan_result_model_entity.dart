// To parse this JSON data, do
//
//     final scanResultModelEntity = scanResultModelEntityFromJson(jsonString);

import 'dart:convert';

import 'package:studyflutter/remote/dio_flutter_transformer.dart';

ScanResultModelEntity scanResultModelEntityFromJson(String str) => ScanResultModelEntity.fromJson(parseJson(str));

String scanResultModelEntityToJson(ScanResultModelEntity data) => json.encode(data.toJson());

class ScanResultModelEntity {
	ScanResultModelEntity({
		this.state,
		this.name,
		this.companyList,
		this.list,
		this.proCompanyid,
		this.proCode,
		this.classifyCode,
		this.articleCode,
		this.myLotNumber,
		this.date,
		this.codeUnit,
		this.company,
		this.industry,
		this.productCode,
		this.classification,
		this.force,
		this.kaifeng,
		this.content,
		this.forceData,
		this.invalid,
		this.logo,
	});

	String? state;
	String? name;
	CompanyList? companyList;
	ListClass? list;
	String? proCompanyid;
	String? proCode;
	String? classifyCode;
	String? articleCode;
	String? myLotNumber;
	String? date;
	String? codeUnit;
	String? company;
	String? industry;
	String? productCode;
	String? classification;
	String? force;
	String? kaifeng;
	String? content;
	String? forceData;
	String? invalid;
	String? logo;

	factory ScanResultModelEntity.fromJson(Map<String, dynamic> json) => ScanResultModelEntity(
		state: json["state"],
		name: json["name"],
		companyList: CompanyList.fromJson(json["company_list"]),
		list: ListClass.fromJson(json["list"]),
		proCompanyid: json["pro_companyid"],
		proCode: json["pro_code"],
		classifyCode: json["classify_code"],
		articleCode: json["article_code"],
		myLotNumber: json["my_lot_number"],
		date: json["date"],
		codeUnit: json["code_unit"],
		company: json["company"],
		industry: json["industry"],
		productCode: json["product_code"],
		classification: json["classification"],
		force: json["force"],
		kaifeng: json["kaifeng"],
		content: json["content"],
		forceData: json["force_data"],
		invalid: json["invalid"],
		logo: json["logo"],
	);

	Map<String, dynamic> toJson() => {
		"state": state,
		"name": name,
		"company_list": companyList?.toJson(),
		"list": list?.toJson(),
		"pro_companyid": proCompanyid,
		"pro_code": proCode,
		"classify_code": classifyCode,
		"article_code": articleCode,
		"my_lot_number": myLotNumber,
		"date": date,
		"code_unit": codeUnit,
		"company": company,
		"industry": industry,
		"product_code": productCode,
		"classification": classification,
		"force": force,
		"kaifeng": kaifeng,
		"content": content,
		"force_data": forceData,
		"invalid": invalid,
		"logo": logo,
	};
}

class CompanyList {
	CompanyList({
		this.companyname,
		this.brand,
		this.url,
	});

	String? companyname;
	String? brand;
	String? url;

	factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
		companyname: json["companyname"],
		brand: json["brand"],
		url: json["url"],
	);

	Map<String, dynamic> toJson() => {
		"companyname": companyname,
		"brand": brand,
		"url": url,
	};
}

class ListClass {
	ListClass({
		this.leibie,
		this.proCompany,
		this.proCode,
	});

	String? leibie;
	String? proCompany;
	String? proCode;

	factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
		leibie: json["leibie"],
		proCompany: json["pro_company"],
		proCode: json["pro_code"],
	);

	Map<String, dynamic> toJson() => {
		"leibie": leibie,
		"pro_company": proCompany,
		"pro_code": proCode,
	};
}
