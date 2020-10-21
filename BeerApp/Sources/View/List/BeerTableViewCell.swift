class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var beer: Beer! {
        didSet {
            mainLabel.text = beer.name
        }
    }
}
