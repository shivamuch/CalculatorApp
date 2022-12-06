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
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Spacer()
                Text(working)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack
            {
                Spacer()
                Text(result)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 50, weight: .heavy))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ForEach(grid, id: \.self)
            {
                row in
                HStack
                {
                    ForEach(row, id: \.self)
                    {
                        cell in
                        
                        Button(action: { btnPressed(cell: cell)}, label: {
                            Text(cell)
                                .foregroundColor(btnColor(cell))
                                .font(.system(size: 40, weight: .heavy))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        })
                        
                    }
                }
            }
            
            
            
        }
        .background(Color.black.ignoresSafeArea())
        .alert(isPresented: $alert)
        {
            Alert(
                title: Text("Invalid Input"),
                message: Text(working),
                dismissButton: .default(Text("Okay"))
            )
        }
    }
    
    func btnColor(_ cell: String) -> Color
    {
        if(cell == "AC" || cell == "⌦")
        {
            return .red
        }
        
        if(cell == "-" || cell == "=" || operators.contains(cell))
        {
            return .orange
        }
        
        return .white
    }
    
    func btnPressed(cell: String)
    {
        
        switch (cell)
        {
        case "AC":
            working = ""
            result = ""
        case "⌦":
            working = String(working.dropLast())
        case "=":
            result =
        case "-":
            minus()
        case "X", "/", "%", "+":
            add(cell)
        default:
            working += cell
        }
        
    }
    
    func add(_ cell : String)
    {
        if !working.isEmpty
        {
            let last = String(working.last!)
            if operators.contains(last)
            {
                working.removeLast()
            }
            working += cell
        }
    }
    
    func minus()
    {
        if working.isEmpty || working.last! != "-"
        {
            working += "-"
        }
    }
    
    
}
