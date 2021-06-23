import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DreamRepository: ObservableObject{
  
  let db = Firestore.firestore()
  
  @Published var dreams = [DreamModel]()
  
  init() {
    loadData()
  }
  
  func loadData() {
    db.collection("dreams")
      .order(by: "date")
      .addSnapshotListener { (querySnapshot, error) in
      if let querySnapshot = querySnapshot{
        self.dreams = querySnapshot.documents.compactMap({ document in
          try? document.data(as: DreamModel.self)
        })
      }
    }
  }
  
  func addDream(_ dream: DreamModel){
    do {
      let _ = try db.collection("dreams").addDocument(from: dream)
    } catch {
      fatalError("Unable to encode")
    }
  }
}
