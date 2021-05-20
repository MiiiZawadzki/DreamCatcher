//
//  HomeView.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 27/04/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, Username!")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "gearshape")
                })
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .leading)
            
            Spacer()
            Text("Yours last saved dream:")
            Dream()
              .frame(minWidth: UIScreen.screenWidth, maxWidth: UIScreen.screenWidth, minHeight:UIScreen.screenHeight/3, maxHeight: UIScreen.screenHeight/2, alignment: .center)
            Spacer()
            Text("Total dreams saved: 32")
            Spacer()
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Dream: View {
    var body: some View {
        ZStack{
            Rectangle()
            Color(.blue)
            VStack{
                Text("Title of really interesting dream dream dream dream dream")
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                Text("Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream Body of dream")
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            }
                
        }
        .cornerRadius(10)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        //.frame(minWidth: UIScreen.screenWidth, maxWidth: UIScreen.screenWidth, minHeight:50, maxHeight: UIScreen.screenHeight/3, alignment: .center)
        
    }
}
