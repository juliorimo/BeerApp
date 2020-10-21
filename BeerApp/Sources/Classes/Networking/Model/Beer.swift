struct Beer: Codable {
    let id: Int
    let name: String
    let beerDescription: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case beerDescription = "description"
        case name
        case imageUrl = "image_url"
    }
}
