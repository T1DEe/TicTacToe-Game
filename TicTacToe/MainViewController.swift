
import UIKit

class MainViewController: UIViewController {
    // разобраться с инициализацией
    var fieldSizeFromSegue = 0
    var game: GameModel?
    
    @IBOutlet weak var playerTurnTextField: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = GameModel(fieldSize: fieldSizeFromSegue)
        // TODO: generate game field on screen
    }
    
    
    @IBAction func moveButtonAction(_ sender: UIButton) {
        let str = sender.restorationIdentifier!
        let row = Int(String(str.first!))
        let colunm = Int(String(str.last!))
        
        if game!.move(row: row!, column: colunm!) {
            sender.setImage(UIImage(named: "\(game!.currentPlayer)"), for: .normal)
            game!.checkField()
            switch game!.gameStatus {
                case 0,1,2:
                    performSegue(withIdentifier: "toWin", sender: nil)
            default:
                changeTurn()
            }
        } else {
            return
        }
        
    }
    
    
    func changeTurn() {
        let player = game!.changeTurn()
        playerTurnTextField.text = "Player \(player) turn"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! AfterGameViewController
        dvc.gameStatus = game!.gameStatus
    }
}

