//
//  ModelBuilder.swift
//  MVP-project
//
//  Created by Василий Петухов on 24.12.2020.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let person = Person(firstName: "Vasily", lastName: "Petukhov")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: person)
        view.presenter = presenter
        return view
    }
}
