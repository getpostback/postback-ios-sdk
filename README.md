# Postback iOS SDK

Lightweight mobile attribution SDK for iOS. Tracks installs, events, and campaign attribution with offline support and Apple Ads integration.

The unreleased restored-signal test build does not import AppTrackingTransparency, inspect ATT status, or request ATT permission. It collects a device-signal bundle for probabilistic click-to-install attribution, including hardware model, WebView user agent, screen, processor/memory, battery/power, language/locale/timezone, GPU, network/radio, best-effort carrier/SIM metadata, and color scheme. It links AdSupport only to include an IDFA when iOS already exposes a usable non-zero value; it also includes IDFV when available. Apple Ads attribution uses Apple's AdServices framework.

Several CoreTelephony carrier APIs are deprecated as of iOS 16.4 and may return no data on modern devices, simulators, dual-SIM configurations, or devices without active cellular service. Unavailable signals are omitted. The network monitor asynchronously captures one path snapshot and then cancels rather than remaining active. The SDK never presents the ATT prompt, but the host app remains responsible for its App Store privacy answers and any consent flow required by its complete data practices.

This restored-signal configuration is test-only, not an App Store-ready privacy posture. Its manifest declares tracking but intentionally omits a tracking-domain declaration so iOS 17 does not block SDK traffic during tests when ATT is denied. Resolve the production consent, manifest, privacy-policy, and App Store disclosure strategy before shipping it.

Release status: the package and podspec below still resolve the published `1.0.2` binary. They do not distribute this unreleased test build until a new XCFramework is uploaded and the package version/checksum are updated. Do not publish these metadata edits as `1.0.2`.

## Installation

### Swift Package Manager (Recommended)

Add this package in Xcode:

1. File > Add Package Dependencies
2. Enter: `https://github.com/getpostback/postback-ios-sdk`
3. Select version rule: "Up to Next Major" from `1.0.2`

Or add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/getpostback/postback-ios-sdk", from: "1.0.2")
]
```

### CocoaPods

```ruby
pod 'PostbackSDK', '~> 1.0.2'
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

The unreleased test XCFramework produced for this change ships a `PrivacyInfo.xcprivacy` manifest, which declares:

| Manifest entry | What it declares |
|---|---|
| `NSPrivacyAccessedAPICategoryUserDefaults` (reason `CA92.1`) | The SDK reads/writes its own `UserDefaults` keys for install state, queued events, attribution cache, and retry flags. |
| `NSPrivacyCollectedDataTypeDeviceID` (Linked, Tracking) | The SDK's random app-install identifier, `postbackId`, plus IDFA/IDFV when already available. |
| `NSPrivacyCollectedDataTypeProductInteraction` (Linked, Tracking) | Event names, params, revenue, currency, and timestamps. |
| `NSPrivacyCollectedDataTypeUserID` (Linked, Tracking) | `customerUserId`, when configured by the host app. |
| `NSPrivacyCollectedDataTypeCoarseLocation` (Linked, Tracking) | Server-derived country and region from request metadata. |
| `NSPrivacyCollectedDataTypeOtherDataTypes` (Linked, Tracking) | Hardware, screen, browser, processor/memory, power/battery, language/locale/timezone, GPU, network/carrier, appearance, SDK/platform, OS/app, attribution, Google Ads consent, and developer-defined event data. |
| `NSPrivacyTracking` | `true`, because the signal bundle is used for probabilistic ad-attribution matching. |
| `NSPrivacyTrackingDomains` | Not declared in this test build. |

Match these entries in your App Store privacy answers for your specific app and enabled integrations. Postback is infrastructure you configure; if you use Postback data for advertising measurement, ad network uploads, or another purpose that changes your app's privacy posture, update your own disclosures and consent flow accordingly.

Postback does not require `NSUserTrackingUsageDescription`. If another SDK or another part of your app tracks users, disclose and obtain any permissions required for that separate behavior.

Do not put raw user PII into `params` for `sendEvent` or into `customerUserId`. Both are persisted to `UserDefaults` for retry durability; Apple documents `UserDefaults` as storage for nonsensitive settings.

## Requirements

- iOS 14.0+
- Swift 5.9+
- Xcode 15+

## License

MIT License. See [LICENSE](LICENSE) for details.
