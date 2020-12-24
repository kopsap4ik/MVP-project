//
//  MainPresenter.swift
//  MVP-project
//
//  Created by Василий Петухов on 24.12.2020.
//

import Foundation

// output
protocol MainViewProtocol: class { //class для слабых ссылок
    func setGreeting(greeting: String)
}

// input
protocol MainViewPresenterProtocol: class {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person

    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = person.firstName + " " + person.lastName
        view.setGreeting(greeting: greeting)
    }
    
    
    
}
