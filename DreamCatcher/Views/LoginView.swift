import SwiftUI

struct LoginView: View {
    @State var showRegister = false
    var body: some View {
        if !showRegister{
            VStack {
                VStack{
                    Image("untitled")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Field(fieldPlaceholder: "Email")
                    Field(fieldPlaceholder: "Password")
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
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Sign In")
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
            }
        }
        else{
            RegisterView()
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
struct Field: View{
    @State var fieldPlaceholder: String
    var body: some View {
        VStack{
            TextField(fieldPlaceholder, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
