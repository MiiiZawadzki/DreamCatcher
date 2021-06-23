import SwiftUI

struct RegisterView: View {
  @State var showLogin = false
  var body: some View {
    ZStack{
      Circle()
        .foregroundColor(.green)
        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .position(x: 0, y: 0)
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
      VStack {
        VStack{
          Spacer()
          VStack(spacing:20){
//            Field(fieldPlaceholder: "Username")
//            Field(fieldPlaceholder: "Email")
//            Field(fieldPlaceholder: "Password")
//            Field(fieldPlaceholder: "Confirm password")
          }
          Spacer()
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Sign Up")
          })
          .padding()
          .foregroundColor(.white)
          .background(Color(.blue))
          Spacer()
          VStack(spacing:0){
            ZStack{
              Rectangle()
              Color(UIColor(red: 1, green: 1, blue: 0, alpha: 0.5))
              
            }
            ZStack{
              Rectangle()
              Color(UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 0.5))
              
            }
            ZStack{
              Rectangle()
                .ignoresSafeArea()
              Color(.blue)
                .ignoresSafeArea()
              HStack{
                Text("Already have an account?")
                Button(action: {
                  showLogin = true
                }, label: {
                  Text("Sign In")
                })
                .foregroundColor(.white)
              }
            }
            .frame(width: UIScreen.screenWidth, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
          }
          .frame(width: UIScreen.screenWidth, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
      }
    }.fullScreenCover(isPresented: $showLogin, content: {
      LoginView()
    })
  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView()
  }
}
