//
//  ContentView.swift
//  catchSpongeBob
//
//  Created by Berat Gültekin on 24.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var timeLeft = 10
    @State var chosenX = 200
    @State var chosenY = 300
    @State var makeAlert = false
    // position tuples
    let (x1,y1) = (200,200)
    let (x2,y2) = (70,200)
    let (x3,y3) = (300,200)
    let (x4,y4) = (200,370)
    let (x5,y5) = (70,370)
    let (x6,y6) = (300,370)
    let (x7,y7) = (200,300)
    let (x8,y8) = (70,300)
    let (x9,y9) = (300,300)
    
    var counterTimer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            //
            if self.timeLeft < 1 {
                self.makeAlert = true
                
            } else {
                self.timeLeft -= 1
            }
            
        }
    }
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            //
            let tuppleArray = [(self.x1,self.y1),(self.x2,self.y2),(self.x3,self.y3),(self.x4,self.y4),(self.x5,self.y5),(self.x6,self.y6),(self.x7,self.y7),(self.x8,self.y8),(self.x9,self.y9)]
            
            var previosNumber : Int?
            func randomNumberGenerator() -> Int {
                var randomNumber = Int(arc4random_uniform(UInt32(tuppleArray.count - 1 )))
                while previosNumber == randomNumber {
                    randomNumber = Int(arc4random_uniform(UInt32(tuppleArray.count - 1 )))
                }
                previosNumber = randomNumber
                return randomNumber
            }
            self.chosenX = tuppleArray[randomNumberGenerator()].0
            self.chosenY = tuppleArray[randomNumberGenerator()].1
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Catch The Sponge Bob")
                .font(.largeTitle)
                .padding(20)
            HStack{
                Text("Time Left:")
                    .font(.title)
                    .padding()
                Text(String(self.timeLeft))
                    .font(.title)
            }
            HStack{
                Text("Score:")
                    .font(.title)
                Text(String(self.score))
                    .font(.title)
                    
            }
            Spacer()
            Image("sponge")
                .resizable()
                .frame(width: 100, height: 150)
                .position(x: CGFloat(self.chosenX), y: CGFloat(self.chosenY))
                .gesture(TapGesture(count: 1).onEnded({ (_) in
                    //
                    self.score += 1
                }))
                .onAppear {
                    _ = self.timer
                    _ = self.counterTimer
                    
                }
            Spacer()
        }.alert(isPresented: $makeAlert) {
            return Alert(title: Text("Time Finished"), message: Text("Do You Wanna Play Again?"), primaryButton: Alert.Button.default(Text("OK"), action: {
                // ok button action
               
                self.score = 0
                self.timeLeft = 10
            }), secondaryButton: Alert.Button.cancel())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 13 mini")
    }
}
