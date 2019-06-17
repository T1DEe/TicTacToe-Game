
import UIKit

class MainViewController: UIViewController {
    // разобраться с инициализацией
    var fieldSizeFromSegue = 0
    var game: GameModel?
    
    var mainStackView = UIStackView()
    var subStackViewsArray: [UIStackView] = []
    var fieldButtonsArray: [[FieldButton]] = []
    
    @IBOutlet weak var playerTurnTextField: UILabel!
    
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    override func viewDidLoad() {
        super.viewDidLoad()
        game = GameModel(fieldSize: fieldSizeFromSegue)
        // generating game field on screen
        generateFieldButtons()
        generateSubStackViews()
        mainStackViewLayoutSetup()
        subStackViewsLayoutSetup()
        playerTurnTextFieldLayoutSetup()
        for item in subStackViewsArray {
            mainStackView.addArrangedSubview(item)
        }
        
    }
    
    
    // MARK: Controller functionality
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
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
    
    func generateFieldButtons() {
        for i in 0..<fieldSizeFromSegue {
            var subArray: [FieldButton] = []
            for j in 0..<fieldSizeFromSegue {
                let newButton: FieldButton = {
                    let button = FieldButton()
                    button.restorationIdentifier = "\(i)\(j)"
                    button.addTarget(self, action: #selector(moveButtonAction(_:)), for: .touchUpInside)
                    return button
                }()
                subArray.append(newButton)
            }
            fieldButtonsArray.append(subArray)
        }
    }
    
    func generateSubStackViews() {
        for i in 0..<fieldSizeFromSegue {
            let subStackView = UIStackView(arrangedSubviews: fieldButtonsArray[i])
            subStackViewsArray.append(subStackView)
        }
    }
    
    
    // MARK: Segues
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! AfterGameViewController
        dvc.gameStatus = game!.gameStatus
    }
    
    
    // MARK: Layout setups
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    func playerTurnTextFieldLayoutSetup() {
        playerTurnTextField.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -60).isActive = true
    }
    
    func mainStackViewLayoutSetup() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .fill
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        mainStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1).isActive = true
    }
    
    func subStackViewsLayoutSetup() {
        for stackView in subStackViewsArray {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
        }
    }
}

