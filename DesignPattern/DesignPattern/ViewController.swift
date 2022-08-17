//
//  ViewController.swift
//  DesignPattern
//
//  Created by SonNV MacMini on 17/08/2022.
//

import UIKit
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView() {
        
    }
}

class ViewController: BaseViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    let listDesignPattern: [String] = ["1. Design Pattern: Class Diagram",
                                   "2. Design Pattern: Builder Pattern",
                                   "3. Design Pattern: Chain of Responsibility Pattern",
                                   "4. Design Pattern: State Pattern",
                                   "5. Design Pattern: Memento Pattern",
                                   "6. Design Pattern: Strategy Pattern",
                                   "7. Design Pattern: Iterator Pattern",
                                   "8. Design Pattern: Adapter Pattern",
                                   "9. Design Pattern: Mediator Pattern",
                                   "10. Design Pattern: Prototype Pattern",
                                   "11. Design Pattern: Decorator Pattern"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "DesignPatternCell", bundle: nil), forCellReuseIdentifier: "DesignPatternCell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDesignPattern.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DesignPatternCell", for: indexPath) as? DesignPatternCell
        cell?.labelTitle.text = self.listDesignPattern[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailDesignPatternController()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        self.present(navi, animated: true, completion: nil)
    }
}
