//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import Alert

class RootVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.frame.size = .init(width: 320, height: 480)
        
        let button = UIButton()
        button.backgroundColor = .red
        button.frame = .init(origin: view.center, size: .init(width: 200, height: 40))
        button.layer.cornerRadius = 20
        button.center = view.center
        button.setTitle("alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func showAlert() {
        Alert(title: "Title", message: "Message")
            .addAction("OK") { _ in
                print("ok")
            }
            .addAction("Cancel", style: .cancel) { _ in
                print("cancel")
            }
            .addTextField(configuration: { textField in
                textField.placeholder = "E-mail"
            }, textDidChanged: { alert, textField in
                print(textField.text)
            })
            .addTextField(configuration: { textField in
                textField.placeholder = "Password"
                textField.isSecureTextEntry = true
            })
            .present()
    }
}

let vc = RootVC()
vc.view.frame.size = .init(width: 320, height: 480)
PlaygroundPage.current.liveView = vc
