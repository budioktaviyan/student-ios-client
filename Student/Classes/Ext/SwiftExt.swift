extension Dictionary {

    func nullKeyRemoval() -> Dictionary {
        var dict: [Key: Value] = self

        let keysToRemove: [Key] = dict.keys.filter {
            guard let value: String = dict[$0] as? String else { return false }
            return value == ""
        }

        let _ = keysToRemove.compactMap { key in
            dict.removeValue(forKey: key)
        }
        print("dictionary is: \(dict)")

        return dict
    }
}
