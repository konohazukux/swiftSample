import UIKit
import CoreLocation
import PlaygroundSupport

// Playgroundの実行を継続させる
PlaygroundPage.current.needsIndefiniteExecution = true

let geocoder = CLGeocoder()
let location = CLLocation(latitude: 35.5454965, longitude: 139.5153237)
let locale = Locale(identifier: "ja_JP")

geocoder.reverseGeocodeLocation(location, preferredLocale: locale) { placemarks, error in
    if let error = error {
        print("逆ジオコーディングエラー: \(error)")
        return
    }

    if let placemark = placemarks?.first {
     
      print( placemark.country)
      print( placemark.administrativeArea)
      print( placemark.subAdministrativeArea)
      print( placemark.locality)
      print( placemark.subLocality)
      print( placemark.thoroughfare)
      print( placemark.subThoroughfare)
      print( placemark.region)
      
        let address = [placemark.country, placemark.administrativeArea, placemark.locality, placemark.thoroughfare, placemark.subThoroughfare]
            .compactMap { $0 }
            .joined(separator: ", ")

        print("住所: \(address)")
    }

    // Playgroundの実行を終了
    PlaygroundPage.current.finishExecution()
}

