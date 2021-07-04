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
        .foregroundColor(.white)
      })
      .padding()
      .background(Color(UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)))
      .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
      
      Spacer()
      
      Button(action: {
        logout.toggle()
      }, label: {
        HStack{
          Text("Logout")
          Image(systemName: "lock")
        }
        .foregroundColor(.white)
      })
      .padding()
      .background(Color(UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)))
      .cornerRadius(10)
      
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
