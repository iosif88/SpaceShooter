
import UIKit

class GameViewController:
    UIViewController {
    var enemySpaceshipImage0 = UIImageView()
    var enemySpaceshipImage1 = UIImageView()
    var enemySpaceshipImage2 = UIImageView()
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
    let fuktion = funktion()
    var spaceshipImage = UIImageView()
    var backgroundImage = UIImageView()
    @IBOutlet weak var backgroundButtomCondtraint: NSLayoutConstraint!
    @IBOutlet weak var backgroundTopConstraint: NSLayoutConstraint!
    
    @IBAction func remuveButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func updateCounting(){
        animateEnemySpaceshis()
        
    }
    
    func setEnemySpaceships(location:Location)  {
         
        
        enemySpaceshipImage0.image = UIImage(named: spaceshipArray[.random(in: 0...spaceshipArray.count - 1)])!
        enemySpaceshipImage0.frame = CGRect(x: getOriginX(for: location) + 25, y: -100, width: 50, height: 50)
        
        enemySpaceshipImage1.image = UIImage(named: spaceshipArray[.random(in: 0...spaceshipArray.count - 1)])!
        enemySpaceshipImage1.frame = CGRect(x: getOriginX(for: location) + 25, y: -100, width: 50, height: 50)
        
        enemySpaceshipImage2.image = UIImage(named: spaceshipArray[.random(in: 0...spaceshipArray.count - 1)])!
        enemySpaceshipImage2.frame = CGRect(x: getOriginX(for: location) + 25, y: -100, width: 50, height: 50)
        
        
        
    }
    
    func animateEnemySpaceshis()  {
        
        view.addSubview(enemySpaceshipImage0)
        view.addSubview(enemySpaceshipImage1)
        view.addSubview(enemySpaceshipImage2)
        setEnemySpaceships(location: position[.random(in: 0...2)])
        
        UIView.animate(withDuration: 3, delay: 0,options: [.repeat,.curveLinear], animations: {
            self.enemySpaceshipImage0.frame.origin.y += self.view.frame.maxY + 100
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
            self.timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
                self.updateCounting()
               })

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
    
    //
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
