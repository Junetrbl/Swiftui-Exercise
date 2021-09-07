//
//  ContentView.swift
//  Swiftui-Exercise
//
//  Created by 박윤수 on 2021/09/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.init(red: 150/256, green: 200/256, blue: 150/256)
                .ignoresSafeArea()
            VStack{
                Text("Hello, \nworld!").padding(.top, 10).background(Color.white)
                    .lineLimit(1)
                    .truncationMode(.middle)
                Text("Hello, world!")
                    .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding().background(Color.white)
                    .font(.largeTitle)
                    .cornerRadius(200.0)
                Text("Hello, \nworld!").padding().background(Color.white)
                    .foregroundColor(.blue)
                    .lineSpacing(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
