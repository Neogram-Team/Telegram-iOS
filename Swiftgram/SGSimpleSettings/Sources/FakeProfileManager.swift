import Foundation

// MARK: - Модели данных мода «Профиль»

public struct FakeNftUsername: Codable, Equatable, Hashable, Sendable {
    public var username: String
    public var priceTon: Double
    public var purchaseDate: Int32

    public init(username: String, priceTon: Double, purchaseDate: Int32 = Int32(Date().timeIntervalSince1970)) {
        self.username = username
        self.priceTon = priceTon
        self.purchaseDate = purchaseDate
    }
}

public struct FakeStarGiftItem: Codable, Equatable, Hashable, Sendable {
    public var id: UUID
    public var baseGiftId: Int64
    public var backdropColorHex: String
    public var patternName: String
    public var giftNumber: Int32
    public var canTransfer: Bool
    public var canResell: Bool
    public var ownerPeerId: Int64
    public var isPinned: Bool
    public var isWorn: Bool
    public var resellPriceStars: Int64?
    public var resellPriceTon: Double?
    public var senderPeerId: Int64?
    public var senderName: String?
    public var sendDate: Int32
    public var canCraft: Bool
    public var isUpgraded: Bool
    public var canUpgrade: Bool
    public var title: String?
    public var slug: String?
    public var innerColor: Int32?
    public var outerColor: Int32?
    public var patternColor: Int32?
    public var textColor: Int32?
    public var upgradeStars: Int64?
    public var rawUniqueGiftData: Data?
    public var hideOriginalDetails: Bool

    public init(
        id: UUID = UUID(),
        baseGiftId: Int64 = 0,
        backdropColorHex: String = "#D4AF37",
        patternName: String = "Star",
        giftNumber: Int32 = 1,
        canTransfer: Bool = true,
        canResell: Bool = true,
        ownerPeerId: Int64 = 0,
        isPinned: Bool = false,
        isWorn: Bool = false,
        resellPriceStars: Int64? = nil,
        resellPriceTon: Double? = nil,
        senderPeerId: Int64? = nil,
        senderName: String? = nil,
        sendDate: Int32 = Int32(Date().timeIntervalSince1970 - 86400 * 3),
        canCraft: Bool = true,
        isUpgraded: Bool = true,
        canUpgrade: Bool? = nil,
        title: String? = nil,
        slug: String? = nil,
        innerColor: Int32? = nil,
        outerColor: Int32? = nil,
        patternColor: Int32? = nil,
        textColor: Int32? = nil,
        upgradeStars: Int64? = nil,
        rawUniqueGiftData: Data? = nil,
        hideOriginalDetails: Bool = false
    ) {
        self.id = id
        self.baseGiftId = baseGiftId
        self.backdropColorHex = backdropColorHex
        self.patternName = patternName
        self.giftNumber = giftNumber
        self.canTransfer = canTransfer
        self.canResell = canResell
        self.ownerPeerId = ownerPeerId
        self.isPinned = isPinned
        self.isWorn = isWorn
        self.resellPriceStars = resellPriceStars
        self.resellPriceTon = resellPriceTon
        self.senderPeerId = senderPeerId
        self.senderName = senderName
        self.sendDate = sendDate
        self.canCraft = canCraft
        self.isUpgraded = isUpgraded
        self.canUpgrade = canUpgrade ?? (!isUpgraded)
        self.title = title
        self.slug = slug
        self.innerColor = innerColor
        self.outerColor = outerColor
        self.patternColor = patternColor
        self.textColor = textColor
        self.upgradeStars = upgradeStars
        self.rawUniqueGiftData = rawUniqueGiftData
        self.hideOriginalDetails = hideOriginalDetails
    }

    private enum CodingKeys: String, CodingKey {
        case id, baseGiftId, backdropColorHex, patternName, giftNumber
        case canTransfer, canResell, ownerPeerId, isPinned, isWorn
        case resellPriceStars, resellPriceTon, senderPeerId, senderName, sendDate, canCraft
        case isUpgraded, canUpgrade, title, slug, innerColor, outerColor, patternColor, textColor, upgradeStars
        case rawUniqueGiftData, hideOriginalDetails
    }

    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.id = (try? c.decode(UUID.self, forKey: .id)) ?? UUID()
        self.baseGiftId = (try? c.decode(Int64.self, forKey: .baseGiftId)) ?? 0
        self.backdropColorHex = (try? c.decode(String.self, forKey: .backdropColorHex)) ?? "#D4AF37"
        self.patternName = (try? c.decode(String.self, forKey: .patternName)) ?? "Star"
        self.giftNumber = (try? c.decode(Int32.self, forKey: .giftNumber)) ?? 1
        self.canTransfer = (try? c.decode(Bool.self, forKey: .canTransfer)) ?? true
        self.canResell = (try? c.decode(Bool.self, forKey: .canResell)) ?? true
        self.ownerPeerId = (try? c.decode(Int64.self, forKey: .ownerPeerId)) ?? 0
        self.isPinned = (try? c.decode(Bool.self, forKey: .isPinned)) ?? false
        self.isWorn = (try? c.decode(Bool.self, forKey: .isWorn)) ?? false
        self.resellPriceStars = try? c.decodeIfPresent(Int64.self, forKey: .resellPriceStars)
        self.resellPriceTon = try? c.decodeIfPresent(Double.self, forKey: .resellPriceTon)
        self.senderPeerId = try? c.decodeIfPresent(Int64.self, forKey: .senderPeerId)
        self.senderName = try? c.decodeIfPresent(String.self, forKey: .senderName)
        self.sendDate = (try? c.decode(Int32.self, forKey: .sendDate)) ?? Int32(Date().timeIntervalSince1970 - 86400 * 3)
        self.canCraft = (try? c.decode(Bool.self, forKey: .canCraft)) ?? true
        self.isUpgraded = (try? c.decode(Bool.self, forKey: .isUpgraded)) ?? true
        self.canUpgrade = (try? c.decode(Bool.self, forKey: .canUpgrade)) ?? (!self.isUpgraded)
        self.title = try? c.decodeIfPresent(String.self, forKey: .title)
        self.slug = try? c.decodeIfPresent(String.self, forKey: .slug)
        self.innerColor = try? c.decodeIfPresent(Int32.self, forKey: .innerColor)
        self.outerColor = try? c.decodeIfPresent(Int32.self, forKey: .outerColor)
        self.patternColor = try? c.decodeIfPresent(Int32.self, forKey: .patternColor)
        self.textColor = try? c.decodeIfPresent(Int32.self, forKey: .textColor)
        self.upgradeStars = try? c.decodeIfPresent(Int64.self, forKey: .upgradeStars)
        self.rawUniqueGiftData = try? c.decodeIfPresent(Data.self, forKey: .rawUniqueGiftData)
        self.hideOriginalDetails = (try? c.decodeIfPresent(Bool.self, forKey: .hideOriginalDetails)) ?? false
    }

    public func encode(to encoder: Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(self.id, forKey: .id)
        try c.encode(self.baseGiftId, forKey: .baseGiftId)
        try c.encode(self.backdropColorHex, forKey: .backdropColorHex)
        try c.encode(self.patternName, forKey: .patternName)
        try c.encode(self.giftNumber, forKey: .giftNumber)
        try c.encode(self.canTransfer, forKey: .canTransfer)
        try c.encode(self.canResell, forKey: .canResell)
        try c.encode(self.ownerPeerId, forKey: .ownerPeerId)
        try c.encode(self.isPinned, forKey: .isPinned)
        try c.encode(self.isWorn, forKey: .isWorn)
        try c.encode(self.canUpgrade, forKey: .canUpgrade)
        try c.encodeIfPresent(self.resellPriceStars, forKey: .resellPriceStars)
        try c.encodeIfPresent(self.resellPriceTon, forKey: .resellPriceTon)
        try c.encodeIfPresent(self.senderPeerId, forKey: .senderPeerId)
        try c.encodeIfPresent(self.senderName, forKey: .senderName)
        try c.encode(self.sendDate, forKey: .sendDate)
        try c.encode(self.canCraft, forKey: .canCraft)
        try c.encode(self.isUpgraded, forKey: .isUpgraded)
        try c.encodeIfPresent(self.title, forKey: .title)
        try c.encodeIfPresent(self.slug, forKey: .slug)
        try c.encodeIfPresent(self.innerColor, forKey: .innerColor)
        try c.encodeIfPresent(self.outerColor, forKey: .outerColor)
        try c.encodeIfPresent(self.patternColor, forKey: .patternColor)
        try c.encodeIfPresent(self.textColor, forKey: .textColor)
        try c.encodeIfPresent(self.upgradeStars, forKey: .upgradeStars)
        try c.encodeIfPresent(self.rawUniqueGiftData, forKey: .rawUniqueGiftData)
        try c.encode(self.hideOriginalDetails, forKey: .hideOriginalDetails)
    }
}

public struct FakeTransactionItem: Codable, Equatable, Hashable, Sendable {
    public var id: String
    public var isTon: Bool
    public var amount: Int64 // для Stars — целое число звезд; для TON — нанотоны (1 TON = 10^9 нанотонов)
    public var title: String
    public var subtitle: String
    public var date: Int32
    public var isIncoming: Bool

    public init(
        id: String = "fake_tx_\(UUID().uuidString)",
        isTon: Bool,
        amount: Int64,
        title: String = "От анонима",
        subtitle: String = "Пополнение баланса",
        date: Int32 = Int32(Date().timeIntervalSince1970),
        isIncoming: Bool = true
    ) {
        self.id = id
        self.isTon = isTon
        self.amount = amount
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.isIncoming = isIncoming
    }
}

// MARK: - Потокобезопасный синглтон управления Fake Profile с привязкой к peerId

public final class FakeProfileManager: @unchecked Sendable {
    public static let shared = FakeProfileManager()
    
    private let lock = NSRecursiveLock()
    private let defaults = UserDefaults.standard
    
    private enum Keys {
        static let isVisualPremium = "FakeProfile_isVisualPremium"
        static let fakeStarsBalance = "FakeProfile_fakeStarsBalance"
        static let fakeTonBalance = "FakeProfile_fakeTonBalance"
        static let isFakePhoneEnabled = "FakeProfile_isFakePhoneEnabled"
        static let fakePhone = "FakeProfile_fakePhone"
        static let fakePhonePriceTon = "FakeProfile_fakePhonePriceTon"
        static let fakeMainUsername = "FakeProfile_fakeMainUsername"
        static let fakePurchaseDateString = "FakeProfile_fakePurchaseDateString"
        static let fakeEmojiStatusFileId = "FakeProfile_fakeEmojiStatusFileId"
        static let fakeNameColor = "FakeProfile_fakeNameColor"
        static let fakeProfileColor = "FakeProfile_fakeProfileColor"
        static let isProfileColorReset = "FakeProfile_isProfileColorReset"
        static let fakeReplyBackgroundEmojiId = "FakeProfile_fakeReplyBackgroundEmojiId"
        static let fakeProfileBackgroundEmojiId = "FakeProfile_fakeProfileBackgroundEmojiId"
        static let fakeChannelTitle = "FakeProfile_fakeChannelTitle"
        static let fakeBusinessLocation = "FakeProfile_fakeBusinessLocation"
        static let fakeBusinessHours = "FakeProfile_fakeBusinessHours"
        static let fakeUsernames = "FakeProfile_fakeUsernames"
        static let fakeGifts = "FakeProfile_fakeGifts"
        static let fakeTransactions = "FakeProfile_fakeTransactions"
        static let fakeGiftsOrder = "FakeProfile_fakeGiftsOrder"
        static let currentAccountPeerId = "FakeProfile_currentAccountPeerId"
    }
    
    private init() {}
    
    // Единый метод формирования ключа с привязкой к конкретному peerId
    public func key(_ base: String, peerId: Int64) -> String {
        return "\(base)_\(peerId)"
    }
    
    public static func key(_ base: String, peerId: Int64) -> String {
        return "\(base)_\(peerId)"
    }
    
    private func accountKey(_ base: String, peerId: Int64? = nil) -> String {
        let effectivePeerId = peerId ?? self.currentAccountPeerId ?? 0
        if effectivePeerId != 0 {
            return "\(base)_\(effectivePeerId)"
        }
        return "\(base)_0"
    }
    
    // Строгое чтение данных конкретного аккаунта (без утечки данных между аккаунтами)
    private func readValue<T>(baseKey: String, peerId: Int64? = nil, read: (String) -> T?) -> T? {
        let effectivePeerId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectivePeerId != 0 else {
            return nil
        }
        let specificKey = "\(baseKey)_\(effectivePeerId)"
        if self.defaults.object(forKey: specificKey) != nil {
            return read(specificKey)
        }
        return nil
    }
    
    // Идентификатор текущего авторизованного пользователя
    public var currentAccountPeerId: Int64? {
        get {
            self.lock.lock()
            defer { self.lock.unlock() }
            guard let obj = self.defaults.object(forKey: Keys.currentAccountPeerId) else {
                return nil
            }
            let val = (obj as? NSNumber)?.int64Value ?? Int64(self.defaults.integer(forKey: Keys.currentAccountPeerId))
            return val != 0 ? val : nil
        }
        set {
            self.lock.lock()
            defer { self.lock.unlock() }
            if let val = newValue {
                self.defaults.set(NSNumber(value: val), forKey: Keys.currentAccountPeerId)
            } else {
                self.defaults.removeObject(forKey: Keys.currentAccountPeerId)
            }
        }
    }
    
    public func isCurrentAccountPeer(id: Int64) -> Bool {
        self.lock.lock()
        defer { self.lock.unlock() }
        guard let obj = self.defaults.object(forKey: Keys.currentAccountPeerId) else {
            return false
        }
        let current = (obj as? NSNumber)?.int64Value ?? Int64(self.defaults.integer(forKey: Keys.currentAccountPeerId))
        return current != 0 && current == id
    }
    
    // 1. Telegram Premium
    public func isVisualPremium(for peerId: Int64? = nil) -> Bool {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.isVisualPremium, peerId: peerId)
        return self.defaults.bool(forKey: key)
    }
    
    public func setVisualPremium(_ value: Bool, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.isVisualPremium, peerId: peerId)
        self.defaults.set(value, forKey: key)
    }
    
    public var isVisualPremium: Bool {
        get { return self.isVisualPremium(for: self.currentAccountPeerId) }
        set { self.setVisualPremium(newValue, for: self.currentAccountPeerId) }
    }
    
    // Баланс Звёзд
    public func fakeStarsBalance(for peerId: Int64? = nil) -> Int64? {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeStarsBalance, peerId: peerId) { k in
            (self.defaults.object(forKey: k) as? NSNumber)?.int64Value ?? Int64(self.defaults.integer(forKey: k))
        }
    }
    
    public func setFakeStarsBalance(_ value: Int64?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let oldBalance = self.fakeStarsBalance(for: peerId) ?? 0
        let key = self.accountKey(Keys.fakeStarsBalance, peerId: peerId)
        if let val = value {
            guard val >= 0 else { return }
            self.defaults.set(NSNumber(value: val), forKey: key)
            if val > oldBalance {
                let diff = val - oldBalance
                self.addFakeTransaction(FakeTransactionItem(isTon: false, amount: diff, title: "От анонима", subtitle: "Пополнение баланса Stars"), for: peerId)
            }
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    public var fakeStarsBalance: Int64? {
        get { return self.fakeStarsBalance(for: self.currentAccountPeerId) }
        set { self.setFakeStarsBalance(newValue, for: self.currentAccountPeerId) }
    }
    
    // Безопасная конвертация TON в нанотоны (1 TON = 1_000_000_000 нанотонов) с защитой от переполнения и NaN
    public static func tonToNanos(_ ton: Double) -> Int64 {
        guard ton.isFinite && !ton.isNaN && ton > 0 else { return 0 }
        let maxSafeTon: Double = 9_223_372_036.0 // Гарантирует clamped * 1e9 <= Int64.max
        let clamped = min(maxSafeTon, ton)
        return Int64((clamped * 1_000_000_000.0).rounded())
    }
    
    // Безопасная конвертация нанотонов в TON (1 TON = 1_000_000_000 нанотонов)
    public static func nanosToTon(_ nanos: Int64) -> Double {
        return Double(nanos) / 1_000_000_000.0
    }
    
    // Баланс TON (значение в ТОНах, например 68.2)
    public func fakeTonBalance(for peerId: Int64? = nil) -> Double? {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeTonBalance, peerId: peerId) { k in
            self.defaults.double(forKey: k)
        }
    }
    
    // Баланс TON в нанотонах
    public func fakeTonNanos(for peerId: Int64? = nil) -> Int64? {
        guard let ton = self.fakeTonBalance(for: peerId) else {
            return nil
        }
        return Self.tonToNanos(ton)
    }
    
    public func setFakeTonBalance(_ value: Double?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let oldTon = self.fakeTonBalance(for: peerId) ?? 0.0
        let key = self.accountKey(Keys.fakeTonBalance, peerId: peerId)
        if let val = value {
            guard val >= 0 && val.isFinite && !val.isNaN else { return }
            self.defaults.set(val, forKey: key)
            if val > oldTon {
                let diffTon = val - oldTon
                let diffNanos = Self.tonToNanos(diffTon)
                self.addFakeTransaction(FakeTransactionItem(isTon: true, amount: diffNanos, title: "От анонима", subtitle: "Пополнение баланса TON"), for: peerId)
            }
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    // Alias-методы для гарантированной типобезопасности
    public func fakeStars(for peerId: Int64? = nil) -> Int64 {
        return self.fakeStarsBalance(for: peerId) ?? 0
    }
    
    public func setFakeStars(_ value: Int64, for peerId: Int64? = nil) {
        self.setFakeStarsBalance(value, for: peerId)
    }
    
    public func fakeTon(for peerId: Int64? = nil) -> Double {
        return self.fakeTonBalance(for: peerId) ?? 0.0
    }
    
    public func setFakeTon(_ value: Double, for peerId: Int64? = nil) {
        self.setFakeTonBalance(value, for: peerId)
    }
    
    public func addTransaction(_ item: FakeTransactionItem, for peerId: Int64? = nil) {
        self.addFakeTransaction(item, for: peerId)
    }
    
    // Атомарное списание Stars с проверкой баланса и созданием транзакции (защита от гонок и double-spending)
    public func deductFakeStars(_ amount: Int64, for peerId: Int64, title: String = "Покупка подарка", subtitle: String = "") -> Bool {
        guard amount > 0 else { return false }
        self.lock.lock()
        defer { self.lock.unlock() }
        let current = self.readValue(baseKey: Keys.fakeStarsBalance, peerId: peerId) { k in
            (self.defaults.object(forKey: k) as? NSNumber)?.int64Value ?? Int64(self.defaults.integer(forKey: k))
        } ?? 0
        guard current >= amount else {
            return false
        }
        let newBalance = current - amount
        let key = self.accountKey(Keys.fakeStarsBalance, peerId: peerId)
        self.defaults.set(NSNumber(value: newBalance), forKey: key)
        self.addFakeTransaction(FakeTransactionItem(isTon: false, amount: amount, title: title, subtitle: subtitle, date: Int32(Date().timeIntervalSince1970), isIncoming: false), for: peerId)
        return true
    }
    
    // Атомарное списание TON (в нанотонах) с проверкой баланса и созданием транзакции (защита от потери точности и double-spending)
    public func deductFakeTon(nanos: Int64, for peerId: Int64, title: String = "Покупка подарка", subtitle: String = "") -> Bool {
        guard nanos > 0 else { return false }
        self.lock.lock()
        defer { self.lock.unlock() }
        guard let currentTon = self.readValue(baseKey: Keys.fakeTonBalance, peerId: peerId, read: { k in self.defaults.double(forKey: k) }) else {
            return false
        }
        let currentNanos = Self.tonToNanos(currentTon)
        guard currentNanos >= nanos else {
            return false
        }
        let remainingNanos = currentNanos - nanos
        let newTon = Self.nanosToTon(remainingNanos)
        let key = self.accountKey(Keys.fakeTonBalance, peerId: peerId)
        self.defaults.set(newTon, forKey: key)
        self.addFakeTransaction(FakeTransactionItem(isTon: true, amount: nanos, title: title, subtitle: subtitle, date: Int32(Date().timeIntervalSince1970), isIncoming: false), for: peerId)
        return true
    }
    
    public var fakeTonBalance: Double? {
        get { return self.fakeTonBalance(for: self.currentAccountPeerId) }
        set { self.setFakeTonBalance(newValue, for: self.currentAccountPeerId) }
    }
    
    // Основной юзернейм
    public func fakeMainUsername(for peerId: Int64? = nil) -> String? {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeMainUsername, peerId: peerId) { k in
            let s = self.defaults.string(forKey: k)
            return (s?.isEmpty ?? true) ? nil : s
        }
    }
    
    public func setFakeMainUsername(_ value: String?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeMainUsername, peerId: peerId)
        if let val = value, !val.isEmpty {
            self.defaults.set(val, forKey: key)
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    public var fakeMainUsername: String? {
        get { return self.fakeMainUsername(for: self.currentAccountPeerId) }
        set { self.setFakeMainUsername(newValue, for: self.currentAccountPeerId) }
    }
    
    // Дата покупки Fragment
    public func fakePurchaseDateString(for peerId: Int64? = nil) -> String? {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakePurchaseDateString, peerId: peerId) { k in
            self.defaults.string(forKey: k)
        }
    }
    
    public func setFakePurchaseDateString(_ value: String?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakePurchaseDateString, peerId: peerId)
        if let val = value, !val.isEmpty {
            self.defaults.set(val, forKey: key)
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    public var fakePurchaseDateString: String? {
        get { return self.fakePurchaseDateString(for: self.currentAccountPeerId) }
        set { self.setFakePurchaseDateString(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakePurchaseDateTimestamp(for peerId: Int64? = nil) -> Int32 {
        self.lock.lock()
        defer { self.lock.unlock() }
        if let raw = self.fakePurchaseDateString(for: peerId)?.trimmingCharacters(in: .whitespacesAndNewlines), !raw.isEmpty {
            if let numeric = Int32(raw), numeric > 100000000 {
                return numeric
            }
            let formats = ["dd.MM.yyyy", "yyyy-MM-dd", "dd/MM/yyyy", "d MMMM yyyy", "dd.MM.yy"]
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ru_RU")
            for f in formats {
                formatter.dateFormat = f
                if let d = formatter.date(from: raw) {
                    return Int32(d.timeIntervalSince1970)
                }
            }
            formatter.locale = Locale(identifier: "en_US_POSIX")
            for f in formats {
                formatter.dateFormat = f
                if let d = formatter.date(from: raw) {
                    return Int32(d.timeIntervalSince1970)
                }
            }
        }
        return Int32(Date().timeIntervalSince1970 - 86400 * 365)
    }
    
    public var fakePurchaseDateTimestamp: Int32 {
        return self.fakePurchaseDateTimestamp(for: self.currentAccountPeerId)
    }
    
    // Эмодзи-статус
    public func fakeEmojiStatusFileId(for peerId: Int64? = nil) -> Int64? {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeEmojiStatusFileId, peerId: peerId) { k in
            (self.defaults.object(forKey: k) as? NSNumber)?.int64Value ?? Int64(self.defaults.integer(forKey: k))
        }
    }
    
    public func setFakeEmojiStatusFileId(_ value: Int64?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeEmojiStatusFileId, peerId: peerId)
        if let val = value {
            self.defaults.set(NSNumber(value: val), forKey: key)
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    public var fakeEmojiStatusFileId: Int64? {
        get { return self.fakeEmojiStatusFileId(for: self.currentAccountPeerId) }
        set { self.setFakeEmojiStatusFileId(newValue, for: self.currentAccountPeerId) }
    }
    
    // Цвета имени и профиля
    public func fakeNameColor(for peerId: Int64? = nil) -> Int32? {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeNameColor, peerId: peerId) { k in
            Int32(self.defaults.integer(forKey: k))
        }
    }
    
    public func setFakeNameColor(_ value: Int32?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeNameColor, peerId: peerId)
        if let val = value {
            self.defaults.set(Int(val), forKey: key)
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    public var fakeNameColor: Int32? {
        get { return self.fakeNameColor(for: self.currentAccountPeerId) }
        set { self.setFakeNameColor(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakeProfileColor(for peerId: Int64? = nil) -> Int32? {
        self.lock.lock()
        defer { self.lock.unlock() }
        if self.isProfileColorReset(for: peerId) {
            return nil
        }
        return self.readValue(baseKey: Keys.fakeProfileColor, peerId: peerId) { k in
            Int32(self.defaults.integer(forKey: k))
        }
    }
    
    public func setFakeProfileColor(_ value: Int32?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeProfileColor, peerId: peerId)
        let resetKey = self.accountKey(Keys.isProfileColorReset, peerId: peerId)
        if let val = value {
            self.defaults.set(Int(val), forKey: key)
            self.defaults.set(false, forKey: resetKey)
        } else {
            self.defaults.removeObject(forKey: key)
            self.defaults.set(true, forKey: resetKey)
        }
    }
    
    public var fakeProfileColor: Int32? {
        get { return self.fakeProfileColor(for: self.currentAccountPeerId) }
        set { self.setFakeProfileColor(newValue, for: self.currentAccountPeerId) }
    }
    
    public func isProfileColorReset(for peerId: Int64? = nil) -> Bool {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.isProfileColorReset, peerId: peerId)
        return self.defaults.bool(forKey: key)
    }
    
    public func resetProfileColor(for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let colorKey = self.accountKey(Keys.fakeProfileColor, peerId: peerId)
        let emojiKey = self.accountKey(Keys.fakeProfileBackgroundEmojiId, peerId: peerId)
        let resetKey = self.accountKey(Keys.isProfileColorReset, peerId: peerId)
        self.defaults.removeObject(forKey: colorKey)
        self.defaults.removeObject(forKey: emojiKey)
        self.defaults.set(true, forKey: resetKey)
    }
    
    public func fakeReplyBackgroundEmojiId(for peerId: Int64? = nil) -> Int64? {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeReplyBackgroundEmojiId, peerId: peerId) { k in
            (self.defaults.object(forKey: k) as? NSNumber)?.int64Value ?? Int64(self.defaults.integer(forKey: k))
        }
    }
    
    public func setFakeReplyBackgroundEmojiId(_ value: Int64?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeReplyBackgroundEmojiId, peerId: peerId)
        if let val = value {
            self.defaults.set(NSNumber(value: val), forKey: key)
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    public var fakeReplyBackgroundEmojiId: Int64? {
        get { return self.fakeReplyBackgroundEmojiId(for: self.currentAccountPeerId) }
        set { self.setFakeReplyBackgroundEmojiId(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakeProfileBackgroundEmojiId(for peerId: Int64? = nil) -> Int64? {
        self.lock.lock()
        defer { self.lock.unlock() }
        if self.isProfileColorReset(for: peerId) {
            return nil
        }
        return self.readValue(baseKey: Keys.fakeProfileBackgroundEmojiId, peerId: peerId) { k in
            (self.defaults.object(forKey: k) as? NSNumber)?.int64Value ?? Int64(self.defaults.integer(forKey: k))
        }
    }
    
    public func setFakeProfileBackgroundEmojiId(_ value: Int64?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeProfileBackgroundEmojiId, peerId: peerId)
        if let val = value {
            self.defaults.set(NSNumber(value: val), forKey: key)
        } else {
            self.defaults.removeObject(forKey: key)
        }
    }
    
    public var fakeProfileBackgroundEmojiId: Int64? {
        get { return self.fakeProfileBackgroundEmojiId(for: self.currentAccountPeerId) }
        set { self.setFakeProfileBackgroundEmojiId(newValue, for: self.currentAccountPeerId) }
    }
    
    // Номер телефона
    public func isFakePhoneEnabled(for peerId: Int64? = nil) -> Bool {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.isFakePhoneEnabled, peerId: peerId)
        return self.defaults.bool(forKey: key)
    }
    
    public func setFakePhoneEnabled(_ value: Bool, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.isFakePhoneEnabled, peerId: peerId)
        self.defaults.set(value, forKey: key)
    }
    
    public var isFakePhoneEnabled: Bool {
        get { return self.isFakePhoneEnabled(for: self.currentAccountPeerId) }
        set { self.setFakePhoneEnabled(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakePhone(for peerId: Int64? = nil) -> String {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakePhone, peerId: peerId) { k in
            self.defaults.string(forKey: k)
        } ?? "+888 0000 0000"
    }
    
    public func setFakePhone(_ value: String, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakePhone, peerId: peerId)
        self.defaults.set(value, forKey: key)
    }
    
    public var fakePhone: String {
        get { return self.fakePhone(for: self.currentAccountPeerId) }
        set { self.setFakePhone(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakePhonePriceTon(for peerId: Int64? = nil) -> Double {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakePhonePriceTon, peerId: peerId) { k in
            self.defaults.double(forKey: k)
        } ?? 150.0
    }
    
    public func setFakePhonePriceTon(_ value: Double, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakePhonePriceTon, peerId: peerId)
        self.defaults.set(value, forKey: key)
    }
    
    public var fakePhonePriceTon: Double {
        get { return self.fakePhonePriceTon(for: self.currentAccountPeerId) }
        set { self.setFakePhonePriceTon(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakeChannelTitle(for peerId: Int64? = nil) -> String {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeChannelTitle, peerId: peerId) { k in
            self.defaults.string(forKey: k)
        } ?? ""
    }
    
    public func setFakeChannelTitle(_ value: String, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeChannelTitle, peerId: peerId)
        self.defaults.set(value, forKey: key)
    }
    
    public var fakeChannelTitle: String {
        get { return self.fakeChannelTitle(for: self.currentAccountPeerId) }
        set { self.setFakeChannelTitle(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakeBusinessLocation(for peerId: Int64? = nil) -> String {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeBusinessLocation, peerId: peerId) { k in
            self.defaults.string(forKey: k)
        } ?? ""
    }
    
    public func setFakeBusinessLocation(_ value: String, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeBusinessLocation, peerId: peerId)
        self.defaults.set(value, forKey: key)
    }
    
    public var fakeBusinessLocation: String {
        get { return self.fakeBusinessLocation(for: self.currentAccountPeerId) }
        set { self.setFakeBusinessLocation(newValue, for: self.currentAccountPeerId) }
    }
    
    public func fakeBusinessHours(for peerId: Int64? = nil) -> String {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self.readValue(baseKey: Keys.fakeBusinessHours, peerId: peerId) { k in
            self.defaults.string(forKey: k)
        } ?? ""
    }
    
    public func setFakeBusinessHours(_ value: String, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeBusinessHours, peerId: peerId)
        self.defaults.set(value, forKey: key)
    }
    
    public var fakeBusinessHours: String {
        get { return self.fakeBusinessHours(for: self.currentAccountPeerId) }
        set { self.setFakeBusinessHours(newValue, for: self.currentAccountPeerId) }
    }
    
    // NFT-юзернеймы
    public func fakeUsernames(for peerId: Int64? = nil) -> [FakeNftUsername] {
        self.lock.lock()
        defer { self.lock.unlock() }
        let effectiveId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectiveId != 0 else { return [] }
        let key = self.accountKey(Keys.fakeUsernames, peerId: effectiveId)
        if let data = self.defaults.data(forKey: key), let items = try? JSONDecoder().decode([FakeNftUsername].self, from: data) {
            return items
        }
        return []
    }
    
    public func setFakeUsernames(_ items: [FakeNftUsername], for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let effectiveId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectiveId != 0 else { return }
        let key = self.accountKey(Keys.fakeUsernames, peerId: effectiveId)
        if let data = try? JSONEncoder().encode(items) {
            self.defaults.set(data, forKey: key)
        }
    }
    
    public var fakeUsernames: [FakeNftUsername] {
        get { return self.fakeUsernames(for: self.currentAccountPeerId) }
        set { self.setFakeUsernames(newValue, for: self.currentAccountPeerId) }
    }
    
    public func addUsername(_ item: FakeNftUsername, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        var items = self.fakeUsernames(for: peerId)
        items.removeAll(where: { $0.username.lowercased() == item.username.lowercased() })
        items.append(item)
        self.setFakeUsernames(items, for: peerId)
    }
    
    public func removeUsername(named username: String, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        var items = self.fakeUsernames(for: peerId)
        items.removeAll(where: { $0.username.lowercased() == username.lowercased() })
        self.setFakeUsernames(items, for: peerId)
    }
    
    // Подарки в профиле (хранятся строго с привязкой к ID владельца ownerPeerId)
    public func fakeGifts(for peerId: Int64? = nil) -> [FakeStarGiftItem] {
        self.lock.lock()
        defer { self.lock.unlock() }
        let effectiveId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectiveId != 0 else { return [] }
        let key = self.accountKey(Keys.fakeGifts, peerId: effectiveId)
        
        var gifts: [FakeStarGiftItem] = []
        if let data = self.defaults.data(forKey: key), let items = try? JSONDecoder().decode([FakeStarGiftItem].self, from: data) {
            gifts = items
        }
        
        // Сортировка: закрепленные подарки (.isPinned) всегда в самом верху
        gifts.sort { g1, g2 in
            if g1.isPinned != g2.isPinned {
                return g1.isPinned && !g2.isPinned
            }
            return g1.sendDate > g2.sendDate
        }
        return gifts
    }
    
    public func setFakeGifts(_ items: [FakeStarGiftItem], for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let effectiveId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectiveId != 0 else { return }
        let key = self.accountKey(Keys.fakeGifts, peerId: effectiveId)
        if let data = try? JSONEncoder().encode(items) {
            self.defaults.set(data, forKey: key)
        }
    }
    
    public var fakeGifts: [FakeStarGiftItem] {
        get { return self.fakeGifts(for: self.currentAccountPeerId) }
        set { self.setFakeGifts(newValue, for: self.currentAccountPeerId) }
    }
    
    public func addGift(_ item: FakeStarGiftItem, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let targetOwner = (item.ownerPeerId != 0) ? item.ownerPeerId : (peerId ?? self.currentAccountPeerId ?? 0)
        guard targetOwner != 0 else { return }
        var mutItem = item
        mutItem.ownerPeerId = targetOwner
        var items = self.fakeGifts(for: targetOwner)
        items.removeAll(where: {
            $0.id == mutItem.id ||
            (mutItem.slug != nil && !mutItem.slug!.isEmpty && $0.slug?.lowercased() == mutItem.slug?.lowercased()) ||
            (mutItem.baseGiftId != 0 && mutItem.giftNumber != 0 && $0.baseGiftId == mutItem.baseGiftId && $0.giftNumber == mutItem.giftNumber)
        })
        items.insert(mutItem, at: 0)
        self.setFakeGifts(items, for: targetOwner)
    }
    
    public func removeGift(id: UUID, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let effectiveId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectiveId != 0 else { return }
        var items = self.fakeGifts(for: effectiveId)
        items.removeAll(where: { $0.id == id })
        self.setFakeGifts(items, for: effectiveId)
    }
    
    public func togglePinGift(id: UUID, isPinned: Bool? = nil, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let effectiveId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectiveId != 0 else { return }
        var items = self.fakeGifts(for: effectiveId)
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].isPinned = isPinned ?? !items[index].isPinned
            self.setFakeGifts(items, for: effectiveId)
        }
    }
    
    public func updateGiftResalePrice(id: UUID, stars: Int64?, ton: Double?, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let effectiveId = peerId ?? self.currentAccountPeerId ?? 0
        guard effectiveId != 0 else { return }
        var items = self.fakeGifts(for: effectiveId)
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].resellPriceStars = stars
            items[index].resellPriceTon = ton
            self.setFakeGifts(items, for: effectiveId)
        }
    }
    
    // Передача подарка другому получателю
    public func transferGift(id: UUID, to recipientPeerId: Int64, from senderPeerId: Int64? = nil) -> Bool {
        self.lock.lock()
        defer { self.lock.unlock() }
        let sourcePeerId = senderPeerId ?? self.currentAccountPeerId ?? 0
        guard sourcePeerId != 0, recipientPeerId != 0, sourcePeerId != recipientPeerId else {
            return false
        }
        var senderItems = self.fakeGifts(for: sourcePeerId)
        guard let index = senderItems.firstIndex(where: { $0.id == id }) else {
            return false
        }
        var gift = senderItems.remove(at: index)
        self.setFakeGifts(senderItems, for: sourcePeerId)
        
        // Если подарок находился в легаси-хранилище, удаляем его и оттуда
        if let data = self.defaults.data(forKey: Keys.fakeGifts), var legacyItems = try? JSONDecoder().decode([FakeStarGiftItem].self, from: data) {
            if let legacyIndex = legacyItems.firstIndex(where: { $0.id == id }) {
                legacyItems.remove(at: legacyIndex)
                if let updatedData = try? JSONEncoder().encode(legacyItems) {
                    self.defaults.set(updatedData, forKey: Keys.fakeGifts)
                }
            }
        }
        
        gift.ownerPeerId = recipientPeerId
        gift.senderPeerId = sourcePeerId
        gift.sendDate = Int32(Date().timeIntervalSince1970)
        gift.isPinned = false
        gift.resellPriceStars = nil
        gift.resellPriceTon = nil
        
        var recipientItems = self.fakeGifts(for: recipientPeerId)
        recipientItems.insert(gift, at: 0)
        self.setFakeGifts(recipientItems, for: recipientPeerId)
        return true
    }
    
    // История транзакций (пополнения и списания)
    public func fakeTransactions(for peerId: Int64? = nil, ton: Bool) -> [FakeTransactionItem] {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeTransactions, peerId: peerId)
        guard let data = self.defaults.data(forKey: key),
              let items = try? JSONDecoder().decode([FakeTransactionItem].self, from: data) else {
            return []
        }
        return items.filter { $0.isTon == ton }
    }
    
    public func addFakeTransaction(_ item: FakeTransactionItem, for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeTransactions, peerId: peerId)
        var all: [FakeTransactionItem] = []
        if let data = self.defaults.data(forKey: key),
           let decoded = try? JSONDecoder().decode([FakeTransactionItem].self, from: data) {
            all = decoded
        }
        all.insert(item, at: 0)
        if all.count > 100 {
            all = Array(all.prefix(100))
        }
        if let data = try? JSONEncoder().encode(all) {
            self.defaults.set(data, forKey: key)
        }
    }
    
    // Пользовательский порядок подарков в профиле
    public func giftsOrder(for peerId: Int64? = nil) -> [String] {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeGiftsOrder, peerId: peerId)
        return self.defaults.stringArray(forKey: key) ?? []
    }
    
    public func setGiftsOrder(_ order: [String], for peerId: Int64? = nil) {
        self.lock.lock()
        defer { self.lock.unlock() }
        let key = self.accountKey(Keys.fakeGiftsOrder, peerId: peerId)
        self.defaults.set(order, forKey: key)
    }
}
