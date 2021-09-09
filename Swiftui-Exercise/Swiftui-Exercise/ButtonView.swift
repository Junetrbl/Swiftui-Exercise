//
//  ButtonView.swift
//  Swiftui-Exercise
//
//  Created by 박윤수 on 2021/09/08.
//

import SwiftUI

struct ButtonView: View {
    @State private var didSelect = false
    @State private var daycount = 0.0

    var body: some View {
        ZStack{
            if didSelect {
                Image("day")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                    .padding(.trailing, 50)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
            } else {
                Image("night")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                    .padding(.trailing, 50)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
            }

            VStack{
                Button(action: {
                    didSelect.toggle()
                    daycount += 0.5
                }, label: {
//                    Image(systemName: didSelect ? "sun.max" : "moon")
                    Image(systemName: "")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 80, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.blue)
                })
                .padding(.bottom, 560)
                .padding(.trailing, 240)
                
                Text("Current Day Count : \(daycount.description)")
                    .bold()
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            VStack{
                let isTree = daycount > 1
                let isWeasle = daycount > 2
                let isMushroom = daycount > 3
                let isBear = daycount > 4
                let isGrass = daycount > 5
                let isDeer = daycount > 6

                HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 80){
                    Image(systemName: isTree ? "leaf": "")
                    Image(systemName: isWeasle ? "hare": "")
                    Image(systemName: isMushroom ? "ant": "")
                }
                .padding(.bottom, 20)
                
                HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30){
                    Image(systemName: isBear ? "tortoise": "")
                    Image(systemName: isGrass ? "leaf.fill": "")
                    Image(systemName: isDeer ? "ladybug": "")
                }
            }
            .padding(.top, 180)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
