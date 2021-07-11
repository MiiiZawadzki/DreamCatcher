import SwiftUI

struct FullDreamView: View {
  @Environment(\.presentationMode) var presentationMode
  @State var dreamModel : DreamModel
  @ObservedObject var dreamListVM = Singleton.shared
  var body: some View {
    ZStack{
      VStack{
        Path { path in
          path.move(to: CGPoint(x: UIScreen.main.bounds.width, y:100))
          path.addCurve(
            to:CGPoint(x:UIScreen.main.bounds.width,y:UIScreen.main.bounds.height/4),
            control1:CGPoint(x:UIScreen.main.bounds.width*(0.8), y:UIScreen.main.bounds.height/4),
            control2:CGPoint(x:UIScreen.main.bounds.width*(0.8), y:UIScreen.main.bounds.height/6))
        }
        .foregroundColor(.appPink)
        .opacity(0.4)
        
        Path { path in
          path.move(to: CGPoint(x:0, y:100))
          path.addCurve(
            to:CGPoint(x:0,y:UIScreen.main.bounds.height/4),
            control1:CGPoint(x:UIScreen.main.bounds.width*(0.4), y:UIScreen.main.bounds.height/4),
            control2:CGPoint(x:UIScreen.main.bounds.width*(0.5), y:UIScreen.main.bounds.height/6))
        }
        .foregroundColor(.appPink)
        .opacity(0.4)
      }
      VStack{
        Spacer()
        // Back button
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }, label: {
          HStack{
            Image(systemName: "chevron.backward")
            Text("Back")
              .underline()
            Spacer()
            Button(action: {
              dreamListVM.dreamRepo.deleteDream(dreamModel)
              presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "trash.circle")
                .resizable()
                .frame(width: 32, height: 32, alignment: .center)
                .accentColor(Color(UIColor.label))
              
            })
          }
          .foregroundColor(.white)
        })
        .padding()
        .background(Color.appBlack)
        .frame(width: UIScreen.main.bounds.width, height: 50, alignment: .leading)
        ScrollView{
          VStack(alignment: .leading){
            Text("Date:")
              .bold()
              .font(.title2)
              .foregroundColor(.appPink)
              .padding(.leading)
              .padding(.top)
            // top stack - Date and xmark
            HStack{
              Text(dreamModel.date, style: .date)
                .padding()
                .foregroundColor(.appDarkerWhite)
              Spacer()
              
            }
          }
          // title stack
          VStack(alignment: .leading){
            Text("Title:")
              .bold()
              .font(.title2)
              .foregroundColor(.appPink)
              .padding(.leading)
              .padding(.top)
            // top stack - Date and xmark
            HStack{
              Text(dreamModel.title)
                .padding()
                .foregroundColor(.appDarkerWhite)
              Spacer()
              
            }
          }
          
          // content stack
          VStack(alignment: .leading){
            Text("Content:")
              .bold()
              .font(.title2)
              .foregroundColor(.appPink)
              .padding(.leading)
              .padding(.top)
            
            HStack{
              Text(dreamModel.content)
                .padding()
                .foregroundColor(.appDarkerWhite)
              Spacer()
              
            }
          }
        }
        Spacer()
      }
    }
    .background(Color.appBlack)
    .ignoresSafeArea()
  }
}

struct FullDreamView_Previews: PreviewProvider {
  static var previews: some View {
    let dream = DreamModel(id: "123", title: "The strange and vivid dreams of COVID-19", content: "First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute.First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute.First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute.First, my daughter drowned in our backyard pool. Then, I was walking down the aisle toward a man who wasn’t my husband. There were frogs everywhere. Since then, I’ve fallen, I’ve flown and I have swum and run tirelessly. Most recently, I walked outside without my contacts and a stranger threw a bag over my head and wrestled me to the ground—that was after my doe-eyed dog was accused of murdering a man. I try desperately to scream for help, but I am always mute. 123123123", date: Date())
    FullDreamView(dreamModel: dream)
  }
}
