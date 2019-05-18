struct StudentResponse: Codable {

    let data: [StudentData]?

    struct StudentData: Codable {

        let id: Int?
        let name: String?
        let email: String?
    }
}
