//
//  AddDreamView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 22/06/2021.
//

import SwiftUI

struct AddDreamView: View {
  @State private var text:String = "Content"
    var body: some View {
      VStack{
        Field(fieldPlaceholder: "Title")
        VStack{
          TextEditor(text: $text)
            .frame(width: .none, height: 200)
            .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            .onTapGesture {
              if self.text == "Content" {
                self.text = ""
              }
            }
            .foregroundColor(self.text == "Content" ? .gray : .primary)
          Divider()
            .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
        }
      }
    }
}

struct AddDreamView_Previews: PreviewProvider {
    static var previews: some View {
        AddDreamView()
    }
}
