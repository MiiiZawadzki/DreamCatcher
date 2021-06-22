import SwiftUI

struct MainTabView: View {
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
    }
  }
}

struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView()
  }
}
