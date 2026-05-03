import UIKit

extension UIFont {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"
        
        var weightString: String
        switch weight {
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        default:
            weightString = "Regular"
        }
        
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
    
    static let head1 = UIFont.pretendard(size: 25, weight: .heavy)
    static let subHead1 = UIFont.pretendard(size: 18, weight: .semibold)
    static let subHead2 = UIFont.pretendard(size: 16, weight: .regular)
    static let subHead3 = UIFont.pretendard(size: 15, weight: .bold)
    static let subHead4 = UIFont.pretendard(size: 14, weight: .semibold)
    static let subHead5 = UIFont.pretendard(size: 14, weight: .regular)
    static let info = UIFont.pretendard(size: 12, weight: .regular)
}
