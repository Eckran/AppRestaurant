import Foundation


struct MenuItem {
    
    enum MenuCategory {
        case appetizer
        case first
        case main
        case desert
        case drink
        
        static var allCases: [MenuCategory] {
            return [.appetizer, .first, .main, .desert, .drink]
        }
        
        var CateValue: String {
            switch self {
            case .appetizer:
                return "apéro"
            case .first:
                return "entrée"
            case .main:
                return "plat"
            case .desert :
                return "dessert"
            case .drink :
                return "boisson"
            }
        }
    }
    
    var name : String
    var description : String
    var price : Double
    var category : MenuCategory
    var url : String?
    var isVegan : Bool
    var isGlutenFree: Bool
}
