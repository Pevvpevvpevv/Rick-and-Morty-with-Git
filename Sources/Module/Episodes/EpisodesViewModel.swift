//
//  EpisodesViewModel.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 05.06.2024.
//

import UIKit

final class EpisodesViewModel {
    private var networkService = NetworkService()
    var isLoading: Observable<Bool> = Observable(false)
    var dataSource: MainModel?
    
    func getData() {
        isLoading.value = true
        
        networkService.fetchData { [weak self] result in
            guard let self else { return }
            self.isLoading.value = false
            switch result {
            case .success(let model):
                self.dataSource = model
            case .failure(let error):
                print(error)
            }
        }
    }
//    func getData() {
//        isLoading.value = true
//        
//        networkService.fetchData { [weak self] data, error in
//            guard let self else { return }
//            self.isLoading.value = false
//            if let data {
//                self.dataSource = data
//            }
//        }
//    }
}
