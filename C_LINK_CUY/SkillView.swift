//
//  SkillView.swift
//  Clink
//
//  Created by Sabrina on 13/07/23.
//

import Foundation
import SwiftUI

struct SkillView: View {
    var body: some View {
        ScrollView() {
            VStack(spacing: 10) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .font(.largeTitle)
                        .frame(width: 370, height: 50)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .background(Color(hex: "#599177"))
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct SkillView_PreviewView: PreviewProvider {
    static var previews: some View {
        SkillView()
    }
}
