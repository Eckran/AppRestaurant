import Foundation


class Menu {
    var items: [MenuItem]
    var nomRestaurant : String
    
    var allItems: [MenuItem] {
        return items
    }
    
    init(name: String) {
        nomRestaurant = name
        items = []
    }
    
    func add (_ item: MenuItem) {
        items.append(item)
    }
    
    func remove(_ item: MenuItem) {
        
    }
}
