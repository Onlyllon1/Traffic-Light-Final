//
//  ContentView.swift
//  Traffic Light
//
//  Created by Francesco on 01/04/22.
//

import SwiftUI

struct ContentView: View {
    var test = trafficLight()
    @State var colorRed : Color = Color.red
    @State var colorYellow : Color = Color.gray
    @State var colorGreen : Color = Color.gray
    var body: some View {
    VStack{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 225, height: 500, alignment: .center)
            VStack(spacing: 40){
                
                Circle()
                    .fill(colorRed)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Circle()
                    .fill(colorYellow)
                    .frame(width: 100, height: 100, alignment: .center)
                
                Circle()
                    .fill(colorGreen)
                    .frame(width: 100, height: 100, alignment: .center)
                
            }
        }
        Button {
            Task{
                await test.redToGray(colRed:&colorRed)
                }
            Task{
                await test.grayToYellow(colYel:&colorYellow)
            }
            Task{
                await test.yellowToGray(colYel:&colorYellow)
            }
            Task{
                await test.grayToGren(colGre:&colorGreen)
            }
            Task{
                await test.greenToGray(colGre:&colorGreen)
            }
            Task{
                await test.grayToRed(colRed:&colorRed)
            }
             
        } label: {
            Text("Press me")
        }

    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

actor trafficLight {

    func redToGray(colRed: inout Color) async {
        try! await Task.sleep(nanoseconds: 2_000_000_000)
        colRed=Color.gray
    }
    
    func grayToYellow(colYel: inout Color) async {
        try! await Task.sleep(nanoseconds: 2_100_000_000)
        colYel=Color.yellow
    }
    
    func yellowToGray(colYel: inout Color) async {
        try! await Task.sleep(nanoseconds: 4_100_000_000)
        colYel=Color.gray
    }
    
    func grayToGren(colGre: inout Color) async {
        try! await Task.sleep(nanoseconds: 4_200_000_000)
        colGre=Color.green
    }
    
    func greenToGray(colGre: inout Color) async {
        try! await Task.sleep(nanoseconds: 6_300_000_000)
        colGre=Color.gray
    }

    func grayToRed(colRed: inout Color) async {
        try! await Task.sleep(nanoseconds: 6_400_000_000)
        colRed=Color.red
    }
    
    
    
    
    
        
    
    
}
