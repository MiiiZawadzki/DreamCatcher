//
//  DreamListViewModel.swift
//  DreamCatcher
//
//  Created by Michał Zawadzki on 23/06/2021.
//

import Foundation
import Combine

class DreamListViewModel: ObservableObject{
  @Published var dreamCellViewModels = [DreamCellViewModel]()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    self.dreamCellViewModels = testDreams.map({ dream in
      DreamCellViewModel(dream: dream)
    })
  }
  
  func addDream(dream: DreamModel) {
    let dreamVM = DreamCellViewModel(dream: dream)
    self.dreamCellViewModels.append(dreamVM)
  }
  
}

class Singleton {
  static let shared: DreamListViewModel = {
    let instance = DreamListViewModel()
    // Setup code
    return instance
  }()
}
