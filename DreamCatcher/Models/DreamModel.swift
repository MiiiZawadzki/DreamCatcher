import Foundation
import SwiftUI

struct DreamModel{
  var id: String
  var title: String
  var content: String
  var date: Date
}
#if DEBUG
let testDreams = [
  DreamModel(id: "1", title: "My dream", content: "My head was my leg and my leg was a chicken.", date: Date()),
  DreamModel(id: "2", title: "My craziest dream ever", content: "Lorem ipsum.", date: Date())
]
#endif
