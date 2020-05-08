import UIKit

struct CountedSet<Element: Hashable> {
    private(set) var elements: [Element] = []
    private(set) var counts: [Element: Int] = [:]
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        if counts[element] == nil  {
            counts[element] = 1
        } else {
            counts[element] = counts[element]! + 1
        }
        
    }
    
    mutating func remove(_ element: Element) -> Int {
//        guard !elements.isEmpty else { return nil }
        guard let index = elements.firstIndex(of: element) else { return 0 }
        elements.remove(at: index)
        counts[element] = counts[element]! - 1
        return counts[element]!
    }
    
    subscript(_ member: Element) -> Int {
//        return elements.firstIndex(of: member) ?? 0
        let result = count(member)
        return result
    }
    
    func count(_ member: Element) -> Int {
        guard counts[member] != nil else { return 0 }
        return counts[member]!
    }
    
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

enum Arrow {
    case iron
    case wooden
    case elven
    case magic
    case silver
}

var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron]
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
//var myCountedSet = CountedSet<Arrow>()
myCountedSet
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.elven)
myCountedSet.remove(.magic)
