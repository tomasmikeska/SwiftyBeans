import UIKit
import PlaygroundSupport
import SwiftyBeans

// ### Theme

struct Theme {
    
    struct Colors {
        static let primary = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        static let primaryLight = #colorLiteral(red: 0.1991191854, green: 0.5, blue: 0.6639897625, alpha: 1)
    }
    
    struct Text {
        static let heading = Style.bean(
                .fontSize(20),
                .textColor(.black),
                .textColor(.white)
            )
    }
    
    struct Misc {
        static let gradient = Style.linearGradient(
            direction: .toBottom,
            Theme.Colors.primary,
            Theme.Colors.primaryLight
        )
    }
}

// ### Controller

class BeanyController: UIViewController {

    override func loadView() {
        super.loadView()
        view.style(Theme.Misc.gradient)
        
        let card = UIView()
        view.addSubview(card)
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            card.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            card.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            card.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
        card.style(
            .backgroundColor(.white),
            .cornerRadius(corner: .top, 8),
            .shadow(color: .black, opacity: 0.3, radius: 8)
        )
    }
}

PlaygroundPage.current.liveView = BeanyController()
