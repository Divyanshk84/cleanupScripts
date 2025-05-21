import Foundation

extension String {
    func containsLabelPredicate() -> NSPredicate {
        return NSPredicate(format: "label CONTAINS[c] %@", self)
    }
    
    func elementNotFoundLogging() -> String{
        return "\(self) not found"
    }
    
    func trim() -> String {
        var trimmedString = self.replacingOccurrences(of: "\"", with: "")
        trimmedString = trimmedString.replacingOccurrences(of: "\\", with: "")
        return trimmedString
    }
    
    func trimSlashes() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: "\\"))
    }
}
