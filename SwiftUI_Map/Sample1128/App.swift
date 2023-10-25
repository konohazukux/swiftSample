import SwiftUI
import Combine
import MapKit

@main
struct MapTestApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

struct ContentView: View {
  
  @State var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
      latitude: 37.331516,
      longitude: -121.891054),
    span: MKCoordinateSpan(
      latitudeDelta: 0.1,
      longitudeDelta: 0.1)
  )
  
  var body: some View {
    VStack {
      Map(coordinateRegion: $region)
        .padding(30)
      Spacer()
    }
  }
}

