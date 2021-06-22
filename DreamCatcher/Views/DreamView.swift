//
//  DreamView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 23/05/2021.
//

import SwiftUI

struct Dream: View {
  @State var titleText: String
  @State var bodyText: String
  var body: some View {
    VStack{
      HStack{
      Spacer()
      Button(action: {
        
      }, label: {
        Image(systemName: "minus.circle")
          .resizable()
          .frame(width: 32, height: 32, alignment: .center)
          .foregroundColor(.black)
      })
      .frame(width: 40, height: 40, alignment: .center)
      }
      Text(titleText)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .padding()
      
      Text(bodyText)
        .padding()
      Divider()
    }
    .background(Color(.blue))
    .cornerRadius(10)
    //      .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
  }
}

struct Dream_Previews: PreviewProvider {
  static var previews: some View {
    Dream(titleText: "The strange and vivid dreams of COVID-19", bodyText: "First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute.")
  }
}
