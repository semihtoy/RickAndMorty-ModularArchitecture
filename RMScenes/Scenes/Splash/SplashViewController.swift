//
//  SplashViewController.swift
//  RMScenes
//
//  Created by SemihTOY on 6.09.2023.
//

import UIKit
import RMNetwork

public class SplashViewController: UIViewController {

  @IBOutlet weak var splashImageView: UIImageView!

  public override func viewDidLoad() {
    super.viewDidLoad()
    splashImageView.image = UIImage(named: "splash")
    navigateToCharacterList()
  }

  func navigateToCharacterList() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      let characterListUseCase = CharacterListUseCase()
      let viewController = CharacterListBuilder(characterListUseCase: characterListUseCase).build()
      self.navigationController?.pushViewController(viewController, animated: true)
    }
  }

}
