//
//  SplashScreen.swift
//  DemoAppSwiftUI
//
//  Created by iOS Developer on 25/09/23.
//

import SwiftUI

struct SplashScreen: View {
    
    // Animatiom Propertis
    
    @State var startAnimation = false
    @State var bowAnimation = false
    
    // Plus image..
    
    @State var showPlus = false
    @State var showBGGlow = false
    
    @State var isFinished = false
    // Glow Animation
    @State var glow = false
    
    
    var body: some View {
        
        // For Saftey
        
        HStack{
            if !isFinished {
                ZStack {
                    Color("BG")
                        .ignoresSafeArea()
                    
                    // Disney logo
                    GeometryReader{proxy in
                        // for screen size
                        let size = proxy.size
                        
                        ZStack{
                            
                            // RainBlow...
                            
                            Circle()
                                .trim(from: 0, to: bowAnimation ? 0.5:0)
                                .stroke(
                                    //Gradient...
                                    .linearGradient(.init(colors: [
                                        Color("Gradient4"),
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient3"),
                                        Color("Gradient5")
                                        .opacity(0.5),
                                        Color("BG"),
                                        Color("BG"),
                                        Color("BG"),
                                    ]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                                )
                                .overlay(
                                    Circle()
                                        .fill(Color.white.opacity(0.4))
                                        .frame(width: 6, height: 6)
                                        .overlay(
                                            Circle()
                                                .fill(Color.white.opacity(glow ? 2.0 : 0.1))
                                                .frame(width: 20, height: 20)
                                            )
                                        .blur(radius: 2.5)
                                        //Moving toword left..
                                        .offset(x: (size.width/1.7)/2)
                                    //Moving toword Blow..
                                        .rotationEffect(.init(degrees: bowAnimation ? 180 : 0))
                                        .opacity(bowAnimation ? 1 : 0)
                                    
                                   )
                                .frame(width: size.width/1.7, height: size.width/1.8)
                                .rotationEffect(.init(degrees: -200))
                                .offset(y: 10)
                            
                            HStack(spacing: 10){
                                Image("dinney")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: size.width/1.9, height: size.width/1.9)
                                    .opacity(startAnimation ? 1 : 0)
                                
                                //Pluse image
                                Image("plus")
                                    .renderingMode(.template)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:40, height: 40)
                                // Background Glow..
                                    .background{
                                        ZStack {
                                            Circle()
                                                .fill(Color.white.opacity(0.25))
                                                .frame(width: 35, height: 35)
                                                .blur(radius: 2)
                                            
                                            Circle()
                                                .fill(Color.white.opacity(0.2))
                                                .frame(width: 20, height: 20)
                                                .blur(radius: 2)
                                        }
                                        .opacity(showBGGlow ? 1 : 0)
                                    }
                                    .scaleEffect(showPlus ? 1 : 0)
                                }
                                .foregroundColor(.white)
                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                    }
                    
                }
                .onAppear(){
                    
                    // Display 0.3s...
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                        withAnimation(.linear(duration: 2)){
                            bowAnimation.toggle()
                        }
                        // Glow Animation
                        
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)){
                            glow.toggle()
                        }
                        
                        // Since we dont need glow from bottom of disney so delaying animation..
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            withAnimation(.spring()){
                                startAnimation.toggle()
                            }
                        }
                        
                        // hiding glow before hitting plus image..
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                            withAnimation(.spring()){
                                showPlus.toggle()
                               // startAnimation.toggle()
                            }
                        }
                        
                        // Glowing after hitting plus image...
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7){
                            withAnimation(.linear(duration: 0.5)){
                                showBGGlow.toggle()
                            }
                            
                            // Toogling back after 0.5s...
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                withAnimation(.linear(duration: 0.4)){
                                    showBGGlow.toggle()
                                }
                                // After 0.4s finising splash animation..
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                    withAnimation{
                                        isFinished.toggle()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
