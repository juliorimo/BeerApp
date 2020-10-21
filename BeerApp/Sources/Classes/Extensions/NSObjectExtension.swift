extension NSObject{
    public class var nameOfClass: String {
        return String(describing: self).components(separatedBy: ".").last ?? String(describing: self)
    }
    
    public var nameOfClass: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last ?? String(describing: self)
    }
}

