//
//  SettingsView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 20/05/2021.
//

import SwiftUI

struct SettingsView: View {
  @State var backToHome: Bool = false
  @State var logout: Bool = false
    var body: some View {
      VStack {
        Button(action: {
          backToHome.toggle()
        }, label: {
          HStack{
          Image(systemName: "chevron.backward")
          Text("Back")
          }
        })
        .padding()
        .background(Color(.green))
        .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
        
        Spacer()
        
        Button(action: {
          logout.toggle()
        }, label: {
          HStack{
            Text("Logout")
            Image(systemName: "lock")
          }
        })
        .padding()
        .background(Color(.green))
        
         Spacer()
          
      }.fullScreenCover(isPresented: $backToHome, content: {
        MainTabView()
      })
      .fullScreenCover(isPresented: $logout, content: {
        LoginView()
      })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
