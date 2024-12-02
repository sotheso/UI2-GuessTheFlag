//
//  ContentView.swift
//  UI2-GuessTheFlag
//
//  Created by Sothesom on 12/09/1403.
//

import SwiftUI

struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria","Poland","Spain", "UK", "Ukraine"] .shuffled()
    @State var correntAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: .blue , location: 0.3),
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45 ) , location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack(spacing:30){
                Spacer()

                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color(red: 0.1, green: 0.2, blue: 0.45 ))
                VStack{
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy ))
                    Text(countries[correntAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3) {number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .clipShape(.buttonBorder)
                            .shadow(radius: 15)
                    }
                }
                Spacer()
                Spacer()
                Text(":امتیاز")
                    .foregroundStyle(.white)
                    .font(.title2.bold() )
                
                Spacer()

            }
            .padding()
        }
        .alert(scoreTitle ,isPresented: $showingScore){
            Button("سوال بعدی", action: AskQ)
        } message: {
            Text("امتیاز شما ؟؟" )
        }
    }
    
    func flagTapped(_ nubmer: Int) {
        if correntAnswer == nubmer {
            scoreTitle = "درسته"
        } else {
            scoreTitle = "غلط"
        }
        showingScore = true
    }
    
    func AskQ() {
        countries.shuffle()
        correntAnswer = Int.random(in: 0...2)
    }
}
#Preview {
    ContentView()
}
