//
//  SwiftUIView.swift
//  Swiftui-Exercise
//
//  Created by 박윤수 on 2021/09/08.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            Image(systemName: "heart.fill")
                .foregroundColor(.purple)
            
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)
                .mask(Circle())
            
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .mask(
                    HStack{
                        VStack{
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack{
                            Circle()
                            Circle()
                            Circle()
                        }
                        VStack{
                            Circle()
                            Circle()
                            Circle()
                        }
                    }
                )
            
            Image("1")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .mask(
                    HStack{
                        Circle()
                        Circle()
                        Circle()
                    })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
