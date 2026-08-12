# Postback iOS SDK

Lightweight mobile attribution SDK for iOS. Tracks installs, events, and campaign attribution with offline support, device-context matching, and Apple Ads integration.

## Installation

### Swift Package Manager (Recommended)

Add this package in Xcode:

1. File > Add Package Dependencies
2. Enter: `https://github.com/getpostback/postback-ios-sdk`
3. Select version rule: "Up to Next Major" from `2.0.0`

Or add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/getpostback/postback-ios-sdk", from: "2.0.0")
]
```

### CocoaPods

```ruby
pod 'PostbackSDK', '~> 2.0.0'
```

## Quick Start

```swift
import PostbackSDK

// Configure on app launch
let config = PostbackConfig(apiKey: "pb_live_your_api_key")
await Postback.shared.configure(config)

// Track events
await Postback.shared.sendEvent(.purchase, name: "premium_upgrade", params: ["price": 9.99])

// Get attribution
if let attribution = Postback.shared.getAttribution() {
    print("Source: \(attribution.source)")
}
```

## Configuration

```swift
let config = PostbackConfig(
    apiKey: "pb_live_...",                    // Required
    apiURL: URL(string: "https://api.postback.sh")!,  // Default
    enableAppleAdsAttribution: true,          // Default: true
    isDebug: false,                           // Default: false
    logLevel: .warn,                          // Default: .warn
    customerUserId: nil,                      // Optional
    autoTrackSessions: true,                  // Default: true. Auto-fires .sessionStart on
                                              // configure() and foreground, debounced 30 min.
    autoRefreshAttribution: true              // Default: true. Refreshes attribution on
                                              // configure() and foreground so server-side
                                              // late resolution propagates.
)
```

## API Reference

```swift
// Lifecycle
Postback.shared.configure(_ config: PostbackConfig) async
Postback.shared.destroy()
Postback.shared.isInitialized -> Bool

// Events
Postback.shared.sendEvent(_ type: PostbackEventType, name: String?, params: [String: Any]?) async
Postback.shared.sendTestEvent() async -> TestEventResult
Postback.shared.flush() async

// Attribution
Postback.shared.getAttribution() -> AttributionResult?
Postback.shared.getAttributionParams() -> [String: String]
Postback.shared.getPostbackId() -> String?
Postback.shared.refreshAttribution() async -> AttributionResult?
Postback.shared.enableAppleAdsAttribution() -> Bool

// User
Postback.shared.setCustomerUserId(_ userId: String) async

// State
Postback.shared.isSdkDisabled() -> Bool
Postback.shared.clearData()
```

### Event Types

`sessionStart`, `login`, `signUp`, `register`, `purchase`, `subscribe`, `startTrial`, `addPaymentInfo`, `addToCart`, `addToWishlist`, `initiateCheckout`, `viewContent`, `viewItem`, `search`, `share`, `tutorialComplete`, `achieveLevel`, `levelStart`, `levelComplete`, `custom`

### Event Validation (1.0.1+)

- Custom events require a `name`. The SDK trims leading and trailing whitespace, then requires 1 through 255 UTF-16 code units and rejects names containing a NUL (`U+0000`) character. Invalid custom events are not queued or sent.
- Names on built-in events are optional. The SDK trims a valid name and omits an invalid one while still sending the event.
- `currency` is optional. When present, it is trimmed, must contain exactly three ASCII letters (`A-Z` or `a-z`), and is normalized to uppercase. An invalid currency is omitted while the event is still sent.
- Events queued by an older SDK are revalidated when they flush. Invalid legacy custom events are dropped, and invalid legacy names on built-in events are omitted.

## Privacy

Postback does not show an ATT prompt. IDFA is used only if the host app already has authorized access; Apple Ads attribution works through AdServices independently. Data handling is described in the [Postback Privacy Policy](https://postback.sh/privacy). Host apps remain responsible for their own App Store privacy answers, notices, and permissions.

Do not put raw user PII into `params` for `sendEvent` or into `customerUserId`. Both are persisted to `UserDefaults` for retry durability; Apple documents `UserDefaults` as storage for nonsensitive settings.

## Requirements

- iOS 14.0+
- Swift 5.9+
- Xcode 15+

## License

MIT License. See [LICENSE](LICENSE) for details.
