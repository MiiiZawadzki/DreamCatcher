import SwiftUI

struct HomeView: View {
  @ObservedObject var dreamListVM = Singleton.shared
  @State var showSettings = false
  var body: some View {
    ZStack{
      Path { path in
        path.move(to: CGPoint(x: 0, y: UIScreen.main.bounds.height/1.5))
        path.addCurve(
          to:CGPoint(x:0,y:UIScreen.main.bounds.height+400),
          control1:CGPoint(x:UIScreen.main.bounds.width*(0.1), y:150+UIScreen.main.bounds.height/2),
          control2:CGPoint(x:UIScreen.main.bounds.width*(0.75), y:-150+UIScreen.main.bounds.height/6))
      }
      .foregroundColor(.appPink)
      .opacity(0.85)
      Path { path in
        path.move(to: CGPoint(x: UIScreen.main.bounds.width, y:0.0))
        path.addCurve(
          to:CGPoint(x:UIScreen.main.bounds.width,y:UIScreen.main.bounds.height/2),
          control1:CGPoint(x:UIScreen.main.bounds.width*(0.5), y:UIScreen.main.bounds.height/4),
          control2:CGPoint(x:UIScreen.main.bounds.width*(0.5), y:UIScreen.main.bounds.height/6))
      }
      .foregroundColor(.appPink)
      .opacity(0.85)
      VStack {
        HStack {
          HStack{
            Text("Hello,")
              .bold()
            Text("\("Usernameeeeeeeeeeeeeeeeee")")
              .foregroundColor(.appPink)
              .fontWeight(.heavy)
            
          }
          Spacer()
          Button(action: {
            showSettings.toggle()
          }, label: {
            Image(systemName: "gearshape")
              .accentColor(Color(UIColor.label))
          })
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .leading)
        
        Spacer()
        Text("Yours last saved \(Text("Dream:").foregroundColor(.appPink).bold())")
        
        ForEach(dreamListVM.newestDreamViewModel, id: \.id){ dream in
          Dream(dreamModel: dream.dream)
            .padding()
        }
        
        Spacer()
        Text("Total dreams saved: \(Text("\(dreamListVM.dreamRepo.dreams.count)").foregroundColor(.appPink).bold())")
        Spacer()
        
      }.sheet(isPresented: $showSettings, content: {
        SettingsView()
      })
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
