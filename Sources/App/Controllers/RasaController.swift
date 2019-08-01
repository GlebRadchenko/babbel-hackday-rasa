import Vapor

final class RasaController {
    func register(in router: Router) {
        router.get("usersession", use: index)
        router.post("usersession", use: create)
        router.delete("usersession", UserSession.parameter, use: delete)
    }

    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[UserSession]> {
        return UserSession.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<UserSession> {
        return try req.content.decode(UserSession.self).flatMap { session in
            return session.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(UserSession.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
}

