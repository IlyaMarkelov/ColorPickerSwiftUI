//
//  ContentView.swift
//  ColorPickerSwiftUI
//
//  Created by Илья Маркелов on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                ColorView(red: red, green: green, blue: blue)
                ColorSliderView(value: $red, sliderColor: .red)
                ColorSliderView(value: $green, sliderColor: .green)
                ColorSliderView(value: $blue, sliderColor: .yellow)
                Spacer()
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(sliderColor)
            Slider(value: $value, in: 0...255, step: 1).accentColor(sliderColor)
        }
    }
}
