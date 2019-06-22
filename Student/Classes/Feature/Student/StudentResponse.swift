struct StudentResponse: Codable {

    let data: [Data]?

    struct Data: Codable {

        let id: Int?
        let name: String?
        let email: String?
    }
}
