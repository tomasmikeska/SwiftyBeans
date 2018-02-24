import UIKit
import PlaygroundSupport
import SwiftyBeans

// ### Beans

struct Theme {
    
    struct Text {
        static let
            heading = Style.bean(.fontSize(20), .textColor(.black), .textColor(.white))
    }
}

// ### Controller

class BeanyController: UIViewController {

    override func loadView() {
        super.loadView()
        view.style(.linearGradient(direction: .toBottom, .red, .blue))
        
        let label = UILabel().style(Theme.Text.heading)
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        view.addSubview(label)
    }
}

PlaygroundPage.current.liveView = BeanyController()
