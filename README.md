# Postback iOS SDK

Lightweight mobile attribution SDK for iOS. Tracks installs, events, and campaign attribution with offline support and Apple Ads integration.

## Installation

### Swift Package Manager (Recommended)

Add this package in Xcode:

1. File > Add Package Dependencies
2. Enter: `https://github.com/getpostback/postback-ios-sdk`
3. Select version rule: "Up to Next Major" from `1.0.0`

Or add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/getpostback/postback-ios-sdk", from: "1.0.0")
]
```

### CocoaPods

```ruby
pod 'PostbackSDK', '~> 1.0.0'
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

## Privacy

The XCFramework ships a `PrivacyInfo.xcprivacy` manifest. Match these entries in your App Store privacy details when you submit a build:

| Manifest entry | What it declares |
|---|---|
| `NSPrivacyAccessedAPICategoryUserDefaults` (reason `CA92.1`) | The SDK reads/writes its own `UserDefaults` keys for install state, queued events, attribution cache, and retry flags. |
| `NSPrivacyCollectedDataTypeDeviceID` (Linked, Tracking) | IDFA (when ATT is authorized), IDFV, and the SDK's own `postbackId` are collected for analytics and third-party advertising attribution. |
| `NSPrivacyCollectedDataTypeProductInteraction` (Linked, Tracking) | Event names, params, revenue, currency, and timestamps collected for analytics and third-party advertising attribution. |
| `NSPrivacyCollectedDataTypeUserID` (Linked, Tracking) | `customerUserId`, when configured by the host app, is collected for install/event linking and attribution exports. |
| `NSPrivacyCollectedDataTypeCoarseLocation` (Linked, Tracking) | Server-side request metadata can derive coarse geography for analytics and attribution reporting. |
| `NSPrivacyCollectedDataTypeOtherDataTypes` (Linked, Tracking) | Custom event parameters are developer-defined and may include app-specific analytics fields. |
| `NSPrivacyTracking: true` | The SDK is a tracking SDK in Apple's terminology. |
| `NSPrivacyTrackingDomains` | `api.postback.sh` - the SDK's ingest endpoint. |

Required host-app `Info.plist` entries:

- `NSUserTrackingUsageDescription` is required if you call `PostbackNative.requestTrackingAuthorization()` or otherwise request IDFA access.
- `NSAdvertisingAttributionReportEndpoint` is required if you use SKAdNetwork postbacks.

Do not put raw user PII into `params` for `sendEvent` or into `customerUserId`. Both are persisted to `UserDefaults` for retry durability; Apple documents `UserDefaults` as storage for nonsensitive settings.

## Requirements

- iOS 14.0+
- Swift 5.9+
- Xcode 15+

## License

MIT License. See [LICENSE](LICENSE) for details.
