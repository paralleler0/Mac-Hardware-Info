import Foundation

let hw = getHwInfo()

// This matches ViewController.getData()
func buildPayload(preventSharing: Bool) -> Data {
    var data = "OABS".data(using: .utf8)!
    data.append(preventSharing ? 1 : 0)
    data.append(try! hw.serializedData())
    return data
}

let payload = buildPayload(preventSharing: preventSharing)
let output = payload.base64EncodedString()

import Foundation

var preventSharing = false

print("Do you want to prevent sharing? (yes/no): ", terminator: "")

if let input = readLine()?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {

    if input == "yes" || input == "y" {
        preventSharing = true
    } else if input == "no" || input == "n" {
        preventSharing = false
    } else {
        print("Invalid input. Defaulting to 'no'")
        preventSharing = false
    }
    
}

print("Paste this code into Openbubbles")

print(output)
