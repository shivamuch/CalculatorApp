//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Shivam Bajaj.
//

import SwiftUI

struct ContentView: View
{
    let grid = [
           ["AC", "⌦", "%", "/"],
           ["7", "8", "9", "X"],
           ["4", "5", "6", "-"],
           ["1", "2", "3", "+"],
           [".", "0", "", "="]
       ]
       
       let operators = ["/", "+", "X", "%"]
       
       @State var working = ""
       @State var result = ""
       @State var alert = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
