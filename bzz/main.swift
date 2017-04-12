import Foundation
import AppKit

func arg(_ i: Int, defaultValue: UInt32) -> UInt32 {
    if CommandLine.arguments.count > i {
        if let val = UInt32(CommandLine.arguments[i]) {
            return val
        } else {
            print("not int: \(CommandLine.arguments[i])")
            exit(1)
        }
    }
    return defaultValue
}

var length = arg(1, defaultValue: 1000)
var interval = arg(2, defaultValue: 20)
var pattern = NSHapticFeedbackPattern(rawValue: Int(arg(3, defaultValue: 0)))!

if CommandLine.arguments.count == 1 {
    print("usage: " + CommandLine.arguments[0] + " [length [interval [patterncode]]]");
    exit(1)
}
if CommandLine.arguments.count > 4 {
    print("too many arguments")
    exit(1)
}

if interval > length {
    length = interval
}

var performer = NSHapticFeedbackManager.defaultPerformer()
for _ in 1...(length/interval) {
    performer.perform(pattern, performanceTime: NSHapticFeedbackPerformanceTime.now)
    usleep(interval*1000)
}
