//
//  CustomButtonPicker.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/11/20.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .foregroundColor(Color.white)
        .padding()
        .background(configuration.isPressed ? color : Color.gray)
        .cornerRadius(8)
    }
}

struct CustomButtonPicker: View {
    @Binding var selection: Int

    var body: some View {
        
        VStack(spacing: 64){
            HStack {
                // by having this hstack with a spacer inside, the background color is spread throughout the view as opposed to not hoving it
                Spacer()
            }
        
            Spacer()
            
            Button(action: {
                selection = 1
            }, label: {
                Label("Characters", systemImage: "person.fill")
            })
            .buttonStyle(MyButtonStyle(color: Color.skyBlue))
            
            //Spacer()
            
            Button(action: {
                selection = 2
            }, label: {
                Label("Locations", systemImage: "paperplane.fill")
            })
            .buttonStyle(MyButtonStyle(color: Color.rose))
            
            //Spacer()
            
            Button(action: {
                selection = 3
            }, label: {
                Label("Episodes", systemImage: "clock.fill")
            })
            .buttonStyle(MyButtonStyle(color: Color.lime))
            
            //Spacer()
            
            Button(action: {
                selection = 4
            }, label: {
                Label("Favorite", systemImage: "star.fill")
            })
            .buttonStyle(MyButtonStyle(color: Color.lime))
            Spacer()
            
        }.background(LinearGradient(
            gradient: Gradient(
                colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.6)]),
               startPoint: .leading,
               endPoint: .trailing
        ))
        .ignoresSafeArea()
        
    }
}
