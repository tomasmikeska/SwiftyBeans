import UIKit
import PlaygroundSupport
import SwiftyBeans

// ### Beans

let heading: Style = .bean(.fontSize(20), .textColor(.black))

// ### Controller

class BeanyController: UIViewController {

    override func loadView() {
        super.loadView()
        let label = UILabel().style(heading)
        view.backgroundColor = .white
        
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        view.addSubview(label)
    }
}

PlaygroundPage.current.liveView = BeanyController()
