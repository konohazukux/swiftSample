//
//  ElementarySchoolDistrict.swift
//  MapApp
//

import MapKit

class ElementarySchoolDistrict {
    /// 小学校区ID
    let id: String

    /// 都道府県コード (2桁の文字列)
    let prefectureCode: String

    /// 市区町村コード (5桁の文字列)
    let municipalityCode: String

    /// 小学校名 (最大64文字)
    let schoolName: String

    /// エリア: ポリゴン
    let area: MKPolygon

    init(id: String, prefectureCode: String, municipalityCode: String, schoolName: String, area: MKPolygon) {
        self.id = id
        self.prefectureCode = prefectureCode
        self.municipalityCode = municipalityCode
        self.schoolName = schoolName
        self.area = area
    }

    // その他のメソッドや機能をここに追加することができます。
}

// 使用例
// let coordinates = [CLLocationCoordinate2D(latitude: 緯度, longitude: 経度), ...]
// let polygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
// let district = ElementarySchoolDistrict(id: "1", prefectureCode: "13", municipalityCode: "13101", schoolName: "東京小学校", area: polygon)

extension ElementarySchoolDistrict {
  
  /// 市区町村コードと市区町村名のディクショナリ
  static let municipalityCodeToName: [String: String] = [
      "131016": "東京都千代田区",
      "131024": "東京都中央区",
      "131032": "東京都港区",
      "131041": "東京都新宿区",
      "131059": "東京都文京区",
      "131067": "東京都台東区",
      "131075": "東京都墨田区",
      "131083": "東京都江東区",
      "131091": "東京都品川区",
      "131105": "東京都目黒区",
      "131113": "東京都大田区",
      "131121": "東京都世田谷区",
      "131130": "東京都渋谷区",
      "131148": "東京都中野区",
      "131156": "東京都杉並区",
      "131164": "東京都豊島区",
      "131172": "東京都北区",
      "131181": "東京都荒川区",
      "131199": "東京都板橋区",
      "131202": "東京都練馬区"
      // 他の市区町村コードと名前をここに追加
  ]
}
