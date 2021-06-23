import SwiftUI

struct LoginView: View {
  @State var showRegister = false
  @State var showHome = false
  @State var emailText:String = ""
  @State var passwordText: String = ""
  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(.green)
        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .position(x: 0, y: 0)
      BackgroundPath()
      VStack{
        Image("logo")
          .resizable()
          .frame(width: UIScreen.screenWidth/2, height: UIScreen.screenWidth/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        Spacer()
        Field(fieldPlaceholder: "Email", fieldText: $emailText)
        Field(fieldPlaceholder: "Password", fieldText: $passwordText)
        Spacer()
        HStack{
          Text("Log In with:")
          Circle()
            .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
          Circle()
            .frame(width: 32, height: 32, alignment: .center)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
          Circle()
            .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
          
        }
        Spacer()
        Button(action: {
          showHome.toggle()
        }, label: {
          Text("Sign In")
        })
        .padding()
        .foregroundColor(.white)
        .background(Color(.blue))
        
        Spacer()
        VStack(spacing:0){
          ZStack{
            Rectangle()
            Color(UIColor(.blue))
            
          }
          .opacity(0.6)
          ZStack{
            Rectangle()
            Color(.blue)
          }
          .opacity(0.9)
          ZStack{
            Rectangle()
              .ignoresSafeArea()
            Color(.blue)
              .ignoresSafeArea()
            HStack{
              Text("Don't have an account?")
              Button(action: {
                showRegister = true
              }, label: {
                Text("Sign Up")
              })
              .foregroundColor(.white)
            }
          }
          .frame(width: UIScreen.screenWidth, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .ignoresSafeArea()
        }
        .frame(width: UIScreen.screenWidth, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
      }
      
    }.fullScreenCover(isPresented: $showRegister, content: {
      RegisterView()
    })
    .fullScreenCover(isPresented: $showHome, content: {
      MainTabView()
    })
    
  }
  
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
struct Field: View{
  @State var fieldPlaceholder: String
  @Binding var fieldText: String
  var body: some View {
    VStack{
      TextField(fieldPlaceholder, text: $fieldText)
        .frame(width: .none, height: 30)
        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
      Divider()
        .padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
    }
  }
}
extension UIScreen{
  static let screenWidth = UIScreen.main.bounds.size.width
  static let screenHeight = UIScreen.main.bounds.size.height
  static let screenSize = UIScreen.main.bounds.size
}

struct BackgroundPath: View {
  var body: some View {
    Path{ path in
      path.move(to: CGPoint(x: 0, y: UIScreen.main.bounds.height/2))
      path.addCurve(
        to:CGPoint(x:UIScreen.main.bounds.width,y:UIScreen.main.bounds.height+100),
        control1:CGPoint(x:UIScreen.main.bounds.width*(0.7), y:150+UIScreen.main.bounds.height/2),
        control2:CGPoint(x:UIScreen.main.bounds.width*(0.75), y:-150+UIScreen.main.bounds.height/6))
      path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height))
      path.addLine(to: CGPoint(x:0, y: UIScreen.main.bounds.height))
    }
    .foregroundColor(.green)
  }
}
