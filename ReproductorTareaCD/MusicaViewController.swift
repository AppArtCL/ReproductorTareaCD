//
//  MusicaViewController.swift
//  ReproductorTareaCD
//
//  Created by Cristian Diaz on 15-01-16.
//  Copyright © 2016 AppArt. All rights reserved.
//

import UIKit
import AVFoundation

class MusicaViewController: UIViewController {

    // MARK: - Conexiones
    
    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var caratulaCancion: UIImageView!
    @IBAction func tocarCancion() {
        if !reproductor.playing {
            reproductor.play()
        }
    }
    @IBAction func pausarCancion() {
        if reproductor.playing {
            reproductor.pause()
        }
    }
    
    @IBAction func detenerCancion() {
        if reproductor.playing {
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    @IBAction func cambiarVolumen(sender: UISlider) {
        self.reproductor.volume = Float(sender.value)
    }
    @IBOutlet weak var barraVolumen: UISlider!
    
    
    // MARK: - Variables
    var reproductor: AVAudioPlayer!
    
    // MARK: - Funciones
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nombreCancion.text = listadoCanciones[cancionSeleccionada]
        self.caratulaCancion.image = UIImage(named: (listadoCaratulas[cancionSeleccionada] + ".jpg"))
        
        let rutaCancion = NSBundle.mainBundle().URLForResource(listadoCanciones[cancionSeleccionada], withExtension: "mp3")
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: rutaCancion!)
            reproductor.play()
            reproductor.volume = Float(barraVolumen.value)
        } catch {
            print("Error cargando la canción en el reproductor.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
