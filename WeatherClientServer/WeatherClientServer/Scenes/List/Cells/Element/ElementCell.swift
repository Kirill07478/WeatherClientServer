//
//  ElementCell.swift
//  WeatherClientServer
//
//  Created by Kiryusha Orlov on 07.12.2021.
//

import UIKit

protocol ElementCellDelegate: class {
    func didElementTap(elementId: Int)
}

class ElementCell: UITableViewCell {

    static let cellIdentifier = "ElementCell"
    
    //MARK: - External vars
    weak var delegate: ElementCellDelegate?
    
    //MARK: - Internal vars
    private var elementId: Int?
    
    //MARK: - IBOutlets
    @IBOutlet weak var textTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - IBActions
    @IBAction func didNextTap(_ sender: Any) {
        
        guard let elementId = elementId else { return }
        delegate?.didElementTap(elementId: elementId)
        
    }
    
    //MARK: - Functions
    func setup(data: ElementCellModel) {
        
        elementId = Int(data.elementId)
        textTitle?.text = data.titleText
        
    }
}
