//
//  ShapeView.swift
//  Swiftui-Exercise
//
//  Created by 박윤수 on 2021/09/08.
//

import SwiftUI

struct ShapeView: View {
    var body: some View {
        VStack{
            Rectangle()
                .stroke(Color.orange, style: StrokeStyle(
                            lineWidth:10
                ))
            
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.blue)
            
            Circle()
                .fill(Color.blue)
            
            Capsule()
                .fill(Color.blue)
        }
        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
