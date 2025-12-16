# rightify

> A lightweight, backend-agnostic rights engine for Flutter apps.

---

## ✨ Why this library?

Most Flutter apps handle payments via Stripe, RevenueCat, or app stores, but **feature access logic is often rewritten for every app**.

`rightify` focuses on **one simple problem**:

> "Can this user perform this action right now?"

No enums, no business logic, no backend coupling.

---

## 🚀 Features

* Generic rights engine (String-based)
* Action → minimum required level rules
* Ordered rights hierarchy
* Local cache (SharedPreferences)
* Optional remote source (JSON)
* Simple API: `canPerform(action)`
* Fully testable

---

## ❌ What this library does NOT do

* Payment processing
* Subscription validation
* Backend security
* Fraud prevention

> Always re-check permissions on the backend.

---

## 📦 Installation

```yaml
dependencies:
  rightify: ^0.1.0
```

---

## 🧠 Core concepts

### Actions

Actions are **strings** defined by the app developer:

```dart
const exportPdf = 'export_pdf';
const createInvoice = 'create_invoice';
```

### Rights levels

Also **strings**, fully controlled by the app:

```dart
const free = 'free';
const premium = 'premium';
const gold = 'gold';
```

### Rights hierarchy

Order matters:

```dart
final hierarchy = ['free', 'premium', 'gold'];
```

Higher index = more permissions.

### Action rules

Define the **minimum level** required for each action:

```dart
final rules = {
  exportPdf: gold,
  createInvoice: premium,
};
```

---

## 🔧 Initialization

```dart
await Rightify.initialize(
  hierarchy: hierarchy,
  rules: rules,
  localSource: SharedPrefsRightsSource(),
  remoteSource: RemoteRightsSource(() => api.get('/me/rights')),
);
```

---

## ✅ Checking permissions

```dart
if (Rightify.canPerform(exportPdf)) {
  exportPdf();
} else {
  showPaywall();
}
```

---

## 🔄 Updating user level

```dart
await Rightify.setLevel(gold);
```

---

## 🌐 Remote JSON format example

```json
{
  "right_level": "gold"
}
```

---

## 🧪 Testing

* Fully testable rights engine
* Fake sources for local/remote
* No Flutter UI dependencies

Check the `test/` folder for examples.

---

## 🛣 Roadmap

* Expiring rights
* Free trials
* Scoped actions
* Analytics hooks
* RevenueCat / Stripe adapters

---

## 📄 License

MIT
