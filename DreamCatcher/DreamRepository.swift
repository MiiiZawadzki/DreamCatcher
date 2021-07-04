import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DreamRepository: ObservableObject{
  
  let db = Firestore.firestore()
  
  @Published var dreams = [DreamModel]()
  
  @Published var newestDream = [DreamModel]()
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
          self.newestDream = [self.dreams.last ?? EmptyDream.dream]
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
  
  func deleteDream(_ dream: DreamModel){
    if let dreamId = dream.id{
      db.collection("dreams").document(dreamId).delete() { err in
        if let err = err {
          print("Error removing document: \(err)")
        } else {
          print("Document successfully removed!")
        }
      }
    }
  }
}
