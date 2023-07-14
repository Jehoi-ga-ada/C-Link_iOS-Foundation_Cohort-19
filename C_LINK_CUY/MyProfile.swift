//
//  MyProfile.swift
//  C_LINK_CUY
//
//  Created by Jehoiada Wong on 07/07/23.
//

import SwiftUI
import UIKit

struct MyProfile: View {
    @State private var isToggled = false
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                ZStack{
                    ScrollView{
                        VStack{
                            HStack{
                                Image(isToggled ? "lonceng-variant2" : "lonceng")
                                    .frame(width:30, height: 30)
                                    .padding(.leading, 30)
                                    .onTapGesture {
                                        isToggled.toggle()
                                    }
                                Spacer()
                                NavigationLink(destination: ContentView()){
                                    Image("logout")
                                        .padding(.trailing, 30)
                                }
                            }
                            
                            Image("profile-picture")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 109, height: 109)
                            Text("Laurence Harli")
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: "#23554C"))
                                .font(.system(size: 24))
                            Text("INTP | Student | Celloist")
                                .font(.system(size: 14))
                                .foregroundColor(Color(hex: "#23554C"))
                                .padding(.bottom, 20)
                            HStack{
                                Spacer()
                                VStack{
                                    Text("3")
                                        .fontWeight(.bold)
                                        .font(.system(size: 28))
                                    Text("Collabs")
                                        .font(.system(size: 12))
                                }
                                .foregroundColor(Color(hex: "#23554C"))
                                Divider()
                                    .foregroundColor(.black)
                                    .frame(height: 40)
                                VStack{
                                    Text("32")
                                        .fontWeight(.bold)
                                        .font(.system(size: 28))
                                    Text("Connections")
                                        .font(.system(size: 12))
                                }
                                .foregroundColor(Color(hex: "#23554C"))
                                Spacer()
                            }
                            HStack{
                                Text("My Collabs - Creation")
                                    .fontWeight(.bold)
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(hex: "#23554C"))
                                    .padding(.leading, 30)
                                Spacer()
                                Image("Plus")
                                    .padding(.trailing)
                            }
                            VStack{
                                MyCollabs()
                                HStack{
                                    Text("Experience")
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(hex: "#23554C"))
                                        .padding(.leading, 30)
                                    Spacer()
                                    Image("Plus")
                                        .padding(.trailing)
                                }
                                ExperienceView()
                                HStack{
                                    Text("Skills")
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(hex: "#23554C"))
                                        .padding(.leading, 30)
                                    Spacer()
                                    Image("Plus")
                                        .padding(.trailing)
                                }
                                SkillView()
//                                    .frame(height: 150)
                            }
                            Spacer()
                            HStack(spacing: 0) {
        //                            DESTINATION GANTI SESUAI NAMA FILE
                                NavigationLink(destination: Home()){
                                    NavigationBarItem(systemName: "person.2.fill", title: "Collabs")
                                }
                                NavigationLink(destination: Home()){
                                    NavigationBarItem(systemName: "music.note.house.fill", title: "Explore", isActive: true)
                                }
                                NavigationLink(destination: Home()){
                                    NavigationBarItem(systemName: "person.crop.circle", title: "Profile")
                                }
                            }
                            .frame(width: geometry.size.width)
                            .padding(.top, 10) // Reduce the bottom padding
                            .background(Color(hex: "#23554C"))
                            .shadow(radius: 2)
                        }
                        
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NavigationBarItem: View {
    let systemName: String
    let title: String
    let isActive: Bool // Added parameter to indicate whether it's the "Explore" item
    
    init(systemName: String, title: String, isActive: Bool = false) {
        self.systemName = systemName
        self.title = title
        self.isActive = isActive
    }
    
    var body: some View {
            VStack(spacing: 0) {
                Image(systemName: systemName)
                    .imageScale(.large)
                    .foregroundColor(isActive ? Color(hex: "#E5F5DD") : Color(hex: "#599177")) // Conditionally set the color
                    .font(.system(size: 36))
                
                Text(title)
                    .foregroundColor(isActive ? Color(hex: "#E5F5DD") : Color(hex: "#599177")) // Conditionally set the color
                    .font(.system(size: 15))
                    .padding(.top, 5)
                    .kerning(0.6)
            }
            .padding(.horizontal, 35)
    }
}


struct MyProfile_Previews: PreviewProvider {
    static var previews: some View {
        MyProfile()
    }
}
