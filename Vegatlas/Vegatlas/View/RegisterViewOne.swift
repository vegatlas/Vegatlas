//
//  LoginView.swift
//  Vegatlas
//
//  Created by Bahadır Etka Kılınç on 24.10.2022.
//

import SwiftUI

struct RegisterViewOne: View {
    @EnvironmentObject var userInfo: UserInfos
    @Binding var hasAccount: Bool
    @Environment(\.presentationMode) var isOn
    var body: some View {
        
        ZStack{
            Color("Green")
            VStack{
                
                Image("vegatlas_logo")
                    .resizable()
                    .frame(width: 213, height: 80)
                    .padding(.top, 150)
                    .padding(.bottom, 90)
                
                TextField("Full Name", text: $userInfo.fullName)
                    .padding()
                    .background {
                        Color(.white)
                    }
                    .cornerRadius(30)
                    .padding(.bottom, 10)
                TextField("EMail", text: $userInfo.email)
                    .padding()
                    .background {
                        Color(.white)
                    }
                    .cornerRadius(30)
                    .padding(.bottom, 60)
                NavigationLink {
                    RegisterViewTwo()
                        .environmentObject(userInfo)
                } label: {
                    Text("Continue")
                        .padding()
                        .foregroundColor(Color("Green"))
                        .font(.system(.title3, weight: .heavy))
                }
                .frame(maxWidth: .infinity)
                .background {
                    Color(.white)
                }
                .cornerRadius(30)
                HStack{
                    Text("Already have an account? ")
                    Text("Login Here")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            isOn.wrappedValue.dismiss()
                            withAnimation(.easeIn(duration: 1)) {
                                hasAccount.toggle()
                            }
                        }
                }

            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

struct RegisterViewOne_Previews: PreviewProvider {
    static var previews: some View {
        RegisterViewOne(hasAccount: .constant(false))
    }
}
