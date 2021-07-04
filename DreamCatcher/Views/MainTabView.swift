import SwiftUI

struct MainTabView: View {
  init() {
    UITabBar.appearance().barTintColor = UIColor(Color.appBlack)
    UITabBar.appearance().unselectedItemTintColor = UIColor(Color.black)

  }
  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Label("Home", systemImage: "house")
        }
      AddDreamView()
        .tabItem {
          Label("Add", systemImage: "plus.app")
        }
      
      BrowseView()
        .tabItem {
          Label("Browse", systemImage: "bookmark")
        }
    }.accentColor(.appPink)
    
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
