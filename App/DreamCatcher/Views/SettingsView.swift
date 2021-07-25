import SwiftUI

struct SettingsView: View {
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var dreamListVM = Singleton.shared
  @State var logout: Bool = false
  var body: some View {
    VStack {
      Button(action: {
        presentationMode.wrappedValue.dismiss()
      }, label: {
        HStack{
          Image(systemName: "chevron.backward")
          Text("Back")
        }
        .foregroundColor(.white)
      })
      .padding()
      .background(Color.appBlack)
      .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
      
      Spacer()
      
      Button(action: {
        logout.toggle()
      }, label: {
        HStack{
          Text("Delete all added dreams")
          Image(systemName: "trash")
        }
        .foregroundColor(.white)
      })
      .padding()
      .background(Color(UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)))
      .cornerRadius(10)
      
      Spacer()
      
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
