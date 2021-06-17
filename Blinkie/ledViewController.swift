//
//  ledViewController.swift
//  
//
//  Created by Kakha Sepashvili on 05.05.21.
//

import UIKit
import FirebaseFirestore
import Firebase


extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

class FireStoreData {
    let userID: String
    let deviceNumber: Int
    let colorCode: String

    init(userID: String, deviceNumber: Int, colorCode: String) {
        self.userID = userID
        self.deviceNumber = deviceNumber
        self.colorCode = colorCode
        
    }
}



class ledViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    
    @IBOutlet weak var backgroundPhoto : UIImageView!
    var clickedButton: UIButton?


    

    
   let uid = Auth.auth().currentUser?.uid
 
    let database = Database.database().reference()
    

 
    
 
    
    
    
    private var topText: UILabel = {
        let topText = UILabel()
        topText.textColor = .systemBlue
        topText.text = "Led Settings Paw"
        return topText
    }()
    
    private let homeButton: UIButton = {
        let homeButton = UIButton()
        homeButton.setTitle("HOME", for: .normal)
        homeButton.layer.borderWidth = 0.5
        homeButton.layer.borderColor = UIColor.blue.cgColor
        homeButton.setTitleColor(.red, for: .normal)
        homeButton.backgroundColor = .white
        homeButton.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
        return homeButton
    }()
    
    private let colorButton11: UIButton = {
        let colorButton11 = UIButton()
        colorButton11.backgroundColor = .green
        colorButton11.layer.borderWidth = 0.2
        colorButton11.layer.borderColor = UIColor.blue.cgColor
        colorButton11.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton11.tag = 11
        
        return colorButton11
    }()
    
    private let colorButtonText11: UIButton = {
        let colorButtonText11 = UIButton()
        colorButtonText11.setTitle("1", for: .normal)
        colorButtonText11.layer.borderWidth = 0.2
        colorButtonText11.layer.borderColor = UIColor.blue.cgColor
       
        
        return colorButtonText11
    }()
    
    private let colorButton12: UIButton = {
        let colorButton12 = UIButton()
        colorButton12.backgroundColor = .red
        colorButton12.layer.borderWidth = 0.2
        colorButton12.layer.borderColor = UIColor.blue.cgColor
        colorButton12.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton12.tag = 12
        
        return colorButton12
    }()
    
    private let colorButtonText12: UIButton = {
        let colorButtonText12 = UIButton()
        colorButtonText12.setTitle("Led1", for: .normal)
        colorButtonText12.layer.borderWidth = 0.2
        colorButtonText12.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText12
    }()
    
    private let colorButton13: UIButton = {
        let colorButton13 = UIButton()
        colorButton13.backgroundColor = .blue
        colorButton13.layer.borderWidth = 0.2
        colorButton13.layer.borderColor = UIColor.blue.cgColor
        colorButton13.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton13.tag = 13
        
        return colorButton13
    }()
    
    private let colorButtonText13: UIButton = {
        let colorButtonText3 = UIButton()
        colorButtonText3.setTitle("K", for: .normal)
        colorButtonText3.layer.borderWidth = 0.2
        colorButtonText3.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText3
    }()
    
    
    private let colorButton21: UIButton = {
        let colorButton21 = UIButton()
        colorButton21.backgroundColor = .green
        colorButton21.layer.borderWidth = 0.2
        colorButton21.layer.borderColor = UIColor.blue.cgColor
        colorButton21.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton21.tag = 21
        
        
        return colorButton21
    }()
    
    private let colorButtonText21: UIButton = {
        let colorButtonText21 = UIButton()
        colorButtonText21.setTitle("1", for: .normal)
        colorButtonText21.layer.borderWidth = 0.2
        colorButtonText21.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText21
    }()
    
    private let colorButton22: UIButton = {
        let colorButton22 = UIButton()
        colorButton22.backgroundColor = .red
        colorButton22.layer.borderWidth = 0.2
        colorButton22.layer.borderColor = UIColor.blue.cgColor
        colorButton22.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton22.tag = 22
        
        return colorButton22
    }()
    
    private let colorButtonText22: UIButton = {
        let colorButtonText22 = UIButton()
        colorButtonText22.setTitle("Led1", for: .normal)
        colorButtonText22.layer.borderWidth = 0.2
        colorButtonText22.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText22
    }()
    
    private let colorButton23: UIButton = {
        let colorButton23 = UIButton()
        colorButton23.backgroundColor = .blue
        colorButton23.layer.borderWidth = 0.2
        colorButton23.layer.borderColor = UIColor.blue.cgColor
        colorButton23.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton23.tag = 23
        
        return colorButton23
    }()
    
    private let colorButtonText23: UIButton = {
        let colorButtonText23 = UIButton()
        colorButtonText23.setTitle("K", for: .normal)
        colorButtonText23.layer.borderWidth = 0.2
        colorButtonText23.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText23
    }()
    
    
    
    private let colorButton31: UIButton = {
        let colorButton31 = UIButton()
        colorButton31.backgroundColor = .green
        colorButton31.layer.borderWidth = 0.2
        colorButton31.layer.borderColor = UIColor.blue.cgColor
        colorButton31.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton31.tag = 31
        
        
        return colorButton31
    }()
    
    private let colorButtonText31: UIButton = {
        let colorButtonText31 = UIButton()
        colorButtonText31.setTitle("1", for: .normal)
        colorButtonText31.layer.borderWidth = 0.2
        colorButtonText31.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButtonText31
    }()
    
    private let colorButton32: UIButton = {
        let colorButton32 = UIButton()
        colorButton32.backgroundColor = .red
        colorButton32.layer.borderWidth = 0.2
        colorButton32.layer.borderColor = UIColor.blue.cgColor
        colorButton32.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton32.tag = 32
        
        return colorButton32
    }()
    
    private let colorButtonText32: UIButton = {
        let colorButtonText32 = UIButton()
        colorButtonText32.setTitle("Led1", for: .normal)
        colorButtonText32.layer.borderWidth = 0.2
        colorButtonText32.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText32
    }()
    
    private let colorButton33: UIButton = {
        let colorButton33 = UIButton()
        colorButton33.backgroundColor = .blue
        colorButton33.layer.borderWidth = 0.2
        colorButton33.layer.borderColor = UIColor.blue.cgColor
        colorButton33.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton33.tag = 33
        
        return colorButton33
    }()
    
    private let colorButtonText33: UIButton = {
        let colorButtonText33 = UIButton()
        colorButtonText33.setTitle("K", for: .normal)
        colorButtonText33.layer.borderWidth = 0.2
        colorButtonText33.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText33
    }()
    
    private let colorButton41: UIButton = {
        let colorButton41 = UIButton()
        colorButton41.backgroundColor = .green
        colorButton41.layer.borderWidth = 0.2
        colorButton41.layer.borderColor = UIColor.blue.cgColor
        colorButton41.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton41.tag = 41
        
        
        return colorButton41
    }()
    
    private let colorButtonText41: UIButton = {
        let colorButtonText41 = UIButton()
        colorButtonText41.setTitle("1", for: .normal)
        colorButtonText41.layer.borderWidth = 0.2
        colorButtonText41.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText41
    }()
    
    private let colorButton42: UIButton = {
        let colorButton42 = UIButton()
        colorButton42.backgroundColor = .red
        colorButton42.layer.borderWidth = 0.2
        colorButton42.layer.borderColor = UIColor.blue.cgColor
        colorButton42.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton42.tag = 42
        
        return colorButton42
    }()
    
    private let colorButtonText42: UIButton = {
        let colorButtonText42 = UIButton()
        colorButtonText42.setTitle("Led1", for: .normal)
        colorButtonText42.layer.borderWidth = 0.2
        colorButtonText42.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText42
    }()
    
    private let colorButton43: UIButton = {
        let colorButton43 = UIButton()
        colorButton43.backgroundColor = .blue
        colorButton43.layer.borderWidth = 0.2
        colorButton43.layer.borderColor = UIColor.blue.cgColor
        colorButton43.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton43.tag = 43
        
        return colorButton43
    }()
    
    private let colorButtonText43: UIButton = {
        let colorButtonText43 = UIButton()
        colorButtonText43.setTitle("K", for: .normal)
        colorButtonText43.layer.borderWidth = 0.2
        colorButtonText43.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText43
    }()
    
    private let colorButton51: UIButton = {
        let colorButton51 = UIButton()
        colorButton51.backgroundColor = .green
        colorButton51.layer.borderWidth = 0.2
        colorButton51.layer.borderColor = UIColor.blue.cgColor
        colorButton51.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton51.tag = 51
        
        
        return colorButton51
    }()
    
    
    
    private let colorButtonText51: UIButton = {
        let colorButtonText51 = UIButton()
        colorButtonText51.setTitle("1", for: .normal)
        colorButtonText51.layer.borderWidth = 0.2
        colorButtonText51.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText51
    }()
    
    private let colorButton52: UIButton = {
        let colorButton52 = UIButton()
        colorButton52.backgroundColor = .red
        colorButton52.layer.borderWidth = 0.2
        colorButton52.layer.borderColor = UIColor.blue.cgColor
        colorButton52.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton52.tag = 52
        
        return colorButton52
    }()
    
    private let colorButtonText52: UIButton = {
        let colorButtonText52 = UIButton()
        colorButtonText52.setTitle("Led1", for: .normal)
        colorButtonText52.layer.borderWidth = 0.2
        colorButtonText52.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText52
    }()
    
    private let colorButton53: UIButton = {
        let colorButton53 = UIButton()
        colorButton53.backgroundColor = .blue
        colorButton53.layer.borderWidth = 0.2
        colorButton53.layer.borderColor = UIColor.blue.cgColor
        colorButton53.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton53.tag = 53
        
        return colorButton53
    }()
    
    private let colorButtonText53: UIButton = {
        let colorButtonText53 = UIButton()
        colorButtonText53.setTitle("K", for: .normal)
        colorButtonText53.layer.borderWidth = 0.2
        colorButtonText53.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText53
    }()
    
    private let colorButton61: UIButton = {
        let colorButton61 = UIButton()
        colorButton61.backgroundColor = .green
        colorButton61.layer.borderWidth = 0.2
        colorButton61.layer.borderColor = UIColor.blue.cgColor
        colorButton61.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton61.tag = 61
        
        
        return colorButton61
    }()
    
    private let colorButtonText61: UIButton = {
        let colorButtonText61 = UIButton()
        colorButtonText61.setTitle("1", for: .normal)
        colorButtonText61.layer.borderWidth = 0.2
        colorButtonText61.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText61
    }()
    
    private let colorButton62: UIButton = {
        let colorButton62 = UIButton()
        colorButton62.backgroundColor = .red
        colorButton62.layer.borderWidth = 0.2
        colorButton62.layer.borderColor = UIColor.blue.cgColor
        colorButton62.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        
        return colorButton62
    }()
    
    private let colorButtonText62: UIButton = {
        let colorButtonText62 = UIButton()
        colorButtonText62.setTitle("Led1", for: .normal)
        colorButtonText62.layer.borderWidth = 0.2
        colorButtonText62.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText62
    }()
    
    private let colorButton63: UIButton = {
        let colorButton63 = UIButton()
        colorButton63.backgroundColor = .blue
        colorButton63.layer.borderWidth = 0.2
        colorButton63.layer.borderColor = UIColor.blue.cgColor
        colorButton63.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton63.tag = 63
        
        return colorButton63
    }()
    
    private let colorButtonText63: UIButton = {
        let colorButtonText63 = UIButton()
        colorButtonText63.setTitle("K", for: .normal)
        colorButtonText63.layer.borderWidth = 0.2
        colorButtonText63.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText63
    }()
    
    private let colorButton71: UIButton = {
        let colorButton71 = UIButton()
        colorButton71.backgroundColor = .green
        colorButton71.layer.borderWidth = 0.2
        colorButton71.layer.borderColor = UIColor.blue.cgColor
        colorButton71.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton71.tag = 71
        
        return colorButton71
    }()
    
    private let colorButtonText71: UIButton = {
        let colorButtonText71 = UIButton()
        colorButtonText71.setTitle("1", for: .normal)
        colorButtonText71.layer.borderWidth = 0.2
        colorButtonText71.layer.borderColor = UIColor.blue.cgColor
        
       
        return colorButtonText71
    }()
    
    private let colorButton72: UIButton = {
        let colorButton72 = UIButton()
        colorButton72.backgroundColor = .red
        colorButton72.layer.borderWidth = 0.2
        colorButton72.layer.borderColor = UIColor.blue.cgColor
        colorButton72.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton72.tag = 72
        
        return colorButton72
    }()
    
    private let colorButtonText72: UIButton = {
        let colorButtonText72 = UIButton()
        colorButtonText72.setTitle("Led1", for: .normal)
        colorButtonText72.layer.borderWidth = 0.2
        colorButtonText72.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText72
    }()
    
    private let colorButton73: UIButton = {
        let colorButton73 = UIButton()
        colorButton73.backgroundColor = .blue
        colorButton73.layer.borderWidth = 0.2
        colorButton73.layer.borderColor = UIColor.blue.cgColor
        colorButton73.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton73.tag = 73
        
        return colorButton73
    }()
    
    private let colorButtonText73: UIButton = {
        let colorButtonText73 = UIButton()
        colorButtonText73.setTitle("K", for: .normal)
        colorButtonText73.layer.borderWidth = 0.2
        colorButtonText73.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText73
    }()
    
    private let colorButton81: UIButton = {
        let colorButton81 = UIButton()
        colorButton81.backgroundColor = .green
        colorButton81.layer.borderWidth = 0.2
        colorButton81.layer.borderColor = UIColor.blue.cgColor
        colorButton81.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton81.tag = 81
        
        
        return colorButton81
    }()
    
    private let colorButtonText81: UIButton = {
        let colorButtonText81 = UIButton()
        colorButtonText81.setTitle("1", for: .normal)
        colorButtonText81.layer.borderWidth = 0.2
        colorButtonText81.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText81
    }()
    
    private let colorButton82: UIButton = {
        let colorButton82 = UIButton()
        colorButton82.backgroundColor = .red
        colorButton82.layer.borderWidth = 0.2
        colorButton82.layer.borderColor = UIColor.blue.cgColor
        colorButton82.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton82.tag = 82
        
        return colorButton82
    }()
    
    private let colorButtonText82: UIButton = {
        let colorButtonText82 = UIButton()
        colorButtonText82.setTitle("Led1", for: .normal)
        colorButtonText82.layer.borderWidth = 0.2
        colorButtonText82.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText82
    }()
    
    private let colorButton83: UIButton = {
        let colorButton83 = UIButton()
        colorButton83.backgroundColor = .blue
        colorButton83.layer.borderWidth = 0.2
        colorButton83.layer.borderColor = UIColor.blue.cgColor
        colorButton83.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton83.tag = 83
        
        return colorButton83
    }()
    
    private let colorButtonText83: UIButton = {
        let colorButtonText83 = UIButton()
        colorButtonText83.setTitle("K", for: .normal)
        colorButtonText83.layer.borderWidth = 0.2
        colorButtonText83.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText83
    }()
    
    private let colorButton91: UIButton = {
        let colorButton91 = UIButton()
        colorButton91.backgroundColor = .green
        colorButton91.layer.borderWidth = 0.2
        colorButton91.layer.borderColor = UIColor.blue.cgColor
        colorButton91.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton91.tag = 91
        
        
        return colorButton91
    }()
    
    private let colorButtonText91: UIButton = {
        let colorButtonText91 = UIButton()
        colorButtonText91.setTitle("1", for: .normal)
        colorButtonText91.layer.borderWidth = 0.2
        colorButtonText91.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText91
    }()
    
    private let colorButton92: UIButton = {
        let colorButton92 = UIButton()
        colorButton92.backgroundColor = .red
        colorButton92.layer.borderWidth = 0.2
        colorButton92.layer.borderColor = UIColor.blue.cgColor
        colorButton92.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton92.tag = 92
        
        return colorButton92
    }()
    
    private let colorButtonText92: UIButton = {
        let colorButtonText92 = UIButton()
        colorButtonText92.setTitle("Led1", for: .normal)
        colorButtonText92.layer.borderWidth = 0.2
        colorButtonText92.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText92
    }()
    
    private let colorButton93: UIButton = {
        let colorButton93 = UIButton()
        colorButton93.backgroundColor = .blue
        colorButton93.layer.borderWidth = 0.2
        colorButton93.layer.borderColor = UIColor.blue.cgColor
        colorButton93.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton93.tag = 93
        
        return colorButton93
    }()
    
    private let colorButtonText93: UIButton = {
        let colorButtonText93 = UIButton()
        colorButtonText93.setTitle("K", for: .normal)
        colorButtonText93.layer.borderWidth = 0.2
        colorButtonText93.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText93
    }()
    
    private let colorButton101: UIButton = {
        let colorButton101 = UIButton()
        colorButton101.backgroundColor = .green
        colorButton101.layer.borderWidth = 0.2
        colorButton101.layer.borderColor = UIColor.blue.cgColor
        colorButton101.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton101.tag = 101
        
        
        return colorButton101
    }()
    
    private let colorButtonText101: UIButton = {
        let colorButtonText101 = UIButton()
        colorButtonText101.setTitle("1", for: .normal)
        colorButtonText101.layer.borderWidth = 0.2
        colorButtonText101.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText101
    }()
    
    private let colorButton102: UIButton = {
        let colorButton102 = UIButton()
        colorButton102.backgroundColor = .red
        colorButton102.layer.borderWidth = 0.2
        colorButton102.layer.borderColor = UIColor.blue.cgColor
        colorButton102.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton102.tag = 102
        
        return colorButton102
    }()
    
    private let colorButtonText102: UIButton = {
        let colorButtonText102 = UIButton()
        colorButtonText102.setTitle("Led1", for: .normal)
        colorButtonText102.layer.borderWidth = 0.2
        colorButtonText102.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText102
    }()
    
    private let colorButton103: UIButton = {
        let colorButton103 = UIButton()
        colorButton103.backgroundColor = .blue
        colorButton103.layer.borderWidth = 0.2
        colorButton103.layer.borderColor = UIColor.blue.cgColor
        colorButton103.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton103.tag = 103
        
        return colorButton103
    }()
    
    private let colorButtonText103: UIButton = {
        let colorButtonText103 = UIButton()
        colorButtonText103.setTitle("K", for: .normal)
        colorButtonText103.layer.borderWidth = 0.2
        colorButtonText103.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText103
    }()
    
    
    private let colorButton111: UIButton = {
        let colorButton111 = UIButton()
        colorButton111.backgroundColor = .green
        colorButton111.layer.borderWidth = 0.2
        colorButton111.layer.borderColor = UIColor.blue.cgColor
        colorButton111.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton111.tag = 111
        
        return colorButton111
    }()
    
    private let colorButtonText111: UIButton = {
        let colorButtonText111 = UIButton()
        colorButtonText111.setTitle("1", for: .normal)
        colorButtonText111.layer.borderWidth = 0.2
        colorButtonText111.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText111
    }()
    
    private let colorButton112: UIButton = {
        let colorButton112 = UIButton()
        colorButton112.backgroundColor = .red
        colorButton112.layer.borderWidth = 0.2
        colorButton112.layer.borderColor = UIColor.blue.cgColor
        colorButton112.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton112.tag = 112
        
        return colorButton112
    }()
    
    private let colorButtonText112: UIButton = {
        let colorButtonText112 = UIButton()
        colorButtonText112.setTitle("Led1", for: .normal)
        colorButtonText112.layer.borderWidth = 0.2
        colorButtonText112.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText112
    }()
    
    private let colorButton113: UIButton = {
        let colorButton113 = UIButton()
        colorButton113.backgroundColor = .blue
        colorButton113.layer.borderWidth = 0.2
        colorButton113.layer.borderColor = UIColor.blue.cgColor
        colorButton113.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton113.tag = 113
        
        return colorButton113
    }()
    
    private let colorButtonText113: UIButton = {
        let colorButtonText113 = UIButton()
        colorButtonText113.setTitle("K", for: .normal)
        colorButtonText113.layer.borderWidth = 0.2
        colorButtonText113.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText113
    }()
    
    private let colorButton121: UIButton = {
        let colorButton121 = UIButton()
        colorButton121.backgroundColor = .green
        colorButton121.layer.borderWidth = 0.2
        colorButton121.layer.borderColor = UIColor.blue.cgColor
        colorButton121.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton121.tag = 121
        
        
        return colorButton121
    }()
    
    private let colorButtonText121: UIButton = {
        let colorButtonText121 = UIButton()
        colorButtonText121.setTitle("1", for: .normal)
        colorButtonText121.layer.borderWidth = 0.2
        colorButtonText121.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText121
    }()
    
    private let colorButton122: UIButton = {
        let colorButton122 = UIButton()
        colorButton122.backgroundColor = .red
        colorButton122.layer.borderWidth = 0.2
        colorButton122.layer.borderColor = UIColor.blue.cgColor
        colorButton122.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton122.tag = 122
        
        return colorButton122
    }()
    
    private let colorButtonText122: UIButton = {
        let colorButtonText122 = UIButton()
        colorButtonText122.setTitle("Led1", for: .normal)
        colorButtonText122.layer.borderWidth = 0.2
        colorButtonText122.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText122
    }()
    
    private let colorButton123: UIButton = {
        let colorButton123 = UIButton()
        colorButton123.backgroundColor = .blue
        colorButton123.layer.borderWidth = 0.2
        colorButton123.layer.borderColor = UIColor.blue.cgColor
        colorButton123.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton123.tag = 123
        
        return colorButton123
    }()
    
    private let colorButtonText123: UIButton = {
        let colorButtonText123 = UIButton()
        colorButtonText123.setTitle("K", for: .normal)
        colorButtonText123.layer.borderWidth = 0.2
        colorButtonText123.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText123
    }()
    
    private let colorButton131: UIButton = {
        let colorButton131 = UIButton()
        colorButton131.backgroundColor = .green
        colorButton131.layer.borderWidth = 0.2
        colorButton131.layer.borderColor = UIColor.blue.cgColor
        colorButton131.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton131.tag = 131
        
        
        return colorButton131
    }()
    
    private let colorButtonText131: UIButton = {
        let colorButtonText131 = UIButton()
        colorButtonText131.setTitle("1", for: .normal)
        colorButtonText131.layer.borderWidth = 0.2
        colorButtonText131.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText131
    }()
    
    private let colorButton132: UIButton = {
        let colorButton132 = UIButton()
        colorButton132.backgroundColor = .red
        colorButton132.layer.borderWidth = 0.2
        colorButton132.layer.borderColor = UIColor.blue.cgColor
        colorButton132.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton132.tag = 132
        
        return colorButton132
    }()
    
    private let colorButtonText132: UIButton = {
        let colorButtonText132 = UIButton()
        colorButtonText132.setTitle("Led1", for: .normal)
        colorButtonText132.layer.borderWidth = 0.2
        colorButtonText132.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText132
    }()
    
    private let colorButton133: UIButton = {
        let colorButton133 = UIButton()
        colorButton133.backgroundColor = .blue
        colorButton133.layer.borderWidth = 0.2
        colorButton133.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton133
    }()
    
    private let colorButtonText133: UIButton = {
        let colorButtonText133 = UIButton()
        colorButtonText133.setTitle("K", for: .normal)
        colorButtonText133.layer.borderWidth = 0.2
        colorButtonText133.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText133
    }()
    
    private let colorButton141: UIButton = {
        let colorButton141 = UIButton()
        colorButton141.backgroundColor = .green
        colorButton141.layer.borderWidth = 0.2
        colorButton141.layer.borderColor = UIColor.blue.cgColor
        colorButton141.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton141.tag = 151
        
        
        return colorButton141
    }()
    
    private let colorButtonText141: UIButton = {
        let colorButtonText141 = UIButton()
        colorButtonText141.setTitle("1", for: .normal)
        colorButtonText141.layer.borderWidth = 0.2
        colorButtonText141.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText141
    }()
    
    private let colorButton142: UIButton = {
        let colorButton142 = UIButton()
        colorButton142.backgroundColor = .red
        colorButton142.layer.borderWidth = 0.2
        colorButton142.layer.borderColor = UIColor.blue.cgColor
        colorButton142.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton142.tag = 142
        
        return colorButton142
    }()
    
    private let colorButtonText142: UIButton = {
        let colorButtonText142 = UIButton()
        colorButtonText142.setTitle("Led1", for: .normal)
        colorButtonText142.layer.borderWidth = 0.2
        colorButtonText142.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText142
    }()
    
    private let colorButton143: UIButton = {
        let colorButton143 = UIButton()
        colorButton143.backgroundColor = .blue
        colorButton143.layer.borderWidth = 0.2
        colorButton143.layer.borderColor = UIColor.blue.cgColor
        colorButton143.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton143.tag = 143
        
        return colorButton143
    }()
    
    private let colorButtonText143: UIButton = {
        let colorButtonText143 = UIButton()
        colorButtonText143.setTitle("K", for: .normal)
        colorButtonText143.layer.borderWidth = 0.2
        colorButtonText143.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText143
    }()
    
    private let colorButton151: UIButton = {
        let colorButton151 = UIButton()
        colorButton151.backgroundColor = .green
        colorButton151.layer.borderWidth = 0.2
        colorButton151.layer.borderColor = UIColor.blue.cgColor
        colorButton151.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton151.tag = 151
        
        
        return colorButton151
    }()
    
    private let colorButtonText151: UIButton = {
        let colorButtonText151 = UIButton()
        colorButtonText151.setTitle("1", for: .normal)
        colorButtonText151.layer.borderWidth = 0.2
        colorButtonText151.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText151
    }()
    
    private let colorButton152: UIButton = {
        let colorButton152 = UIButton()
        colorButton152.backgroundColor = .red
        colorButton152.layer.borderWidth = 0.2
        colorButton152.layer.borderColor = UIColor.blue.cgColor
        colorButton152.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton152.tag = 152
        
        return colorButton152
    }()
    
    private let colorButtonText152: UIButton = {
        let colorButtonText152 = UIButton()
        colorButtonText152.setTitle("Led1", for: .normal)
        colorButtonText152.layer.borderWidth = 0.2
        colorButtonText152.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText152
    }()
    
    private let colorButton153: UIButton = {
        let colorButton153 = UIButton()
        colorButton153.backgroundColor = .blue
        colorButton153.layer.borderWidth = 0.2
        colorButton153.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton153
    }()
    
    private let colorButtonText153: UIButton = {
        let colorButtonText153 = UIButton()
        colorButtonText153.setTitle("K", for: .normal)
        colorButtonText153.layer.borderWidth = 0.2
        colorButtonText153.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText153
    }()
    
    private let colorButton161: UIButton = {
        let colorButton161 = UIButton()
        colorButton161.backgroundColor = .green
        colorButton161.layer.borderWidth = 0.2
        colorButton161.layer.borderColor = UIColor.blue.cgColor
        colorButton161.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton161.tag = 161
        
        
        return colorButton161
    }()
    
    private let colorButtonText161: UIButton = {
        let colorButtonText161 = UIButton()
        colorButtonText161.setTitle("1", for: .normal)
        colorButtonText161.layer.borderWidth = 0.2
        colorButtonText161.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText161
    }()
    
    private let colorButton162: UIButton = {
        let colorButton162 = UIButton()
        colorButton162.backgroundColor = .red
        colorButton162.layer.borderWidth = 0.2
        colorButton162.layer.borderColor = UIColor.blue.cgColor
        colorButton162.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton162.tag = 162
        
        return colorButton162
    }()
    
    private let colorButtonText162: UIButton = {
        let colorButtonText162 = UIButton()
        colorButtonText162.setTitle("Led1", for: .normal)
        colorButtonText162.layer.borderWidth = 0.2
        colorButtonText162.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText162
    }()
    
    private let colorButton163: UIButton = {
        let colorButton163 = UIButton()
        colorButton163.backgroundColor = .blue
        colorButton163.layer.borderWidth = 0.2
        colorButton163.layer.borderColor = UIColor.blue.cgColor
        colorButton163.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton163.tag = 163
        
        return colorButton163
    }()
    
    private let colorButtonText163: UIButton = {
        let colorButtonText163 = UIButton()
        colorButtonText163.setTitle("K", for: .normal)
        colorButtonText163.layer.borderWidth = 0.2
        colorButtonText163.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText163
    }()
    
    private let colorButton211: UIButton = {
        let colorButton211 = UIButton()
        colorButton211.backgroundColor = .green
        colorButton211.layer.borderWidth = 0.2
        colorButton211.layer.borderColor = UIColor.blue.cgColor
        colorButton211.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton211.tag = 211
        
        
        return colorButton211
    }()
    
    private let colorButtonText211: UIButton = {
        let colorButtonText211 = UIButton()
        colorButtonText211.setTitle("1", for: .normal)
        colorButtonText211.layer.borderWidth = 0.2
        colorButtonText211.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText211
    }()
    
    private let colorButton212: UIButton = {
        let colorButton212 = UIButton()
        colorButton212.backgroundColor = .red
        colorButton212.layer.borderWidth = 0.2
        colorButton212.layer.borderColor = UIColor.blue.cgColor
        colorButton212.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton212.tag = 212
        
        return colorButton212
    }()
    
    private let colorButtonText212: UIButton = {
        let colorButtonText212 = UIButton()
        colorButtonText212.setTitle("Led1", for: .normal)
        colorButtonText212.layer.borderWidth = 0.2
        colorButtonText212.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText212
    }()
    
    private let colorButton213: UIButton = {
        let colorButton213 = UIButton()
        colorButton213.backgroundColor = .blue
        colorButton213.layer.borderWidth = 0.2
        colorButton213.layer.borderColor = UIColor.blue.cgColor
        colorButton213.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton213.tag = 213
        
        return colorButton213
    }()
    
    private let colorButtonText213: UIButton = {
        let colorButtonText213 = UIButton()
        colorButtonText213.setTitle("K", for: .normal)
        colorButtonText213.layer.borderWidth = 0.2
        colorButtonText213.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText213
    }()
    
    private let colorButton221: UIButton = {
        let colorButton221 = UIButton()
        colorButton221.backgroundColor = .green
        colorButton221.layer.borderWidth = 0.2
        colorButton221.layer.borderColor = UIColor.blue.cgColor
        colorButton221.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton221.tag = 221
        
        
        return colorButton221
    }()
    
    private let colorButtonText221: UIButton = {
        let colorButtonText221 = UIButton()
        colorButtonText221.setTitle("1", for: .normal)
        colorButtonText221.layer.borderWidth = 0.2
        colorButtonText221.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText221
    }()
    
    private let colorButton222: UIButton = {
        let colorButton222 = UIButton()
        colorButton222.backgroundColor = .red
        colorButton222.layer.borderWidth = 0.2
        colorButton222.layer.borderColor = UIColor.blue.cgColor
        colorButton222.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton222.tag = 222
        
        return colorButton222
    }()
    
    private let colorButtonText222: UIButton = {
        let colorButtonText222 = UIButton()
        colorButtonText222.setTitle("Led1", for: .normal)
        colorButtonText222.layer.borderWidth = 0.2
        colorButtonText222.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText222
    }()
    
    private let colorButton223: UIButton = {
        let colorButton223 = UIButton()
        colorButton223.backgroundColor = .blue
        colorButton223.layer.borderWidth = 0.2
        colorButton223.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton223
    }()
    
    private let colorButtonText223: UIButton = {
        let colorButtonText223 = UIButton()
        colorButtonText223.setTitle("K", for: .normal)
        colorButtonText223.layer.borderWidth = 0.2
        colorButtonText223.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText223
        
        
    }()
    
    
    private let colorButton231: UIButton = {
        let colorButton231 = UIButton()
        colorButton231.backgroundColor = .green
        colorButton231.layer.borderWidth = 0.2
        colorButton231.layer.borderColor = UIColor.blue.cgColor
        colorButton231.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton231.tag = 231
        
        
        return colorButton231
    }()
    
    private let colorButtonText231: UIButton = {
        let colorButtonText231 = UIButton()
        colorButtonText231.setTitle("1", for: .normal)
        colorButtonText231.layer.borderWidth = 0.2
        colorButtonText231.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText231
    }()
    
    private let colorButton232: UIButton = {
        let colorButton232 = UIButton()
        colorButton232.backgroundColor = .red
        colorButton232.layer.borderWidth = 0.2
        colorButton232.layer.borderColor = UIColor.blue.cgColor
        colorButton232.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton232.tag = 232
        
        return colorButton232
    }()
    
    private let colorButtonText232: UIButton = {
        let colorButtonText232 = UIButton()
        colorButtonText232.setTitle("Led1", for: .normal)
        colorButtonText232.layer.borderWidth = 0.2
        colorButtonText232.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText232
    }()
    
    private let colorButton233: UIButton = {
        let colorButton233 = UIButton()
        colorButton233.backgroundColor = .blue
        colorButton233.layer.borderWidth = 0.2
        colorButton233.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton233
    }()
    
    private let colorButtonText233: UIButton = {
        let colorButtonText233 = UIButton()
        colorButtonText233.setTitle("K", for: .normal)
        colorButtonText233.layer.borderWidth = 0.2
        colorButtonText233.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText233
    }()
    
    
    private let colorButton241: UIButton = {
        let colorButton241 = UIButton()
        colorButton241.backgroundColor = .green
        colorButton241.layer.borderWidth = 0.2
        colorButton241.layer.borderColor = UIColor.blue.cgColor
        colorButton241.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton241.tag = 241
        
        return colorButton241
    }()
    
    private let colorButtonText241: UIButton = {
        let colorButtonText241 = UIButton()
        colorButtonText241.setTitle("1", for: .normal)
        colorButtonText241.layer.borderWidth = 0.2
        colorButtonText241.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText241
    }()
    
    private let colorButton242: UIButton = {
        let colorButton242 = UIButton()
        colorButton242.backgroundColor = .red
        colorButton242.layer.borderWidth = 0.2
        colorButton242.layer.borderColor = UIColor.blue.cgColor
        colorButton242.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton242.tag = 242
        
        return colorButton242
    }()
    
    private let colorButtonText242: UIButton = {
        let colorButtonText242 = UIButton()
        colorButtonText242.setTitle("Led1", for: .normal)
        colorButtonText242.layer.borderWidth = 0.2
        colorButtonText242.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText242
    }()
    
    private let colorButton243: UIButton = {
        let colorButton243 = UIButton()
        colorButton243.backgroundColor = .blue
        colorButton243.layer.borderWidth = 0.2
        colorButton243.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton243
    }()
    
    private let colorButtonText243: UIButton = {
        let colorButtonText243 = UIButton()
        colorButtonText243.setTitle("K", for: .normal)
        colorButtonText243.layer.borderWidth = 0.2
        colorButtonText243.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText243
    }()
    
    private let colorButton251: UIButton = {
        let colorButton251 = UIButton()
        colorButton251.backgroundColor = .green
        colorButton251.layer.borderWidth = 0.2
        colorButton251.layer.borderColor = UIColor.blue.cgColor
        colorButton251.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton251.tag = 251
        
        
        return colorButton251
    }()
    
    private let colorButtonText251: UIButton = {
        let colorButtonText251 = UIButton()
        colorButtonText251.setTitle("1", for: .normal)
        colorButtonText251.layer.borderWidth = 0.2
        colorButtonText251.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText251
    }()
    
    private let colorButton252: UIButton = {
        let colorButton252 = UIButton()
        colorButton252.backgroundColor = .red
        colorButton252.layer.borderWidth = 0.2
        colorButton252.layer.borderColor = UIColor.blue.cgColor
        colorButton252.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton252.tag = 252
        
        return colorButton252
    }()
    
    private let colorButtonText252: UIButton = {
        let colorButtonText252 = UIButton()
        colorButtonText252.setTitle("Led1", for: .normal)
        colorButtonText252.layer.borderWidth = 0.2
        colorButtonText252.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText252
    }()
    
    private let colorButton253: UIButton = {
        let colorButton253 = UIButton()
        colorButton253.backgroundColor = .blue
        colorButton253.layer.borderWidth = 0.2
        colorButton253.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton253
    }()
    
    private let colorButtonText253: UIButton = {
        let colorButtonText253 = UIButton()
        colorButtonText253.setTitle("K", for: .normal)
        colorButtonText253.layer.borderWidth = 0.2
        colorButtonText253.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText253
    }()
    
    private let colorButton261: UIButton = {
        let colorButton261 = UIButton()
        colorButton261.backgroundColor = .green
        colorButton261.layer.borderWidth = 0.2
        colorButton261.layer.borderColor = UIColor.blue.cgColor
        colorButton261.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton261.tag = 261
        
        
        return colorButton261
    }()
    
    private let colorButtonText261: UIButton = {
        let colorButtonText261 = UIButton()
        colorButtonText261.setTitle("1", for: .normal)
        colorButtonText261.layer.borderWidth = 0.2
        colorButtonText261.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText261
    }()
    
    private let colorButton262: UIButton = {
        let colorButton262 = UIButton()
        colorButton262.backgroundColor = .red
        colorButton262.layer.borderWidth = 0.2
        colorButton262.layer.borderColor = UIColor.blue.cgColor
        colorButton262.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton262.tag = 262
        
        return colorButton262
    }()
    
    private let colorButtonText262: UIButton = {
        let colorButtonText262 = UIButton()
        colorButtonText262.setTitle("Led1", for: .normal)
        colorButtonText262.layer.borderWidth = 0.2
        colorButtonText262.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText262
    }()
    
    private let colorButton263: UIButton = {
        let colorButton263 = UIButton()
        colorButton263.backgroundColor = .blue
        colorButton263.layer.borderWidth = 0.2
        colorButton263.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton263
    }()
    
    private let colorButtonText263: UIButton = {
        let colorButtonText263 = UIButton()
        colorButtonText263.setTitle("K", for: .normal)
        colorButtonText263.layer.borderWidth = 0.2
        colorButtonText263.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText263
    }()
    
    
    private let colorButtonText271: UIButton = {
        let colorButtonText271 = UIButton()
        colorButtonText271.setTitle("1", for: .normal)
        colorButtonText271.layer.borderWidth = 0.2
        colorButtonText271.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText271
    }()
    
    private let colorButton271: UIButton = {
        let colorButton271 = UIButton()
        colorButton271.backgroundColor = .green
        colorButton271.layer.borderWidth = 0.2
        colorButton271.layer.borderColor = UIColor.blue.cgColor
        colorButton271.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton271.tag = 271
        
        
        return colorButton271
    }()
    
    private let colorButton272: UIButton = {
        let colorButton272 = UIButton()
        colorButton272.backgroundColor = .red
        colorButton272.layer.borderWidth = 0.2
        colorButton272.layer.borderColor = UIColor.blue.cgColor
        colorButton272.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        
        return colorButton272
    }()
    
    private let colorButtonText272: UIButton = {
        let colorButtonText272 = UIButton()
        colorButtonText272.setTitle("Led1", for: .normal)
        colorButtonText272.layer.borderWidth = 0.2
        colorButtonText272.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText272
    }()
    
    private let colorButton273: UIButton = {
        let colorButton273 = UIButton()
        colorButton273.backgroundColor = .blue
        colorButton273.layer.borderWidth = 0.2
        colorButton273.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton273
    }()
    
    private let colorButtonText273: UIButton = {
        let colorButtonText273 = UIButton()
        colorButtonText273.setTitle("K", for: .normal)
        colorButtonText273.layer.borderWidth = 0.2
        colorButtonText273.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText273
    }()
    
    private let colorButton281: UIButton = {
        let colorButton281 = UIButton()
        colorButton281.backgroundColor = .green
        colorButton281.layer.borderWidth = 0.2
        colorButton281.layer.borderColor = UIColor.blue.cgColor
        colorButton281.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton281.tag = 281
        
        
        return colorButton281
    }()
    
    private let colorButtonText281: UIButton = {
        let colorButtonText281 = UIButton()
        colorButtonText281.setTitle("1", for: .normal)
        colorButtonText281.layer.borderWidth = 0.2
        colorButtonText281.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText281
    }()
    
    private let colorButton282: UIButton = {
        let colorButton282 = UIButton()
        colorButton282.backgroundColor = .red
        colorButton282.layer.borderWidth = 0.2
        colorButton282.layer.borderColor = UIColor.blue.cgColor
        colorButton282.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton282.tag  = 282
        
        return colorButton282
    }()
    
    private let colorButtonText282: UIButton = {
        let colorButtonText282 = UIButton()
        colorButtonText282.setTitle("Led1", for: .normal)
        colorButtonText282.layer.borderWidth = 0.2
        colorButtonText282.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText282
    }()
    
    private let colorButton283: UIButton = {
        let colorButton283 = UIButton()
        colorButton283.backgroundColor = .blue
        colorButton283.layer.borderWidth = 0.2
        colorButton283.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton283
    }()
    
    private let colorButtonText283: UIButton = {
        let colorButtonText283 = UIButton()
        colorButtonText283.setTitle("K", for: .normal)
        colorButtonText283.layer.borderWidth = 0.2
        colorButtonText283.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText283
    }()
    
    private let colorButton291: UIButton = {
        let colorButton291 = UIButton()
        colorButton291.backgroundColor = .green
        colorButton291.layer.borderWidth = 0.2
        colorButton291.layer.borderColor = UIColor.blue.cgColor
        colorButton291.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton291.tag = 291
        
        
        return colorButton291
    }()
    
    
    private let colorButtonText291: UIButton = {
        let colorButtonText291 = UIButton()
        colorButtonText291.setTitle("1", for: .normal)
        colorButtonText291.layer.borderWidth = 0.2
        colorButtonText291.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText291
    }()
    
    private let colorButton292: UIButton = {
        let colorButton292 = UIButton()
        colorButton292.backgroundColor = .red
        colorButton292.layer.borderWidth = 0.2
        colorButton292.layer.borderColor = UIColor.blue.cgColor
        colorButton292.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton292.tag = 292
        
        return colorButton292
    }()
    
    private let colorButtonText292: UIButton = {
        let colorButtonText292 = UIButton()
        colorButtonText292.setTitle("Led1", for: .normal)
        colorButtonText292.layer.borderWidth = 0.2
        colorButtonText292.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText292
    }()
    
    private let colorButton293: UIButton = {
        let colorButton293 = UIButton()
        colorButton293.backgroundColor = .blue
        colorButton293.layer.borderWidth = 0.2
        colorButton293.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton293
    }()
    
    private let colorButtonText293: UIButton = {
        let colorButtonText293 = UIButton()
        colorButtonText293.setTitle("K", for: .normal)
        colorButtonText293.layer.borderWidth = 0.2
        colorButtonText293.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText293
    }()
    
    
    private let colorButton311: UIButton = {
        let colorButton311 = UIButton()
        colorButton311.backgroundColor = .green
        colorButton311.layer.borderWidth = 0.2
        colorButton311.layer.borderColor = UIColor.blue.cgColor
        colorButton311.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton311.tag = 311
        
        
        return colorButton311
    }()
    
    private let colorButtonText311: UIButton = {
        let colorButtonText311 = UIButton()
        colorButtonText311.setTitle("1", for: .normal)
        colorButtonText311.layer.borderWidth = 0.2
        colorButtonText311.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText311
    }()
    
    private let colorButton312: UIButton = {
        let colorButton312 = UIButton()
        colorButton312.backgroundColor = .red
        colorButton312.layer.borderWidth = 0.2
        colorButton312.layer.borderColor = UIColor.blue.cgColor
        colorButton312.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton312.tag = 312
        
        return colorButton312
    }()
    
    private let colorButtonText312: UIButton = {
        let colorButtonText312 = UIButton()
        colorButtonText312.setTitle("Led1", for: .normal)
        colorButtonText312.layer.borderWidth = 0.2
        colorButtonText312.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText312
    }()
    
    private let colorButton313: UIButton = {
        let colorButton313 = UIButton()
        colorButton313.backgroundColor = .blue
        colorButton313.layer.borderWidth = 0.2
        colorButton313.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton313
    }()
    
    private let colorButtonText313: UIButton = {
        let colorButtonText313 = UIButton()
        colorButtonText313.setTitle("K", for: .normal)
        colorButtonText313.layer.borderWidth = 0.2
        colorButtonText313.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText313
    }()
    
    private let colorButton321: UIButton = {
        let colorButton321 = UIButton()
        colorButton321.backgroundColor = .green
        colorButton321.layer.borderWidth = 0.2
        colorButton321.layer.borderColor = UIColor.blue.cgColor
        colorButton321.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton321.tag = 321
        
        
        return colorButton321
    }()
    
    private let colorButtonText321: UIButton = {
        let colorButtonText321 = UIButton()
        colorButtonText321.setTitle("1", for: .normal)
        colorButtonText321.layer.borderWidth = 0.2
        colorButtonText321.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText321
    }()
    
    private let colorButton322: UIButton = {
        let colorButton322 = UIButton()
        colorButton322.backgroundColor = .red
        colorButton322.layer.borderWidth = 0.2
        colorButton322.layer.borderColor = UIColor.blue.cgColor
        colorButton322.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton322.tag = 322
        
        return colorButton322
    }()
    
    private let colorButtonText322: UIButton = {
        let colorButtonText322 = UIButton()
        colorButtonText322.setTitle("Led1", for: .normal)
        colorButtonText322.layer.borderWidth = 0.2
        colorButtonText322.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText322
    }()
    
    private let colorButton323: UIButton = {
        let colorButton323 = UIButton()
        colorButton323.backgroundColor = .blue
        colorButton323.layer.borderWidth = 0.2
        colorButton323.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton323
    }()
    
    private let colorButtonText323: UIButton = {
        let colorButtonText323 = UIButton()
        colorButtonText323.setTitle("K", for: .normal)
        colorButtonText323.layer.borderWidth = 0.2
        colorButtonText323.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText323
    }()
    
    private let colorButton331: UIButton = {
        let colorButton331 = UIButton()
        colorButton331.backgroundColor = .green
        colorButton331.layer.borderWidth = 0.2
        colorButton331.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton331
    }()
    
    private let colorButtonText331: UIButton = {
        let colorButtonText331 = UIButton()
        colorButtonText331.setTitle("1", for: .normal)
        colorButtonText331.layer.borderWidth = 0.2
        colorButtonText331.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText331
    }()
    
    private let colorButton332: UIButton = {
        let colorButton332 = UIButton()
        colorButton332.backgroundColor = .red
        colorButton332.layer.borderWidth = 0.2
        colorButton332.layer.borderColor = UIColor.blue.cgColor
        colorButton332.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton332.tag = 332
        
        return colorButton332
    }()
    
    private let colorButtonText332: UIButton = {
        let colorButtonText332 = UIButton()
        colorButtonText332.setTitle("Led1", for: .normal)
        colorButtonText332.layer.borderWidth = 0.2
        colorButtonText332.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText332
    }()
    
    private let colorButton333: UIButton = {
        let colorButton333 = UIButton()
        colorButton333.backgroundColor = .blue
        colorButton333.layer.borderWidth = 0.2
        colorButton333.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton333
    }()
    
    private let colorButtonText333: UIButton = {
        let colorButtonText333 = UIButton()
        colorButtonText333.setTitle("K", for: .normal)
        colorButtonText333.layer.borderWidth = 0.2
        colorButtonText333.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText333
    }()
    
    private let colorButton341: UIButton = {
        let colorButton341 = UIButton()
        colorButton341.backgroundColor = .green
        colorButton341.layer.borderWidth = 0.2
        colorButton341.layer.borderColor = UIColor.blue.cgColor
        colorButton341.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton341.tag = 341
        
        
        return colorButton341
    }()
    
    private let colorButtonText341: UIButton = {
        let colorButtonText341 = UIButton()
        colorButtonText341.setTitle("1", for: .normal)
        colorButtonText341.layer.borderWidth = 0.2
        colorButtonText341.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText341
    }()
    
    private let colorButton342: UIButton = {
        let colorButton342 = UIButton()
        colorButton342.backgroundColor = .red
        colorButton342.layer.borderWidth = 0.2
        colorButton342.layer.borderColor = UIColor.blue.cgColor
        colorButton342.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton342.tag = 342
        
        return colorButton342
    }()
    
    private let colorButtonText342: UIButton = {
        let colorButtonText342 = UIButton()
        colorButtonText342.setTitle("Led1", for: .normal)
        colorButtonText342.layer.borderWidth = 0.2
        colorButtonText342.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText342
    }()
    
    private let colorButton343: UIButton = {
        let colorButton343 = UIButton()
        colorButton343.backgroundColor = .blue
        colorButton343.layer.borderWidth = 0.2
        colorButton343.layer.borderColor = UIColor.blue.cgColor
        
        
        return colorButton343
    }()
    
    private let colorButtonText343: UIButton = {
        let colorButtonText343 = UIButton()
        colorButtonText343.setTitle("K", for: .normal)
        colorButtonText343.layer.borderWidth = 0.2
        colorButtonText343.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText343
    }()
    
    private let colorButton351: UIButton = {
        let colorButton351 = UIButton()
        colorButton351.backgroundColor = .green
        colorButton351.layer.borderWidth = 0.2
        colorButton351.layer.borderColor = UIColor.blue.cgColor
        colorButton351.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton351.tag = 351
        
        
        return colorButton351
    }()
    
    private let colorButtonText351: UIButton = {
        let colorButtonText351 = UIButton()
        colorButtonText351.setTitle("1", for: .normal)
        colorButtonText351.layer.borderWidth = 0.2
        colorButtonText351.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText351
    }()
    
    private let colorButton352: UIButton = {
        let colorButton352 = UIButton()
        colorButton352.backgroundColor = .red
        colorButton352.layer.borderWidth = 0.2
        colorButton352.layer.borderColor = UIColor.blue.cgColor
        colorButton352.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton352.tag = 352
        
        return colorButton352
    }()
    
    private let colorButtonText352: UIButton = {
        let colorButtonText352 = UIButton()
        colorButtonText352.setTitle("Led1", for: .normal)
        colorButtonText352.layer.borderWidth = 0.2
        colorButtonText352.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText352
    }()
    
    private let colorButton353: UIButton = {
        let colorButton353 = UIButton()
        colorButton353.backgroundColor = .blue
        colorButton353.layer.borderWidth = 0.2
        colorButton353.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton353
    }()
    
    private let colorButtonText353: UIButton = {
        let colorButtonText353 = UIButton()
        colorButtonText353.setTitle("K", for: .normal)
        colorButtonText353.layer.borderWidth = 0.2
        colorButtonText353.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText353
    }()
    
    private let colorButton361: UIButton = {
        let colorButton361 = UIButton()
        colorButton361.backgroundColor = .green
        colorButton361.layer.borderWidth = 0.2
        colorButton361.layer.borderColor = UIColor.blue.cgColor
        colorButton361.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton361.tag = 361
        
        
        return colorButton361
    }()
    
    private let colorButtonText361: UIButton = {
        let colorButtonText361 = UIButton()
        colorButtonText361.setTitle("1", for: .normal)
        colorButtonText361.layer.borderWidth = 0.2
        colorButtonText361.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText361
    }()
    
    private let colorButton362: UIButton = {
        let colorButton362 = UIButton()
        colorButton362.backgroundColor = .red
        colorButton362.layer.borderWidth = 0.2
        colorButton362.layer.borderColor = UIColor.blue.cgColor
        colorButton362.addTarget(self, action: #selector(colorPaletteTest), for: .touchUpInside)
        colorButton362.tag = 362
        
        return colorButton362
    }()
    
    private let colorButtonText362: UIButton = {
        let colorButtonText362 = UIButton()
        colorButtonText362.setTitle("Led1", for: .normal)
        colorButtonText362.layer.borderWidth = 0.2
        colorButtonText362.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText362
    }()
    
    private let colorButton363: UIButton = {
        let colorButton363 = UIButton()
        colorButton363.backgroundColor = .blue
        colorButton363.layer.borderWidth = 0.2
        colorButton363.layer.borderColor = UIColor.blue.cgColor
        
        return colorButton363
    }()
    
    private let colorButtonText363: UIButton = {
        let colorButtonText363 = UIButton()
        colorButtonText363.setTitle("K", for: .normal)
        colorButtonText363.layer.borderWidth = 0.2
        colorButtonText363.layer.borderColor = UIColor.blue.cgColor
        
        return colorButtonText363
    }()
    
    
    
    
    @objc func didTapHome() {
        let vc = storyboard?.instantiateViewController(identifier: "firstPageViewController") as! firstPageViewController
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
        
    }
    
    @objc func colorPaletteTest(_ sender: UIButton) {
        let colorVC = UIColorPickerViewController()
        colorVC.delegate = self
        clickedButton = sender
        present(colorVC, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundPhoto.image = UIImage(named: "BackgroundFirstPage-1")
        backgroundPhoto.contentMode = .scaleAspectFill
        
        view.addSubview(homeButton)
        
        view.addSubview(topText)
        
        view.addSubview(colorButton11)
        view.addSubview(colorButton12)
        view.addSubview(colorButton13)
        
        view.addSubview(colorButtonText11)
        view.addSubview(colorButtonText12)
        view.addSubview(colorButtonText13)
        
        view.addSubview(colorButton21)
        view.addSubview(colorButton22)
        view.addSubview(colorButton23)
        
        view.addSubview(colorButtonText21)
        view.addSubview(colorButtonText22)
        view.addSubview(colorButtonText23)
        
        view.addSubview(colorButton31)
        view.addSubview(colorButton32)
        view.addSubview(colorButton33)
        
        view.addSubview(colorButtonText31)
        view.addSubview(colorButtonText32)
        view.addSubview(colorButtonText33)
        
        view.addSubview(colorButton41)
        view.addSubview(colorButton42)
        view.addSubview(colorButton43)
        
        view.addSubview(colorButtonText41)
        view.addSubview(colorButtonText42)
        view.addSubview(colorButtonText43)
        
        view.addSubview(colorButton51)
        view.addSubview(colorButton52)
        view.addSubview(colorButton53)
        
        view.addSubview(colorButtonText51)
        view.addSubview(colorButtonText52)
        view.addSubview(colorButtonText53)
        
        view.addSubview(colorButton61)
        view.addSubview(colorButton62)
        view.addSubview(colorButton63)
        
        view.addSubview(colorButtonText61)
        view.addSubview(colorButtonText62)
        view.addSubview(colorButtonText63)
        
        view.addSubview(colorButton71)
        view.addSubview(colorButton72)
        view.addSubview(colorButton73)
        
        view.addSubview(colorButtonText71)
        view.addSubview(colorButtonText72)
        view.addSubview(colorButtonText73)
        
        view.addSubview(colorButton81)
        view.addSubview(colorButton82)
        view.addSubview(colorButton83)
        
        view.addSubview(colorButtonText81)
        view.addSubview(colorButtonText82)
        view.addSubview(colorButtonText83)
        
        view.addSubview(colorButton91)
        view.addSubview(colorButton92)
        view.addSubview(colorButton93)
        
        view.addSubview(colorButtonText91)
        view.addSubview(colorButtonText92)
        view.addSubview(colorButtonText93)
        
        view.addSubview(colorButton101)
        view.addSubview(colorButton102)
        view.addSubview(colorButton103)
        
        view.addSubview(colorButtonText101)
        view.addSubview(colorButtonText102)
        view.addSubview(colorButtonText103)
        
        view.addSubview(colorButton111)
        view.addSubview(colorButton112)
        view.addSubview(colorButton113)
        
        view.addSubview(colorButtonText111)
        view.addSubview(colorButtonText112)
        view.addSubview(colorButtonText113)
        
        view.addSubview(colorButton121)
        view.addSubview(colorButton122)
        view.addSubview(colorButton123)
        
        view.addSubview(colorButtonText121)
        view.addSubview(colorButtonText122)
        view.addSubview(colorButtonText123)
        
        view.addSubview(colorButton131)
        view.addSubview(colorButton132)
        view.addSubview(colorButton133)
        
        view.addSubview(colorButtonText131)
        view.addSubview(colorButtonText132)
        view.addSubview(colorButtonText133)
        
        view.addSubview(colorButton141)
        view.addSubview(colorButton142)
        view.addSubview(colorButton143)
        
        view.addSubview(colorButtonText141)
        view.addSubview(colorButtonText142)
        view.addSubview(colorButtonText143)
        
        view.addSubview(colorButton151)
        view.addSubview(colorButton152)
        view.addSubview(colorButton153)
        
        view.addSubview(colorButtonText151)
        view.addSubview(colorButtonText152)
        view.addSubview(colorButtonText153)
        
        view.addSubview(colorButton161)
        view.addSubview(colorButton162)
        view.addSubview(colorButton163)
        
        view.addSubview(colorButtonText161)
        view.addSubview(colorButtonText162)
        view.addSubview(colorButtonText163)
        
        //        right side buttons
        
        view.addSubview(colorButton211)
        view.addSubview(colorButton212)
        view.addSubview(colorButton213)
        
        view.addSubview(colorButtonText211)
        view.addSubview(colorButtonText212)
        view.addSubview(colorButtonText213)
        
        view.addSubview(colorButton211)
        view.addSubview(colorButton212)
        view.addSubview(colorButton213)
        
        view.addSubview(colorButtonText211)
        view.addSubview(colorButtonText212)
        view.addSubview(colorButtonText313)
        
        view.addSubview(colorButton221)
        view.addSubview(colorButton222)
        view.addSubview(colorButton223)
        
        view.addSubview(colorButtonText221)
        view.addSubview(colorButtonText222)
        view.addSubview(colorButtonText223)
        
        view.addSubview(colorButton231)
        view.addSubview(colorButton232)
        view.addSubview(colorButton233)
        
        view.addSubview(colorButtonText231)
        view.addSubview(colorButtonText232)
        view.addSubview(colorButtonText233)
        
        view.addSubview(colorButton241)
        view.addSubview(colorButton242)
        view.addSubview(colorButton243)
        
        view.addSubview(colorButtonText241)
        view.addSubview(colorButtonText242)
        view.addSubview(colorButtonText243)
        
        view.addSubview(colorButton251)
        view.addSubview(colorButton252)
        view.addSubview(colorButton253)
        
        view.addSubview(colorButtonText251)
        view.addSubview(colorButtonText252)
        view.addSubview(colorButtonText253)
        
        view.addSubview(colorButton261)
        view.addSubview(colorButton262)
        view.addSubview(colorButton263)
        
        view.addSubview(colorButtonText261)
        view.addSubview(colorButtonText262)
        view.addSubview(colorButtonText263)
        
        view.addSubview(colorButton271)
        view.addSubview(colorButton272)
        view.addSubview(colorButton273)
        
        view.addSubview(colorButtonText271)
        view.addSubview(colorButtonText272)
        view.addSubview(colorButtonText273)
        
        view.addSubview(colorButton281)
        view.addSubview(colorButton282)
        view.addSubview(colorButton283)
        
        view.addSubview(colorButtonText281)
        view.addSubview(colorButtonText282)
        view.addSubview(colorButtonText283)
        
        view.addSubview(colorButton291)
        view.addSubview(colorButton292)
        view.addSubview(colorButton293)
        
        view.addSubview(colorButtonText291)
        view.addSubview(colorButtonText292)
        view.addSubview(colorButtonText293)
        
        view.addSubview(colorButton311)
        view.addSubview(colorButton312)
        view.addSubview(colorButton313)
        
        view.addSubview(colorButtonText311)
        view.addSubview(colorButtonText312)
        view.addSubview(colorButtonText313)
        
        view.addSubview(colorButton321)
        view.addSubview(colorButton322)
        view.addSubview(colorButton323)
        
        view.addSubview(colorButtonText321)
        view.addSubview(colorButtonText322)
        view.addSubview(colorButtonText323)
        
        view.addSubview(colorButton331)
        view.addSubview(colorButton332)
        view.addSubview(colorButton333)
        
        view.addSubview(colorButtonText331)
        view.addSubview(colorButtonText332)
        view.addSubview(colorButtonText333)
        
        view.addSubview(colorButton341)
        view.addSubview(colorButton342)
        view.addSubview(colorButton343)
        
        view.addSubview(colorButtonText341)
        view.addSubview(colorButtonText342)
        view.addSubview(colorButtonText343)
        
        view.addSubview(colorButton351)
        view.addSubview(colorButton352)
        view.addSubview(colorButton353)
        
        view.addSubview(colorButtonText351)
        view.addSubview(colorButtonText352)
        view.addSubview(colorButtonText353)
        
        view.addSubview(colorButton361)
        view.addSubview(colorButton362)
        view.addSubview(colorButton363)
        
        view.addSubview(colorButtonText361)
        view.addSubview(colorButtonText362)
        view.addSubview(colorButtonText363)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        homeButton.frame = CGRect(x: 700, y: 40, width: 60, height: 40)
        topText.frame = CGRect(x: 350, y: 40, width: 190, height: 40)
        
        colorButton11.frame = CGRect(x: 95, y: 100, width: 60, height: 40)
        colorButtonText11.frame = CGRect(x: 150, y: 100, width: 60, height: 40)
        colorButton12.frame = CGRect(x: 205, y: 100, width: 60, height: 40)
        colorButtonText12.frame = CGRect(x: 260, y: 100, width: 60, height: 40)
        colorButton13.frame = CGRect(x: 320, y: 100, width: 60, height: 40)
        colorButtonText13.frame = CGRect(x: 365, y: 100, width: 60, height: 40)
        
        colorButton21.frame = CGRect(x: 95, y: 160, width: 60, height: 40)
        colorButtonText21.frame = CGRect(x: 150, y: 160, width: 60, height: 40)
        colorButton22.frame = CGRect(x: 205, y: 160, width: 60, height: 40)
        colorButtonText22.frame = CGRect(x: 260, y: 160, width: 60, height: 40)
        colorButton23.frame = CGRect(x: 320, y: 160, width: 60, height: 40)
        colorButtonText23.frame = CGRect(x: 365, y: 160, width: 60, height: 40)
        
        colorButton31.frame = CGRect(x: 95, y: 220, width: 60, height: 40)
        colorButtonText31.frame = CGRect(x: 150, y: 220, width: 60, height: 40)
        colorButton32.frame = CGRect(x: 205, y: 220, width: 60, height: 40)
        colorButtonText32.frame = CGRect(x: 260, y: 220, width: 60, height: 40)
        colorButton33.frame = CGRect(x: 320, y: 220, width: 60, height: 40)
        colorButtonText33.frame = CGRect(x: 365, y: 220, width: 60, height: 40)
        
        colorButton41.frame = CGRect(x: 95, y: 280, width: 60, height: 40)
        colorButtonText41.frame = CGRect(x: 150, y: 280, width: 60, height: 40)
        colorButton42.frame = CGRect(x: 205, y: 280, width: 60, height: 40)
        colorButtonText42.frame = CGRect(x: 265, y: 280, width: 60, height: 40)
        colorButton43.frame = CGRect(x: 320, y: 280, width: 60, height: 40)
        colorButtonText43.frame = CGRect(x: 365, y: 280, width: 60, height: 40)
        
        colorButton51.frame = CGRect(x: 95, y: 340, width: 60, height: 40)
        colorButtonText51.frame = CGRect(x: 150, y: 340, width: 60, height: 40)
        colorButton52.frame = CGRect(x: 205, y: 340, width: 60, height: 40)
        colorButtonText52.frame = CGRect(x: 265, y: 340, width: 60, height: 40)
        colorButton53.frame = CGRect(x: 320, y: 340, width: 60, height: 40)
        colorButtonText53.frame = CGRect(x: 365, y: 340, width: 60, height: 40)
        
        colorButton61.frame = CGRect(x: 95, y: 340, width: 60, height: 40)
        colorButtonText61.frame = CGRect(x: 150, y: 340, width: 60, height: 40)
        colorButton62.frame = CGRect(x: 205, y: 340, width: 60, height: 40)
        colorButtonText62.frame = CGRect(x: 265, y: 340, width: 60, height: 40)
        colorButton63.frame = CGRect(x: 320, y: 340, width: 60, height: 40)
        colorButtonText63.frame = CGRect(x: 365, y: 340, width: 60, height: 40)
        
        colorButton71.frame = CGRect(x: 95, y: 400, width: 60, height: 40)
        colorButtonText71.frame = CGRect(x: 150, y: 400, width: 60, height: 40)
        colorButton72.frame = CGRect(x: 205, y: 400, width: 60, height: 40)
        colorButtonText72.frame = CGRect(x: 265, y: 400, width: 60, height: 40)
        colorButton73.frame = CGRect(x: 320, y: 400, width: 60, height: 40)
        colorButtonText73.frame = CGRect(x: 365, y: 400, width: 60, height: 40)
        
        colorButton81.frame = CGRect(x: 95, y: 460, width: 60, height: 40)
        colorButtonText81.frame = CGRect(x: 150, y: 460, width: 60, height: 40)
        colorButton82.frame = CGRect(x: 205, y: 460, width: 60, height: 40)
        colorButtonText82.frame = CGRect(x: 265, y: 460, width: 60, height: 40)
        colorButton83.frame = CGRect(x: 320, y: 460, width: 60, height: 40)
        colorButtonText83.frame = CGRect(x: 365, y: 460, width: 60, height: 40)
        
        colorButton91.frame = CGRect(x: 95, y: 520, width: 60, height: 40)
        colorButtonText91.frame = CGRect(x: 150, y: 520, width: 60, height: 40)
        colorButton92.frame = CGRect(x: 205, y: 520, width: 60, height: 40)
        colorButtonText92.frame = CGRect(x: 265, y: 520, width: 60, height: 40)
        colorButton93.frame = CGRect(x: 320, y: 520, width: 60, height: 40)
        colorButtonText93.frame = CGRect(x: 365, y: 520, width: 60, height: 40)
        
        colorButton101.frame = CGRect(x: 95, y: 580, width: 60, height: 40)
        colorButtonText101.frame = CGRect(x: 150, y: 580, width: 60, height: 40)
        colorButton102.frame = CGRect(x: 205, y: 580, width: 60, height: 40)
        colorButtonText102.frame = CGRect(x: 265, y: 580, width: 60, height: 40)
        colorButton103.frame = CGRect(x: 320, y: 580, width: 60, height: 40)
        colorButtonText103.frame = CGRect(x: 365, y: 580, width: 60, height: 40)
        
        colorButton111.frame = CGRect(x: 95, y: 640, width: 60, height: 40)
        colorButtonText111.frame = CGRect(x: 150, y: 640, width: 60, height: 40)
        colorButton112.frame = CGRect(x: 205, y: 640, width: 60, height: 40)
        colorButtonText112.frame = CGRect(x: 265, y: 640, width: 60, height: 40)
        colorButton113.frame = CGRect(x: 320, y: 640, width: 60, height: 40)
        colorButtonText113.frame = CGRect(x: 365, y: 640, width: 60, height: 40)
        
        colorButton121.frame = CGRect(x: 95, y: 700, width: 60, height: 40)
        colorButtonText121.frame = CGRect(x: 150, y: 700, width: 60, height: 40)
        colorButton122.frame = CGRect(x: 205, y: 700, width: 60, height: 40)
        colorButtonText122.frame = CGRect(x: 265, y: 700, width: 60, height: 40)
        colorButton123.frame = CGRect(x: 320, y: 700, width: 60, height: 40)
        colorButtonText123.frame = CGRect(x: 365, y: 700, width: 60, height: 40)
        
        colorButton131.frame = CGRect(x: 95, y: 760, width: 60, height: 40)
        colorButtonText131.frame = CGRect(x: 150, y: 760, width: 60, height: 40)
        colorButton132.frame = CGRect(x: 205, y: 760, width: 60, height: 40)
        colorButtonText132.frame = CGRect(x: 265, y: 760, width: 60, height: 40)
        colorButton133.frame = CGRect(x: 320, y: 760, width: 60, height: 40)
        colorButtonText133.frame = CGRect(x: 365, y: 760, width: 60, height: 40)
        
        colorButton141.frame = CGRect(x: 95, y: 820, width: 60, height: 40)
        colorButtonText141.frame = CGRect(x: 150, y: 820, width: 60, height: 40)
        colorButton142.frame = CGRect(x: 205, y: 820, width: 60, height: 40)
        colorButtonText142.frame = CGRect(x: 265, y: 820, width: 60, height: 40)
        colorButton143.frame = CGRect(x: 320, y: 820, width: 60, height: 40)
        colorButtonText143.frame = CGRect(x: 365, y: 820, width: 60, height: 40)
        
        colorButton151.frame = CGRect(x: 95, y: 880, width: 60, height: 40)
        colorButtonText151.frame = CGRect(x: 150, y: 880, width: 60, height: 40)
        colorButton152.frame = CGRect(x: 205, y: 880, width: 60, height: 40)
        colorButtonText152.frame = CGRect(x: 265, y: 880, width: 60, height: 40)
        colorButton153.frame = CGRect(x: 320, y: 880, width: 60, height: 40)
        colorButtonText153.frame = CGRect(x: 365, y: 880, width: 60, height: 40)
        
        colorButton161.frame = CGRect(x: 95, y: 940, width: 60, height: 40)
        colorButtonText161.frame = CGRect(x: 150, y: 940, width: 60, height: 40)
        colorButton162.frame = CGRect(x: 205, y: 940, width: 60, height: 40)
        colorButtonText162.frame = CGRect(x: 265, y: 940, width: 60, height: 40)
        colorButton163.frame = CGRect(x: 320, y: 940, width: 60, height: 40)
        colorButtonText163.frame = CGRect(x: 365, y: 940, width: 60, height: 40)
        
        //right side
        
        colorButton211.frame = CGRect(x: 450, y: 100, width: 60, height: 40)
        colorButtonText211.frame = CGRect(x: 500, y: 100, width: 60, height: 40)
        colorButton212.frame = CGRect(x: 555, y: 100, width: 60, height: 40)
        colorButtonText212.frame = CGRect(x: 610, y: 100, width: 60, height: 40)
        colorButton213.frame = CGRect(x: 665, y: 100, width: 60, height: 40)
        colorButtonText213.frame = CGRect(x: 710, y: 100, width: 60, height: 40)
        
        colorButton221.frame = CGRect(x: 450, y: 160, width: 60, height: 40)
        colorButtonText221.frame = CGRect(x: 500, y: 160, width: 60, height: 40)
        colorButton222.frame = CGRect(x: 555, y: 160, width: 60, height: 40)
        colorButtonText222.frame = CGRect(x: 610, y: 160, width: 60, height: 40)
        colorButton223.frame = CGRect(x: 665, y: 160, width: 60, height: 40)
        colorButtonText223.frame = CGRect(x: 710, y: 160, width: 60, height: 40)
        
        colorButton231.frame = CGRect(x: 450, y: 220, width: 60, height: 40)
        colorButtonText231.frame = CGRect(x: 500, y: 220, width: 60, height: 40)
        colorButton232.frame = CGRect(x: 555, y: 220, width: 60, height: 40)
        colorButtonText232.frame = CGRect(x: 610, y: 220, width: 60, height: 40)
        colorButton233.frame = CGRect(x: 665, y: 220, width: 60, height: 40)
        colorButtonText233.frame = CGRect(x: 710, y: 220, width: 60, height: 40)
        
        colorButton241.frame = CGRect(x: 450, y: 280, width: 60, height: 40)
        colorButtonText241.frame = CGRect(x: 500, y: 280, width: 60, height: 40)
        colorButton242.frame = CGRect(x: 555, y: 280, width: 60, height: 40)
        colorButtonText242.frame = CGRect(x: 610, y: 280, width: 60, height: 40)
        colorButton243.frame = CGRect(x: 665, y: 280, width: 60, height: 40)
        colorButtonText243.frame = CGRect(x: 710, y: 280, width: 60, height: 40)
        
        colorButton251.frame = CGRect(x: 450, y: 340, width: 60, height: 40)
        colorButtonText251.frame = CGRect(x: 500, y: 340, width: 60, height: 40)
        colorButton252.frame = CGRect(x: 555, y: 340, width: 60, height: 40)
        colorButtonText252.frame = CGRect(x: 610, y: 340, width: 60, height: 40)
        colorButton253.frame = CGRect(x: 665, y: 340, width: 60, height: 40)
        colorButtonText253.frame = CGRect(x: 710, y: 340, width: 60, height: 40)
        
        colorButton261.frame = CGRect(x: 450, y: 400, width: 60, height: 40)
        colorButtonText261.frame = CGRect(x: 500, y: 400, width: 60, height: 40)
        colorButton262.frame = CGRect(x: 555, y: 400, width: 60, height: 40)
        colorButtonText262.frame = CGRect(x: 610, y: 400, width: 60, height: 40)
        colorButton263.frame = CGRect(x: 665, y: 400, width: 60, height: 40)
        colorButtonText263.frame = CGRect(x: 710, y: 400, width: 60, height: 40)
        
        colorButton271.frame = CGRect(x: 450, y: 460, width: 60, height: 40)
        colorButtonText271.frame = CGRect(x: 500, y: 460, width: 60, height: 40)
        colorButton272.frame = CGRect(x: 555, y: 460, width: 60, height: 40)
        colorButtonText272.frame = CGRect(x: 610, y: 460, width: 60, height: 40)
        colorButton273.frame = CGRect(x: 665, y: 460, width: 60, height: 40)
        colorButtonText273.frame = CGRect(x: 710, y: 460, width: 60, height: 40)
        
        colorButton281.frame = CGRect(x: 450, y: 520, width: 60, height: 40)
        colorButtonText281.frame = CGRect(x: 500, y: 520, width: 60, height: 40)
        colorButton282.frame = CGRect(x: 555, y: 520, width: 60, height: 40)
        colorButtonText282.frame = CGRect(x: 610, y: 520, width: 60, height: 40)
        colorButton283.frame = CGRect(x: 665, y: 520, width: 60, height: 40)
        colorButtonText283.frame = CGRect(x: 710, y: 520, width: 60, height: 40)
        
        colorButton281.frame = CGRect(x: 450, y: 520, width: 60, height: 40)
        colorButtonText281.frame = CGRect(x: 500, y: 520, width: 60, height: 40)
        colorButton282.frame = CGRect(x: 555, y: 520, width: 60, height: 40)
        colorButtonText282.frame = CGRect(x: 610, y: 520, width: 60, height: 40)
        colorButton283.frame = CGRect(x: 665, y: 520, width: 60, height: 40)
        colorButtonText283.frame = CGRect(x: 710, y: 520, width: 60, height: 40)
        
        colorButton291.frame = CGRect(x: 450, y: 580, width: 60, height: 40)
        colorButtonText291.frame = CGRect(x: 500, y: 580, width: 60, height: 40)
        colorButton292.frame = CGRect(x: 555, y: 580, width: 60, height: 40)
        colorButtonText292.frame = CGRect(x: 610, y: 580, width: 60, height: 40)
        colorButton293.frame = CGRect(x: 665, y: 580, width: 60, height: 40)
        colorButtonText293.frame = CGRect(x: 710, y: 580, width: 60, height: 40)
        
        colorButton311.frame = CGRect(x: 450, y: 640, width: 60, height: 40)
        colorButtonText311.frame = CGRect(x: 500, y: 640, width: 60, height: 40)
        colorButton312.frame = CGRect(x: 555, y: 640, width: 60, height: 40)
        colorButtonText312.frame = CGRect(x: 610, y: 640, width: 60, height: 40)
        colorButton313.frame = CGRect(x: 665, y: 640, width: 60, height: 40)
        colorButtonText313.frame = CGRect(x: 710, y: 640, width: 60, height: 40)
        
        colorButton321.frame = CGRect(x: 450, y: 700, width: 60, height: 40)
        colorButtonText321.frame = CGRect(x: 500, y: 700, width: 60, height: 40)
        colorButton322.frame = CGRect(x: 555, y: 700, width: 60, height: 40)
        colorButtonText322.frame = CGRect(x: 610, y: 700, width: 60, height: 40)
        colorButton323.frame = CGRect(x: 665, y: 700, width: 60, height: 40)
        colorButtonText323.frame = CGRect(x: 710, y: 700, width: 60, height: 40)
        
        colorButton331.frame = CGRect(x: 450, y: 760, width: 60, height: 40)
        colorButtonText331.frame = CGRect(x: 500, y: 760, width: 60, height: 40)
        colorButton332.frame = CGRect(x: 555, y: 760, width: 60, height: 40)
        colorButtonText332.frame = CGRect(x: 610, y: 760, width: 60, height: 40)
        colorButton333.frame = CGRect(x: 665, y: 760, width: 60, height: 40)
        colorButtonText333.frame = CGRect(x: 710, y: 760, width: 60, height: 40)
        
        colorButton341.frame = CGRect(x: 450, y: 820, width: 60, height: 40)
        colorButtonText341.frame = CGRect(x: 500, y: 820, width: 60, height: 40)
        colorButton342.frame = CGRect(x: 555, y: 820, width: 60, height: 40)
        colorButtonText342.frame = CGRect(x: 610, y: 820, width: 60, height: 40)
        colorButton343.frame = CGRect(x: 665, y: 820, width: 60, height: 40)
        colorButtonText343.frame = CGRect(x: 710, y: 820, width: 60, height: 40)
        
        colorButton351.frame = CGRect(x: 450, y: 880, width: 60, height: 40)
        colorButtonText351.frame = CGRect(x: 500, y: 880, width: 60, height: 40)
        colorButton352.frame = CGRect(x: 555, y: 880, width: 60, height: 40)
        colorButtonText352.frame = CGRect(x: 610, y: 880, width: 60, height: 40)
        colorButton353.frame = CGRect(x: 665, y: 880, width: 60, height: 40)
        colorButtonText353.frame = CGRect(x: 710, y: 880, width: 60, height: 40)
        
        colorButton361.frame = CGRect(x: 450, y: 940, width: 60, height: 40)
        colorButtonText361.frame = CGRect(x: 500, y: 940, width: 60, height: 40)
        colorButton362.frame = CGRect(x: 555, y: 940, width: 60, height: 40)
        colorButtonText362.frame = CGRect(x: 610, y: 940, width: 60, height: 40)
        colorButton363.frame = CGRect(x: 665, y: 940, width: 60, height: 40)
        colorButtonText363.frame = CGRect(x: 710, y: 940, width: 60, height: 40)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        clickedButton?.backgroundColor = selectedColor
        
        let colorToSend = clickedButton?.backgroundColor?.toHexString() ?? ""
        if uid != nil {
            let dataToSend = FireStoreData(userID: uid ?? "No uid identified", deviceNumber: clickedButton?.tag ?? 1, colorCode: colorToSend)
            let object: [String: Any] = [
                "userID": dataToSend.userID as NSObject,
                "deviceNumber": dataToSend.deviceNumber,
                "colorCode": dataToSend.colorCode
            ]
            database.child("UserInfo \(Int.random(in: 0..<100))").setValue(object)
            
        } else { return }
    }
}
