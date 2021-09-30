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
    @State private var showingAlert = false
    
    @Binding var wakeupTime: CGFloat
    @Binding var sleepTime: CGFloat

    var body: some View {
        ZStack{
            if didSelect {
                Image("Day_background")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
            } else {
                Image("Night_background")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
            }

            VStack{
                Text("\(String.init(format: "%.0f", wakeupTime)):00")
                    .foregroundColor(.white)
                Text("\(String.init(format: "%.0f", sleepTime)):00")
                    .foregroundColor(.white)
                Button(action: {
                    showingAlert = true
                }, label: {
                    Image(didSelect ? "sun" : "moon")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 80, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.blue)
                })
                .padding(.bottom, 500)
                .padding(.trailing, 240)
                .alert(isPresented: $showingAlert) {
                    didSelect ?
                    Alert(title: Text("Do you want to wake up now?"),
                                  primaryButton: .default(Text("Yes")) {
                                    action: do {
                                        didSelect.toggle()
                                        wakeupExactTime() ? (daycount += 0.5) : (daycount = 0)
                                    }},
                        secondaryButton: .cancel()) :
                    Alert(title: Text("Do you want to sleep now?"),
                          primaryButton: .default(Text("Yes")) {
                            action: do {
                                didSelect.toggle()
                                sleepExactTime() ? (daycount += 0.5) : (daycount = 0)
                            }},
                        secondaryButton: .cancel())
                        }
            }
            
            ZStack{
                Image("island")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .frame(width: 430, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top, 100)
                    .padding(.trailing, 0)
                
                Image("man")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 150)
            }
            
            Text("Current Day Count : \(daycount.description)")
                .bold()
                .foregroundColor(.white)
                .font(.title)
                .padding(.top, 400)
            
            let isTree = daycount > 1
            let isWeasle = daycount > 2
            let isMushroom = daycount > 3
            let isBear = daycount > 4
            let isGrass = daycount > 5
            let isDeer = daycount > 6
            
            Image(isTree ? "cloud tree": "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: 250, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 260)
                .padding(.leading, 80)
            
            Image(isWeasle ? "Three tailed weasel": "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 350)
            
            Image(isMushroom ? "rose mushroom": "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 100)
                .padding(.trailing, 200)
            
            Image(isBear ? "star rock bear": "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: 200, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 150)
            
            Image(isDeer ? "OH deer": "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: 180, height: 50, alignment: .center)
                .padding(.bottom, 100)
                .padding(.leading, 200)
            
            Image(isGrass ? "water drop grass": "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .frame(width: 180, height: 50, alignment: .center)
                .padding(.bottom, 50)
                .padding(.leading, 250)
            
        }
    }
    
    private func sleepExactTime() -> Bool {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd "
        
        var critTimeString = dateFormatter.string(from: Date())
        critTimeString.append(String.init(format: "%.0f:00", wakeupTime))
        let critTime = dateTimeFormatter.date(from: critTimeString) ?? Date()
        
        let currentTime = Date()
        
        return (critTime.addingTimeInterval(-3600) < currentTime) &&
            (currentTime < critTime.addingTimeInterval(3600))
    }
    
    private func wakeupExactTime() -> Bool {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd "
        
        var critTimeString = dateFormatter.string(from: Date())
        critTimeString.append(String.init(format: "%.0f:00", sleepTime))
        let critTime = dateTimeFormatter.date(from: critTimeString) ?? Date()
        
        let currentTime = Date()
        
        return (critTime.addingTimeInterval(-3600) < currentTime) &&
            (currentTime < critTime.addingTimeInterval(3600))
    }
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(wakeupTime: .constant(CGFloat.zero), sleepTime: .constant(CGFloat.zero))
    }
}
