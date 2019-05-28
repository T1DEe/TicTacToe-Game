
import UIKit

class AfterGameViewController: UIViewController {

    @IBOutlet private weak var winLabel: UILabel!
    @IBOutlet private weak var winnerImage: UIImageView!
    
    var gameStatus: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch gameStatus! {
        case 0:
            winLabel.text = "DRAW!"
        case 1,2:
            winLabel.text = "Player \(gameStatus!) WON!"
            winnerImage.image = UIImage(named: "\(gameStatus!)")
        default:
            break
        }
    }
}
