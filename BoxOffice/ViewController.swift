import UIKit

final class ViewController: UIViewController {
    
    let network = NetworkModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print(network.url)
    }

    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
}

