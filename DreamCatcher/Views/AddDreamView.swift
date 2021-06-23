//
//  AddDreamView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 22/06/2021.
//

import SwiftUI

struct AddDreamView: View {
  @ObservedObject var dreamListVM = Singleton.shared
  @State private var contentText:String = "Content"
  @State private var titleText:String = ""
    var body: some View {
      VStack{
        Field(fieldPlaceholder: "Title", fieldText: $titleText)
        VStack{
          TextEditor(text: $contentText)
            .frame(width: .none, height: 200)
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            .onTapGesture {
              if self.contentText == "Content" {
                self.contentText = ""
              }
            }
            .foregroundColor(self.contentText == "Content" ? .gray : .primary)
          Divider()
            .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
        }
        Button(action: {
          let dream = DreamModel(title: titleText, content: contentText, date: Date())
          Singleton.shared.dreamRepo.addDream(dream)
          
        }, label: {
          Text("Add")
        })
        .padding()
        .foregroundColor(.white)
        .background(Color(.blue))
      }
    }
}

struct AddDreamView_Previews: PreviewProvider {
    static var previews: some View {
        AddDreamView()
    }
}
