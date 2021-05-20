import SwiftUI

struct SettingsView: View {
  @Environment(\.presentationMode) var presentationMode
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
      })
      .padding()
      .background(Color(.green))
      .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
      
      Spacer()
      
      Button(action: {
        logout.toggle()
      }, label: {
        HStack{
          Text("Logout")
          Image(systemName: "lock")
        }
      })
      .padding()
      .background(Color(.green))
      
      Spacer()
      
    }
    .fullScreenCover(isPresented: $logout, content: {
      LoginView()
    })
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
