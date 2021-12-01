import Foundation

public enum LoaderError: Error {
    case fileDoesNotExist
    case fileCouldNotBecomeAString
}

public enum Loader {
    public static func loadDay(_ day: String, from bundle: Bundle) throws -> String {
        guard let url = bundle.url(forResource: "Day\(day)", withExtension: nil, subdirectory: "Fixtures") else {
            throw LoaderError.fileDoesNotExist
        }

        let data = try Data(contentsOf: url)

        guard let input = String(data: data, encoding: .utf8) else {
            throw LoaderError.fileCouldNotBecomeAString
        }

        return input
    }
}
