//
//  TutorialView_2.swift
//  Swiftui-Exercise
//
//  Created by 박윤수 on 2021/09/22.
//
import SwiftUI

struct TutorialView_2: View {
    var body: some View {
        NavigationView {
            ZStack{
                ZStack(alignment: .bottomTrailing) {
                    Image("Day_background")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.all)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                    
                    NavigationLink(
                        destination: NextView(),
                        label: {
                            Text(">")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        })
                        .padding(.bottom, 70)
                        .padding(.trailing, 20)
                }
                
                Text("Jaram+")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

struct NextView: View {
    var body: some View {
        NavigationView {
            ZStack{
                ZStack(alignment: .bottomTrailing) {
                    Image("Day_background")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.all)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                    
                    NavigationLink(
                        destination: TimeCycleView(),
                        label: {
                            Text(">")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        })
                        .padding(.bottom, 70)
                        .padding(.trailing, 20)
                }
                
                Text("Welcome")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct TimeCycleView: View {
    @State var wakeupTimeValue: CGFloat = 0.0
    @State var wakeupAngleValue: CGFloat = 0.0
    @State var sleepTimeValue: CGFloat = 0.0
    @State var sleepAngleValue: CGFloat = 0.0
    
    let wakeup_config = Config(minimumValue: 0.0,
                        maximumValue: 24.0,
                        totalValue: 24.0,
                        knobRadius: 15.0,
                        radius: 125.0)
    let sleep_config = Config(minimumValue: 0.0,
                        maximumValue: 24.0,
                        totalValue: 24.0,
                        knobRadius: 15.0,
                        radius: 125.0)
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("Day_background")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
                
                VStack{
                    ZStack{
                        Circle()
                            .fill(Color.white)
                            .frame(width: wakeup_config.radius * 2, height: wakeup_config.radius * 2)
                            .opacity(0.15)
                            .scaleEffect(1.2)
                        
                        Circle()
                            .stroke(Color.gray,
                                    style: StrokeStyle(lineWidth: 3, lineCap: .butt, dash: [3, 23.18]))
                            .frame(width: wakeup_config.radius * 2, height: wakeup_config.radius * 2)
                        
                        Circle()
                            .trim(from: 0.0, to: wakeupTimeValue/wakeup_config.totalValue)
                            .stroke(Color.blue, lineWidth: 4)
                            .frame(width: wakeup_config.radius * 2, height: wakeup_config.radius * 2)
                            .rotationEffect(.degrees(-90))
                        
                        Circle()
                            .trim(from: sleepTimeValue/sleep_config.totalValue, to: 24.0)
                            .stroke(Color.blue, lineWidth: 4)
                            .frame(width: wakeup_config.radius * 2, height: wakeup_config.radius * 2)
                            .rotationEffect(.degrees(-90))
                        
                        Circle()
                            .fill(Color.purple)
                            .frame(width: sleep_config.knobRadius * 2, height: sleep_config.knobRadius * 2)
                            .padding(10)
                            .offset(y: -sleep_config.radius)
                            .rotationEffect(Angle.degrees(Double(sleepAngleValue)))
                            .gesture(DragGesture(minimumDistance: 0.0)
                                        .onChanged({ value in
                                            sleep_change(location: value.location)
                                        }))
                            
                        Circle()
                            .fill(Color.blue)
                            .frame(width: wakeup_config.knobRadius * 2, height: wakeup_config.knobRadius * 2)
                            .padding(10)
                            .offset(y: -wakeup_config.radius)
                            .rotationEffect(Angle.degrees(Double(wakeupAngleValue)))
                            .gesture(DragGesture(minimumDistance: 0.0)
                                        .onChanged({ value in
                                            wakeup_change(location: value.location)
                                        }))
                        
                        VStack{
                            Text("\(String.init(format: "%.0f", wakeupTimeValue)):00~")
                                            .font(.system(size: 60))
                                            .foregroundColor(.white)
                            
                            Text("\(String.init(format: "%.0f", sleepTimeValue)):00")
                                            .font(.system(size: 60))
                                            .foregroundColor(.white)
                        }
                    }
                    NavigationLink(
                        destination: ButtonView(wakeupTime: $wakeupTimeValue, sleepTime: $sleepTimeValue)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true),
                        label: {
                            Text("Confirm")
                        })
//                        .simultaneousGesture(TapGesture().onEnded{
//                            UserDefaults.standard.set(wakeupTimeValue, forKey: "wakeupTime")
//                            UserDefaults.standard.set(sleepTimeValue, forKey: "sleepTime")
//                        })
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    private func sleep_change(location: CGPoint) {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)
        
        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (sleep_config.knobRadius + 10), vector.dx - (sleep_config.knobRadius + 10)) + .pi/2.0
        
        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        // convert angle value to temperature value
        let value = fixedAngle / (2.0 * .pi) * sleep_config.totalValue
        
        if value >= sleep_config.minimumValue && value <= sleep_config.maximumValue {
            sleepTimeValue = value
            sleepAngleValue = fixedAngle * 180 / .pi // converting to degree
        }
    }
    
    private func wakeup_change(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: location.y)

        let angle = atan2(vector.dy - (wakeup_config.knobRadius + 10), vector.dx - (wakeup_config.knobRadius + 10)) + .pi/2.0
        
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        // convert angle value to temperature value
        let value = fixedAngle / (2.0 * .pi) * wakeup_config.totalValue
        
        if value >= wakeup_config.minimumValue && value <= wakeup_config.maximumValue {
            wakeupTimeValue = value
            wakeupAngleValue = fixedAngle * 180 / .pi // converting to degree
        }
    }
}

struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}

struct TutorialView_2_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView_2()
    }
}
