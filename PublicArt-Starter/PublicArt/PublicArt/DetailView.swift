//
//  DetailView.swift
//  RestaurantMenu
//
//  Created by James OMahoney on 11/27/21.
//  Copyright © 2021 Gautham Ilango. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let artwork: Artwork
    @State private var showMap = false
    
    var body: some View {
        VStack {
            Image(artwork.imageName)
                .resizable()
                .frame(maxWidth: 300, maxHeight: 600)
                .aspectRatio(contentMode: .fit)
            Text("\(artwork.reaction)  \(artwork.title)")
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            HStack {
                Button(action: { self.showMap = true }) {
                    Image(systemName: "mappin.and.ellipse")
                }
                .sheet(isPresented: $showMap) {
                    //          MapView(coordinate: self.artwork.coordinate)
                    LocationMap(showModal: self.$showMap, artwork: self.artwork)
                }
                Text(artwork.locationName)
                    .font(.subheadline)
            }
            
            Text("Artist: \(artwork.artist)")
                .font(.subheadline)
            Divider()
            Text(artwork.description)
                .multilineTextAlignment(.leading)
                .lineLimit(20)
        }
        .padding()
        .navigationBarTitle(Text(artwork.title), displayMode: .inline)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(artwork: artData[0])
    }
}
