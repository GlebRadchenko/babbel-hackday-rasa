import FluentSQLite
import Vapor

final class UserSession: SQLiteModel {
    var id: Int?
    var clientID: String

    init(id: Int? = nil, clientID: String) {
        self.id = id
        self.clientID = clientID
    }
}

/// Allows `UserSession` to be used as a dynamic migration.
extension UserSession: Migration { }

/// Allows `UserSession` to be encoded to and decoded from HTTP messages.
extension UserSession: Content { }

/// Allows `UserSession` to be used as a dynamic parameter in route definitions.
extension UserSession: Parameter { }
