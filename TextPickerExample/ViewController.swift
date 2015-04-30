import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var textField: UITextField!
    
    var items = ["", "item 1", "item 2" , "item 3"]
    
    var textPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textPicker = UIPickerView()
        textPicker.dataSource = self
        textPicker.delegate = self
        
        let f = textPicker.frame
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, f.width, (f.height * 0.15)))
        var buttons = [AnyObject]()
        var space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        buttons.append(space)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "donePressed")
        buttons.append(doneButton)
        
        
        toolbar.setItems(buttons, animated: false)
        
        textField.inputView = textPicker
        textField.inputAccessoryView = toolbar
    }
    
    func donePressed() {
        textField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return items[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = items[row]
    }
    
}