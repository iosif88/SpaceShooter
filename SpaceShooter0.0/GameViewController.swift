
import UIKit

class GameViewController:
    UIViewController {
    var enemySpaceshipImage0 = UIImageView()
    var enemySpaceshipImage1 = UIImageView()
    var enemySpaceshipImage2 = UIImageView()
    var enemySpaceshipImageArray = [UIImageView()]
    var gameActive = true
    var randomTimeForspaseship1 = 0
    let spaceshipArray = ["spaceship0","spaceship1","spaceship2","spaceship3","spaceship4"]
    let position = [Location.center,Location.right,Location.left]
    let spaseShipLive = true
    var timer = Timer()
    var spaceshipLocation:Location  = .center{
        willSet (newLocation) {
            layautSpaceship(at: newLocation)
        }
    }

    var defoultSpacing:CGFloat = 0
    var spaceshipImageSize:CGFloat = 0
    private var isFirstLoad = true
    let fuktion = function()
    var spaceshipImage = UIImageView()
    var backgroundImage = UIImageView()
    
    @IBOutlet weak var bottomBackgroundConstraint: NSLayoutConstraint!
    @IBOutlet weak var topBackgroundConstraint: NSLayoutConstraint!
    
    
    @IBAction func remuveButton1(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(enemySpaceshipImage0.frame)
        enemySpaceshipImageArray = [enemySpaceshipImage0,enemySpaceshipImage1,enemySpaceshipImage2]
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 5, delay: 0, options: [.curveLinear, .repeat]) {
            self.bottomBackgroundConstraint.constant -= self.view.frame.height
            self.topBackgroundConstraint.constant += self.view.frame.height
            self.view.layoutIfNeeded()
        }
        
    }
    
    func updateCounting(){
        animateEnemySpaceshis()
       
        setEnemySpaceships()
        
    }
    
    func setEnemySpaceships()  {
        //if gameActive {//location:Location
        view.addSubview(enemySpaceshipImage0)
        view.addSubview(enemySpaceshipImage1)
        view.addSubview(enemySpaceshipImage2)
        
            let positionArray = arrayOfRandomUnequalNumbers(quantity: spaceshipArray.count)
            let po = arrayOfRandomUnequalNumbers(quantity: 3)
            enemySpaceshipImage0.image = UIImage(named: spaceshipArray[positionArray[0]])
            enemySpaceshipImage0.frame = CGRect(x: getOriginX(for: position[po[0]]) + 25, y: -100, width: 50, height: 50)
            
            enemySpaceshipImage1.image = UIImage(named: spaceshipArray[positionArray[1]])!
            enemySpaceshipImage1.frame = CGRect(x: getOriginX(for:position[po[1]]) + 25, y: -100, width: 50, height: 50)
            
            enemySpaceshipImage2.image = UIImage(named: spaceshipArray[positionArray[2]])
            enemySpaceshipImage2.frame = CGRect(x: getOriginX(for: position[po[2]]) + 25, y: -100, width: 50, height: 50)
            
//        }
        
    }
    
    func animateEnemySpaceshis()  {
            setEnemySpaceships()//location: position[.random(in: 0...2)]

        UIView.animate(withDuration: .random(in: 2...4), delay:.random(in: 0...3) ,options: [.curveLinear], animations: {
                self.enemySpaceshipImageArray[0].frame.origin.y += self.view.frame.maxY + 100
            })
            UIView.animate(withDuration: .random(in: 2...4), delay:.random(in: 0...3),options: [.curveLinear], animations: {
                self.enemySpaceshipImageArray[1].frame.origin.y += self.view.frame.maxY + 100
            })
            UIView.animate(withDuration: .random(in: 2...4), delay: 3 ,options: [.curveLinear], animations: {
                self.enemySpaceshipImageArray[2].frame.origin.y += self.view.frame.maxY + 100
            },completion:{ _ in  self.animateEnemySpaceshis()
            })

    }
    override func viewDidLayoutSubviews() {
        if  isFirstLoad {
            isFirstLoad = false
            spaceshipImageSize = (view.frame.width / 4)
            defoultSpacing = spaceshipImageSize / 4
            setupSprite()
            view.addSubview(spaceshipImage)
            view.addSubview(backgroundImage)
            layautSpaceship(at: .center)
            animateEnemySpaceshis()
            
//            self.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
//                self.updateCounting()
//            })
           
            
        }
    }
    
  
    
    func setupSprite()  {
        spaceshipImage.image = UIImage(named: "spaceship")
        spaceshipImage.frame = fuktion.spaceshipStartPosition(object: spaceshipImage, view: view)
        
        addSwipeGesture(to: spaceshipImage, direction: .right)
        addSwipeGesture(to: spaceshipImage, direction: .left)
        
    }
    
    
    func addSwipeGesture(to view:UIView, direction:UISwipeGestureRecognizer.Direction)  {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveSpaceship))
        spaceshipImage.isUserInteractionEnabled = true
        swipeGesture.direction = direction
        view.addGestureRecognizer(swipeGesture)
        
        
    }
    
    @objc private func moveSpaceship(_ gestureRecognizer: UISwipeGestureRecognizer) {
        switch gestureRecognizer.direction {
        case .left:
            if spaceshipLocation == .center { spaceshipLocation = .left }
            if spaceshipLocation == .right { spaceshipLocation = .center }
        case .right:
            if spaceshipLocation == .center { spaceshipLocation = .right }
            if spaceshipLocation == .left { spaceshipLocation = .center }
        default:
            return
        }
    }
    
    func layautSpaceship(at location: Location) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.spaceshipImage.frame.origin.x = self.getOriginX(for: location)
        }
    }
    
    private func getOriginX (for location:Location) -> CGFloat {
        switch location {
        case .left:
            return defoultSpacing
        case .center:
            return (defoultSpacing * 2 + spaceshipImageSize)
        case .right:
            return  (defoultSpacing * 3) + (spaceshipImageSize * 2)
        }
    }
    
    func arrayOfRandomUnequalNumbers(quantity:Int) -> [Int] {
        var array:[Int] = []
        var random:Int
        array.append(.random(in: 0...quantity - 1))
        while array.count < quantity {
            random = .random(in: 0...quantity - 1)
            if array.contains(random){
                continue
            }else{
                array.append(random)
            }
        }
        return array//[itemNumber]
    }

}

extension UIView {
    func intersects(_ otherView: UIView) -> Bool {
        if self === otherView { return false }
        return self.frame.intersects(otherView.frame)
    }
}
