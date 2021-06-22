//
//  HomeView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 27/04/2021.
//

import SwiftUI

struct BrowseView: View {
  var body: some View {
    List(0..<5){ _ in
      HStack{
        Dream(titleText: "The strange and vivid dreams of COVID-19", bodyText: "First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute.")
      }
    }
    
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    BrowseView()
  }
}
