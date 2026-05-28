import Foundation

// MARK: - Build same payload as GUI

let hw = getHwInfo()

// This matches ViewController.getData()
func buildPayload(preventSharing: Bool) -> Data {
    var data = "OABS".data(using: .utf8)!
    data.append(preventSharing ? 1 : 0)
    data.append(try! hw.serializedData())
    return data
}

// MARK: - CLI logic (replaces button action)

let preventSharing = true

let payload = buildPayload(preventSharing: preventSharing)
let output = payload.base64EncodedString()

print("=== Mac Hardware Info CLI ===")
print("Prevent Sharing:", preventSharing)

print("\n=== Base64 Activation Payload ===")
print(output)

print("\nCopied!")

Thread.sleep(forTimeInterval: 3)
print("Ready for next code")
