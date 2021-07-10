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
  @ViewBuilder
  var body: some View {
    if dreamListVM.dreamCellViewModels.count != 0{
      ScrollView{
        LazyVStack(spacing:0){
          ForEach(dreamListVM.dreamCellViewModels, id: \.id){ dream in
            Dream(dreamModel: dream.dream)
              .padding(.trailing)
              .padding(.leading)
              .padding(.bottom)
          }
        }
      }
    }
    else{
      VStack{
        Text("You don't have any dreams added yet")
        }
        .padding()
        .background(Color.appPink)
        .cornerRadius(10)
    }
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    BrowseView()
  }
}
