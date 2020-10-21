// NSLocalizedString(key, comment: "")
func NSLocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, tableName: nil, bundle: Bundle.main, value: "", comment: "")
}

struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
}

// App Version

func versionNumber() -> String {
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary["CFBundleShortVersionString"] as? String
    return version != nil ? "\(version!)" : ""
}

func versionNumberDebug() -> String {
    let dictionary = Bundle.main.infoDictionary!
    let version = dictionary["CFBundleShortVersionString"] as? String
    let build = dictionary["CFBundleVersion"] as? String
    return version != nil && build != nil ? "\(version!) (\(build!))" : ""
}

// Logging only when we are not in RELEASE
#if !RELEASE
    func DLog(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
        NSLog("[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
    }
#else
    func DLog(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
    }
#endif
// Logging Always
func ALog(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
    NSLog("[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
}
