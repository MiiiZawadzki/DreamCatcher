//
//  AddDreamView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 22/06/2021.
//

import SwiftUI

struct AddDreamView: View {
  init() {
      UITextView.appearance().backgroundColor = .clear
  }
  @ObservedObject var dreamListVM = Singleton.shared
  @State private var contentText:String = "Content"
  @State private var titleText:String = ""
  var body: some View {
    ZStack{
      Path { path in
        path.move(to: CGPoint(x: UIScreen.main.bounds.width, y:0.0))
        path.addCurve(
          to:CGPoint(x:UIScreen.main.bounds.width,y:UIScreen.main.bounds.height/4),
          control1:CGPoint(x:UIScreen.main.bounds.width*(0.8), y:UIScreen.main.bounds.height/4),
          control2:CGPoint(x:UIScreen.main.bounds.width*(0.8), y:UIScreen.main.bounds.height/6))
      }
      .foregroundColor(.appPink)
      .opacity(0.85)
      Path { path in
        path.move(to: CGPoint(x: UIScreen.main.bounds.width, y:UIScreen.main.bounds.width-50))
        path.addCurve(
          to:CGPoint(x:UIScreen.main.bounds.width,y:UIScreen.main.bounds.height),
          control1:CGPoint(x:UIScreen.main.bounds.width*(0.5), y:UIScreen.main.bounds.height-70),
          control2:CGPoint(x:UIScreen.main.bounds.width, y:UIScreen.main.bounds.height-50))
      }
      .foregroundColor(.appPink)
      .opacity(0.85)
    VStack{
      Spacer()
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
          .background(Color(UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)))
          .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
      }
      Button(action: {
        let dream = DreamModel(title: titleText, content: contentText, date: Date())
        dreamListVM.dreamRepo.addDream(dream)
        
      }, label: {
        Text("Add")
      })
      .padding()
      .foregroundColor(.white)
      .background(Color(UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)))
      .cornerRadius(10)
      Spacer()
    }.contentShape(Rectangle())
    .onTapGesture {endEditing()}
    }
  }
  private func endEditing() {
    UIApplication.shared.endEditing()
  }
}

struct AddDreamView_Previews: PreviewProvider {
  static var previews: some View {
    AddDreamView()
  }
}
