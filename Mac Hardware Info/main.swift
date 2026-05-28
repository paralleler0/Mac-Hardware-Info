import Foundation

// MARK: - Same logic as ViewController.getData()

func getDataCLI(preventSharing: Bool) -> Data {
    var data = "OABS".data(using: .utf8)!
    data.append(preventSharing ? 1 : 0)
    data.append(try! getHwInfo().serializedData())
    return data
}

// MARK: - MAIN CLI OUTPUT (replaces GUI button action)

let preventSharing = true   // same as toggle in GUI

let outputData = getDataCLI(preventSharing: preventSharing)
let output = outputData.base64EncodedString()

print("=== Mac Hardware Info CLI ===")
print("Prevent Sharing:", preventSharing)

print("\n=== Activation Payload (Base64) ===")
print(output)

// MARK: - mimic GUI “Copied!” behavior
print("\nCopied!")

// mimic GUI delay reset
Thread.sleep(forTimeInterval: 3)

print("Ready for next code")
