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
  }
  
}

class Singleton {
  static let shared: DreamListViewModel = {
    let instance = DreamListViewModel()
    return instance
  }()
}
