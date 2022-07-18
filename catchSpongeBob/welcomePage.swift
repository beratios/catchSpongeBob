//
//  welcomePage.swift
//  catchSpongeBob
//
//  Created by Berat Gültekin on 29.06.2022.
//

import SwiftUI

struct welcomePage: View {
    @State private var willMoveToNextScreen = false
    var body: some View {
        NavigationView {
            
        
        VStack{
            Spacer()
            Image("sponge")
                .resizable()
                .frame(width: 100, height: 150)
            Text("Catch Sponge Bob")
                .font(.largeTitle)
            Spacer()
//            Button {
//                //
//
//            } label: {
//                Text("Play")
//            }   .font(.largeTitle)
            NavigationLink(destination: ContentView()) {
                                Text("Play")}
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 7)

            
            Spacer()
            
        }
        
        
    }
}
}

struct welcomePage_Previews: PreviewProvider {
    static var previews: some View {
        welcomePage()
    }
}
