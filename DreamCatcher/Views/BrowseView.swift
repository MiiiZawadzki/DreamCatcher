//
//  HomeView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 27/04/2021.
//

import SwiftUI
import Foundation

struct BrowseView: View {
  @ObservedObject var dreamListVM = Singleton.shared
  var body: some View {
    List(dreamListVM.dreamCellViewModels, id: \.id){ dream in
      HStack{
        Dream(dreamModel: dream.dream)
      }
    }
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    BrowseView()
  }
}
