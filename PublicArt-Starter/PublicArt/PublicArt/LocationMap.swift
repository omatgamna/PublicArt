/// Copyright (c) 2019 Razeware LLC


import SwiftUI

struct LocationMap: View {
  @Binding var showModal: Bool
  var artwork: Artwork

  var body: some View {
    VStack {
      MapView(coordinate: artwork.coordinate)
      HStack {
        Text(self.artwork.locationName)
        Spacer()
        Button("Done") { self.showModal = false }
      }
      .padding()
    }
  }
}

struct LocationMap_Previews: PreviewProvider {
  static var previews: some View {
    LocationMap(showModal: .constant(true), artwork: artData[0])
  }
}
