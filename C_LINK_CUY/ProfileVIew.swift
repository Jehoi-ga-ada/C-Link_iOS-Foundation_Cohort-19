//
//  ProfileVIew.swift
//  Clink
//
//  Created by Sabrina on 13/07/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @State private var isConnected = false

    var body: some View {
        
        VStack (){
            Spacer()
            Image("Ellipse2")
            HStack(){
                Text("Aurellia Putri")
                    .font(Font.title.weight(.bold))
                    .font(.system(size: 24))
                    .foregroundColor(Color(hex: "#23554C"))
            }
            Spacer(minLength: 2)
            HStack(){
                Text("ENFJ | Student | Celloist")
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: "#599177"))
            }
            Spacer(minLength: 20)
            HStack(){
                Button(action: {
                    isConnected.toggle()
                }) {
                    Text(isConnected ? "Disconnect" : "Connect")
                        .font(.system(size: 14))
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(width: 120, height: 33)
                .background(isConnected ? Color(hex: "#AFB1B6") : Color(hex: "#599177"))
                .cornerRadius(12)
                
                Button(action: {
                    print("Collab link copied!")
                }) {
                    Text("Collab")
                        .font(.system(size: 14))
                        .padding()
                        .foregroundColor(.white)
                }
                .frame(width: 120, height: 33)
                .background(Color(hex: "#599177"))
                .cornerRadius(12)
            }
            HStack(){
                VStack(){
                    Text("20")
                        .font(Font.title.weight(.bold))
                        .font(.system(size: 24))
                        .foregroundColor(Color(hex: "#599177"))
                    Text("Collaborations")                .font(.system(size: 12))
                        .foregroundColor(Color(hex: "#599177"))
                }
                Divider()
                    .frame(height: 45)
                    .padding(0.25)
                    .overlay(Color(hex: "#599177"))
                    .padding(30)
                VStack(){
                    Text("15")
                        .font(Font.title.weight(.bold))
                        .font(.system(size: 24))
                        .foregroundColor(Color(hex: "#599177"))
                    Text("Connections")                .font(.system(size: 12))
                        .foregroundColor(Color(hex: "#599177"))
                }
            }
        }
    }
}
            struct ProfileView_Previews: PreviewProvider {
                static var previews: some View {
                    ProfileView()
                }
            }

