import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var menu = Menu(name: " ")
    
    @IBOutlet weak var FoodNameInput: UITextField!
    @IBOutlet weak var FoodCateSelect: UISegmentedControl!
    @IBOutlet weak var FoodPriceInput: UITextField!
    @IBOutlet weak var FoodDescInput: UITextField!
    @IBOutlet weak var GlutenSwitch: UISwitch!
    @IBOutlet weak var VeganSwitch: UISwitch!
    @IBOutlet weak var FoodButtonAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        configureUi()
        self.FoodNameInput.delegate = self
        self.FoodPriceInput.delegate = self
        self.FoodDescInput.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddNewItem(_ sender: UIButton) {
        guard FoodCateSelect.selectedSegmentIndex != UISegmentedControlNoSegment else { return }
        let category = MenuItem.MenuCategory.allCases[FoodCateSelect.selectedSegmentIndex]
        guard let name = FoodNameInput.text, name.count > 0 else { return }
        guard let description = FoodDescInput.text, description.count > 0 else { return }
        guard let priceString = FoodPriceInput.text, let priceDouble = Double(priceString) else { return }
        let Vegan = VeganSwitch.isOn
        let Gluten = GlutenSwitch.isOn
        
        let item = MenuItem(name: name, description: description, price: priceDouble, category: category, url: nil, isVegan: Vegan, isGlutenFree: Gluten)
        
        menu.add(item)
    }
    
    private func configureUi() {
        configureCategorySegmentedControl()
        FoodDescInput.text = ""
    }
    
    private func configureCategorySegmentedControl(){
        FoodCateSelect.removeAllSegments()
        for category in MenuItem.MenuCategory.allCases{
            FoodCateSelect.insertSegment(withTitle: category.CateValue, at: FoodCateSelect.numberOfSegments, animated: false)
        }
    }
    

}

