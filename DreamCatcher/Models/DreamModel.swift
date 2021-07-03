import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


struct DreamModel: Codable, Identifiable{
  @DocumentID var id: String?
  var title: String
  var content: String
  var date: Date
}

class EmptyDream {
  static let dream: DreamModel = .init(id: nil, title: "Empty", content: "Empty", date: Date())
}

