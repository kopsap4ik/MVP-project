//
//  MainPresenter.swift
//  MVP-project
//
//  Created by Василий Петухов on 24.12.2020.
//

import Foundation

// input
protocol MainViewPresenterProtocol: class { //class для слабых ссылок, Классовые протоколы: https://habr.com/ru/company/acronis/blog/420239/
    func getComments()
    var comments: [Comment]? { get set }
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
}

// output
protocol MainViewProtocol: class {
    func succes()
    func failure(error: Error)
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?


    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async { // переход в main, так как urlSession отработает в global
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
            
        }
    }
    
}
