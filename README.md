#TDTextSlider
## Infinite text slider for ios. Written in swift3.
![alt tag](http://i.giphy.com/3o7TKwtcoLTtUpEKC4.gif)

## Installation
### Cocoapods
```
pod 'TDTextSlider'
```
### Manually
Drag TDTextSlider.swift file into your project folder
## Usage
```
import TDTextSlider
```
```
class ViewController: UIViewController {

    let ts = TDTextSlider(frame: CGRect(x:0,y:200,width: UIScreen.main.bounds.width,height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()

        ts.createSlider(textArray: ["Emre","Duman","Github","TheDuman"], duration: 3.0, delay: 2.0)
        self.view.addSubview(ts)
    }
    override func viewDidAppear(_ animated: Bool) {
        ts.startAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
```

## Customization
Library created using subclass of UIView so you can customize using default UIView properties.Make sure you add your own customize code after createSlider function so it overrides default behaviours.
