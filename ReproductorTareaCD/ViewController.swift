//
//  ViewController.swift
//  ReproductorTareaCD
//
//  Created by Cristian Diaz on 13-01-16.
//  Copyright © 2016 AppArt. All rights reserved.
//

import UIKit

var cancionSeleccionada = 0
var listadoCanciones = ["Seleccione canción", "Black or white", "Crazy", "Escapar", "I want to break free", "Un misil en mi placard"]
var listadoCaratulas = ["Ninguna", "Michael Jackson - Number Ones", "Aerosmith - Big Ones", "Kudai - Grandes Exitos", "Queen - Greatest Hits 2", "Soda Stereo - Unplugged"]


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: - Conexiones
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func tocaAleatorio() {
        let numero = arc4random_uniform(5) + 1
        cancionSeleccionada = Int(numero)
        print(numero)
        performSegueWithIdentifier("ReproducirMusica", sender: self)
    }
    
    
    // MARK: - Variables
  
    
    // MARK: - Funciones
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Color negro para la barra de navegación
        let navBarColor = navigationController!.navigationBar
        navBarColor.barTintColor = UIColor(red:  0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 100.0/100.0)
        navBarColor.barStyle = UIBarStyle.Black
        navBarColor.tintColor = UIColor.whiteColor()
        navBarColor.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        cancionSeleccionada = 0
        self.pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Funciones Picker
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listadoCanciones.count;
    }

    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let textoLinea = listadoCanciones[row]
        let textoBlanco = NSAttributedString(string: textoLinea, attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
        return textoBlanco
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row > 0) {
            cancionSeleccionada = row
            performSegueWithIdentifier("ReproducirMusica", sender: self)
        }
    }

    // MARK: - Navegación
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    //}

    
}

