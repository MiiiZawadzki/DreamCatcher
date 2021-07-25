import Foundation
import Combine

class DreamListViewModel: ObservableObject{
  @Published var dreamCellViewModels = [DreamCellViewModel]()
  @Published var newestDreamViewModel = [DreamCellViewModel]()
  @Published var dreamRepo = DreamRepository()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    dreamRepo.$dreams.map { dreams in
      dreams.map { dream in
        DreamCellViewModel(dream: dream)
      }
    }
    .assign(to: \.dreamCellViewModels, on: self)
    .store(in: &cancellables)
    
    dreamRepo.$newestDream.map { dream in
      dream.map { dream in
        DreamCellViewModel(dream: dream)

      }
    }
    .assign(to: \.newestDreamViewModel, on: self)
    .store(in: &cancellables)
  }
  
}

class Singleton {
  static let shared: DreamListViewModel = {
    let instance = DreamListViewModel()
    return instance
  }()
}
