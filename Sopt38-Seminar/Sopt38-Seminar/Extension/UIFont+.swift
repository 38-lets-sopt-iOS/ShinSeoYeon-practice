import UIKit

extension UIFont {
    
    enum Pretendard {
        static func extraBold(ofSize size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-ExtraBold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        }
        
        static func bold(ofSize size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Bold", size: size) ?? .systemFont(ofSize: size, weight: .bold)
        }
        
        static func semiBold(ofSize size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-SemiBold", size: size) ?? .systemFont(ofSize: size, weight: .semibold)
        }
        
        static func medium(ofSize size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Medium", size: size) ?? .systemFont(ofSize: size, weight: .medium)
        }
        
        static func regular(ofSize size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Regular", size: size) ?? .systemFont(ofSize: size, weight: .regular)
        }
        
        static func light(ofSize size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-Light", size: size) ?? .systemFont(ofSize: size, weight: .light)
        }
        
        static func extraLight(ofSize size: CGFloat) -> UIFont {
            UIFont(name: "Pretendard-ExtraLight", size: size) ?? .systemFont(ofSize: size, weight: .light)
        }
    }
}
