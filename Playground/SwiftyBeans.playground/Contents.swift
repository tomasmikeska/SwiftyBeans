import UIKit
import PlaygroundSupport
import SwiftyBeans

// ### Theme

struct Theme {
    
    struct Colors {
        static let primary = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        static let primaryLight = #colorLiteral(red: 0.1991191854, green: 0.5, blue: 0.6639897625, alpha: 1)
        static let accent = #colorLiteral(red: 1, green: 0.05098039216, blue: 0.3490196078, alpha: 1)
    }
    
    struct Text {
        static let heading = Style.bean(
            .fontSize(35),
            .fontName("AvenirNextCondensed-Bold"),
            .textColor(.white)
        )
    }
    
    struct Misc {
        static let gradient = Style.linearGradient(
            direction: .toBottom,
            Theme.Colors.primary,
            Theme.Colors.primaryLight
        )
        static let button = Style.bean(
            .backgroundColor(Theme.Colors.accent),
            .textColor(.white),
            .cornerRadius(6)
        )
        static let skeleton = Style.bean(
            .backgroundColor(.black),
            .alpha(0.1)
        )
    }
}

// ### Controller

class BeanyController: UIViewController {
    
    let wrapper = UIView()
    let headingLabel = UILabel()
    let card = UIView()
    let cardStack = UIStackView()
    let box1 = UIView()
    let box2 = UIView()
    let box3 = UIView()
    let button = UIButton()

    override func loadView() {
        super.loadView()
        addSubviews()
        layoutSubviews()
        styleSubviews()
        bindContent()
    }
    
    // A few styling examples
    func styleSubviews() {
        wrapper.style(Theme.Misc.gradient)
        headingLabel.style(Theme.Text.heading)
        card.style(
            .backgroundColor(.white),
            .cornerRadius(corner: .top, 8),
            .shadow(color: .black, opacity: 0.3, radius: 8)
        )
        box1.style(Theme.Misc.skeleton)
        box2.style(Theme.Misc.skeleton)
        box3.style(Theme.Misc.skeleton, .scaleX(0.5))
        button.style(Theme.Misc.button)
    }
    
    // MARK: - Basic view layouting
    
    func addSubviews() {
        view.addSubview(wrapper)
        wrapper.addSubview(headingLabel)
        wrapper.addSubview(card)
        card.addSubview(cardStack)
        cardStack.addArrangedSubview(box1)
        cardStack.addArrangedSubview(box2)
        cardStack.addArrangedSubview(box3)
        card.addSubview(button)
    }
    
    func layoutSubviews() {
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wrapper.topAnchor.constraint(equalTo: view.topAnchor),
            wrapper.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            wrapper.leftAnchor.constraint(equalTo: view.leftAnchor),
            wrapper.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headingLabel.centerXAnchor.constraint(equalTo: wrapper.centerXAnchor),
            headingLabel.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 90)
        ])
        
        card.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            card.bottomAnchor.constraint(equalTo: wrapper.bottomAnchor),
            card.leftAnchor.constraint(equalTo: wrapper.leftAnchor, constant: 16),
            card.rightAnchor.constraint(equalTo: wrapper.rightAnchor, constant: -16),
            card.topAnchor.constraint(equalTo: wrapper.topAnchor, constant: 200)
        ])
        
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardStack.topAnchor.constraint(equalTo: card.topAnchor, constant: 16),
            cardStack.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -16),
            cardStack.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 16)
        ])
        cardStack.axis = .vertical
        cardStack.spacing = 16
        
        box1.translatesAutoresizingMaskIntoConstraints = false
        box1.heightAnchor.constraint(equalToConstant: 24).isActive = true
        box2.translatesAutoresizingMaskIntoConstraints = false
        box2.heightAnchor.constraint(equalToConstant: 24).isActive = true
        box3.translatesAutoresizingMaskIntoConstraints = false
        box3.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -16),
            button.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func bindContent() {
        headingLabel.text = "SwiftyBeans"
        button.setTitle("CLICK ME", for: .normal)
    }
}

PlaygroundPage.current.liveView = BeanyController()
