import Foundation
import AppKit

func arg(i: Int, defaultValue: UInt32) -> UInt32 {
    if Process.arguments.count > i {
        if let val = UInt32(Process.arguments[i]) {
            return val
        } else {
            print("not int: \(Process.arguments[i])")
            exit(1)
        }
    }
    return defaultValue
}

var length = arg(1, defaultValue: 1000)
var interval = arg(2, defaultValue: 10)

if Process.arguments.count > 3 {
    print("too many arguments")
    exit(1)
}

if interval > length {
    length = interval
}

var performer = NSHapticFeedbackManager.defaultPerformer()
for _ in 1...(length/interval) {
    performer.performFeedbackPattern(NSHapticFeedbackPattern.Generic, performanceTime: NSHapticFeedbackPerformanceTime.Now)
    usleep(interval*1000)
}
