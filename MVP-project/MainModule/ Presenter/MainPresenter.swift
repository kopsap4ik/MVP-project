//
//  MainPresenter.swift
//  MVP-project
//
//  Created by Василий Петухов on 24.12.2020.
//

import Foundation

// input
protocol MainViewPresenterProtocol: class { //class для слабых ссылок, Классовые протоколы: https://habr.com/ru/company/acronis/blog/420239/
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

// output
protocol MainViewProtocol: class {
    func setGreeting(greeting: String)
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
