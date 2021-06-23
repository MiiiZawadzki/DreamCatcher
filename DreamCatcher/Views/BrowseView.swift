//
//  HomeView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 27/04/2021.
//

import SwiftUI

struct BrowseView: View {
  @ObservedObject var dreamListVM = Singleton.shared
  let dreams = testDreams
  var body: some View {
    List(dreamListVM.dreamCellViewModels, id: \.id){ dream in
      HStack{
        Dream(titleText: dream.dream.title, bodyText: dream.dream.content, date: dream.dream.date)
      }
    }
    
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    BrowseView()
  }
}
