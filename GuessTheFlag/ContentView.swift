//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jared Thompkins on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = " "
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Polland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 8) {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                    }
                }
                .padding(.top, 15.0)
                
                
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    func flagTapped(_ number1: Int) {
        if number1 == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Incorrect"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}





    
    
    
    
    
    







    




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
