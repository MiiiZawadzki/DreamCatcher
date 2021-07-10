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
    ZStack{
      
      Path{ path in
        path.move(to: CGPoint(x: 0, y: UIScreen.main.bounds.height/2))
        path.addCurve(
          to:CGPoint(x:UIScreen.main.bounds.width,y:UIScreen.main.bounds.height+100),
          control1:CGPoint(x:UIScreen.main.bounds.width*(0.7), y:150+UIScreen.main.bounds.height/2),
          control2:CGPoint(x:UIScreen.main.bounds.width*(0.75), y:-150+UIScreen.main.bounds.height/6))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height))
        path.addLine(to: CGPoint(x:0, y: UIScreen.main.bounds.height))
      }
      .foregroundColor(.appPink)
      .opacity(0.6)
      if dreamListVM.dreamCellViewModels.count != 0{
        ScrollView{
          LazyVStack(spacing:0){
            ForEach(dreamListVM.dreamCellViewModels, id: \.id){ dream in
              Dream(dreamModel: dream.dream)
                .padding(.trailing)
                .padding(.leading)
                .padding(.bottom)
                .opacity(0.90)
            }
          }
        }
      }
      else{
        VStack{
          Text("You don't have any dreams added yet")
        }
        .padding()
        .background(Color.appPink.opacity(0.6))
        .cornerRadius(10)
      }
    }
  }
}

struct BrowseView_Previews: PreviewProvider {
  static var previews: some View {
    BrowseView()
  }
}
