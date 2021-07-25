import Foundation
import Combine

class DreamCellViewModel: ObservableObject, Identifiable{
  @Published var dream: DreamModel
  
  var id: String = ""
  
  private var cancellables = Set<AnyCancellable>()
  
  init(dream: DreamModel) {
    self.dream = dream
    
    $dream.compactMap { dream in
      dream.id
    }
    .assign(to: \.id, on: self)
    .store(in: &cancellables)
  }
}

