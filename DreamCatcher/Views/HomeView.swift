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
        Text("Hello, Username!")
        Spacer()
        Button(action: {
          showSettings.toggle()
        }, label: {
          Image(systemName: "gearshape")
        })
      }
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .leading)
      
      Spacer()
      Text("Yours last saved dream:")
      let dream = dreamListVM.dreamCellViewModels.last?.dream
      if let safeDream = dream{
        Dream(titleText: safeDream.title, bodyText: safeDream.content, date: safeDream.date).padding()
      }
      else{
        
      }
//      Dream(titleText: "The strange and vivid dreams of COVID-19", bodyText: "First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute. First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute.", date: Date())
//          .padding()
        //.frame(minWidth: UIScreen.screenWidth, maxWidth: UIScreen.screenWidth, minHeight:50, maxHeight: UIScreen.screenHeight/2, alignment: .center)
      Spacer()
      Text("Total dreams saved: 32")
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
