//
//  ContentView.swift
//  C_LINK_CUY
//
//  Created by Jehoiada Wong on 06/07/23.
//

import SwiftUI
import AuthenticationServices

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    var body: some View {
        NavigationView{
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "#D7EBE7"), Color(hex: "#23554C")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    HStack{
                        NavigationLink(destination: ContentView()){
                                Image("back")
                                    .padding(.leading, 25)
                            }
                        Spacer()
                    }
                    Spacer()
                    Image("LOGO KELAZ")
                    Text("C-link")
                        .font(.system(size: 50))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "#23554C"))
                    Spacer()
                    NavigationLink(destination: MyProfile()){
                        SignInWithAppleButton(.signIn){request in
                            
                            request.requestedScopes = [.email, .fullName]
                            
                        } onCompletion: { result in
                            
                            switch result{
                            case .success(let auth):
                                
                                switch auth.credential{
                                case let credential as ASAuthorizationAppleIDCredential:
                                    
                                    let userId = credential.user
                                    
                                    let email = credential.email
                                    let firstName = credential.fullName?.givenName
                                    let lastName = credential.fullName?.familyName
                                    
                                    self.email = email ?? ""
                                    self.userId = userId
                                    self.firstName = firstName ?? ""
                                    self.lastName = lastName ?? ""
                                default:
                                    break
                                }
                                
                            case .failure(let error):
                                print(error)
                            }
                            
                        }
                        .signInWithAppleButtonStyle(
                            colorScheme == .dark ? .white : .black
                        )
                        .frame(height: 50)
                        .padding()
                        .cornerRadius(8)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
