//
//  HomeView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 27/04/2021.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var dreamListVM = Singleton.shared
  @State var showSettings = false
  var body: some View {
    VStack {
      HStack {
        HStack{
          Text("Hello,")
            .bold()
          Text("\("Usernameeeeeeeeeeeeeeeeee")")
            .foregroundColor(.appPink)
            .fontWeight(.heavy)
          
        }
        Spacer()
        Button(action: {
          showSettings.toggle()
        }, label: {
          Image(systemName: "gearshape")
            .accentColor(Color(UIColor.label))
        })
      }
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .leading)
      
      Spacer()
      Text("Yours last saved \(Text("Dream:").foregroundColor(.appPink).bold())")
      
      ForEach(dreamListVM.newestDreamViewModel, id: \.id){ dream in
        Dream(dreamModel: dream.dream)
          .padding()
      }
      
      Spacer()
      Text("Total dreams saved: \(Text("\(dreamListVM.dreamRepo.dreams.count)").foregroundColor(.appPink).bold())")
      Spacer()
      
    }.sheet(isPresented: $showSettings, content: {
      SettingsView()
    })
    
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
