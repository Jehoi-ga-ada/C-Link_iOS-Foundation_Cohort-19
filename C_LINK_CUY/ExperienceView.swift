//
//  Experience View.swift
//  Clink
//
//  Created by Sabrina on 13/07/23.
//

import Foundation
import SwiftUI

struct ExperienceView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .font(.largeTitle)
                        .frame(width: 375, height: 375)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .background(Color(hex: "#599177"))
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct ExperienceView_PreviewView: PreviewProvider {
    static var previews: some View {
        ExperienceView()
    }
}

