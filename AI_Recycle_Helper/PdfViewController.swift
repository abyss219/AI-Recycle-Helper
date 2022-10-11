//
//  PdfViewController.swift
//  AI_Recycle_Helper
//
//  Created by R L on 2022-10-09.
//
import PDFKit
import UIKit

class PdfViewController: UIViewController, PDFViewDelegate {
    let pdfView=PDFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pdfView)
        //link to document
        guard let url = Bundle.main.url(forResource:"Garbage Disposal", withExtension: "pdf") else {return}
        guard let document = PDFDocument(url: url) else {return}
        //to fit the screen size
        pdfView.minScaleFactor=4.0
        pdfView.minScaleFactor=pdfView.scaleFactorForSizeToFit
        pdfView.autoScales=true
        pdfView.delegate=self
        pdfView.document=document
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }
    

    
}
