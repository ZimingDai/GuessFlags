//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by phoenix Dai on 2020/9/26.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Ireland", "Italy", "Nigeria", "Poland", "Russia"]
    @State var correctAnswer = Int.random(in: 0...2) // Int类型的随机数
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
//            Color.blue.edgesIgnoringSafeArea(.all) // 忽略屏幕边缘
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        flagTapped(number)
                    }) {
                        Text(String(number))
                            .foregroundColor(.white)
//                        Image(systemName: "pencil")
//                            .renderingMode(.original) // 呈现原始图像素
//                            .clipShape(Capsule()) // 内置形状
//                            .overlay(Capsule().stroke(Color.black, lineWidth: 1)) //绘制边框
//                            .shadow(color: .black, radius: 2 ) //阴影
                    }
                }
                Spacer() // 将文字和图片推到Top
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is 1"), dismissButton: .default(Text("Continue")) {
                self.askQuestion() //点击dismissButton的动作
            })
        }
       
}

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "False"
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle() // 更改数组顺序
        correctAnswer = Int.random(in: 0...2)
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
