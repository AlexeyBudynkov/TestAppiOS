//
//  ContentView.swift
//  TestApp
//
//  Created by Алан Максвелл on 26.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var text:String = "Hello, world!"
    
    var body: some View {
        
        Text(text)
            .padding()
        Button(action: {
            text = "No!!!!!!!!"
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
