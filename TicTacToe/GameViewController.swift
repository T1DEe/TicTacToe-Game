
import UIKit

class GameViewController: UIViewController {
    var fieldSizeFromSegue = 0
    
    var game: TicTacToeGame? = nil
    
    
    @IBOutlet weak var playerTurnTextField: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = TicTacToeGame(fieldSize: fieldSizeFromSegue)
    }
    
    
    

}

