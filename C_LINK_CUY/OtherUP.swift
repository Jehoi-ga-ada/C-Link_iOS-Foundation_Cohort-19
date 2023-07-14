//
//  OtherUP.swift
//  Clink
//
//  Created by Sabrina on 12/07/23.
//

import Foundation
import SwiftUI

struct OtherUP: View {
    var body: some View {
        
        ScrollView(){
            VStack (){
                HStack(){
                    Image(systemName: "chevron.backward")
                        .imageScale(.large)
                        .imageScale(.large)
                        .bold()
                        .foregroundColor(Color(hex: "#23554C"))
                    Spacer()
                }
                ProfileView()
                HStack(){
                    Text("Collabs - Creation")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color(hex: "#23554C"))
                    Spacer()
                }
                MyCollabs()
                Spacer()
                HStack(){
                    Text("Experience")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color(hex: "#23554C"))
                    Spacer()
                }
                ExperienceView()
                HStack(){
                    Text("Skills")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(Color(hex: "#23554C"))
                    Spacer()
                }
                SkillView()
                    .frame(height: 150)

                
                
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
            }
            .padding()
        }
    }
    struct OtherUP_Previews: PreviewProvider {
        static var previews: some View {
            OtherUP()
        }
    }
}
