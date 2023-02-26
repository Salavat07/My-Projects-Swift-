//
//  CustomLayout.swift
//  CustomLayout
//
//  Created by Salavat on 23.02.2023.

import Foundation
import UIKit

protocol CustomLayoutDelegate: AnyObject {
  func collectionView( _ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGSize
}
// Класс, отвечающий за кастомное отображение коллекций.
class CustomLayout: UICollectionViewFlowLayout {
 
  // Подключаем делегат обязательно со слабой ссылкой.
  weak var delegateLayout: CustomLayoutDelegate?
 
  // Устанавливаем количество изображений (в колонку).
  private let numberOfColumns = 2
 
  // Устанавливаем отступ изображений по горизонтали.
  private let cellPadding: CGFloat = 2
 
  // Создаем хранилище макетов, в котором будут храниться данные объекта с размерами.
  private var cache: [UICollectionViewLayoutAttributes] = []
 
  // Создаем переменную, отвечающую за высоту контента с дефолтным значением 0.
  private var contentHeight: CGFloat = 0
 
  // Ширина изображения (вычисляется в процессе)
  private var contentWidth: CGFloat {
    guard let collectionView = collectionView else { return 0 }
    return collectionView.bounds.width
  }
 
  // Метод, возвращающий размер контента
  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
 
  // Метод, отвечающий за расстановку контента по ячейкам
  override func prepare() {
 
    // Проверяем хранилище на nil
    guard cache.isEmpty, let collectionView = collectionView else { return }
 
    // Устанавливаем ширину колонки под изображения
    let columnWidth = contentWidth / CGFloat(numberOfColumns)
 
    // Создаем контейнер, который будет хранить значения смещения по оси Х
    var xOffset: [CGFloat] = []
 
    // Перебираем количество колонок в цикле и заполняем хранилище в соответствии с осью, на которой находится колонка.
    for column in 0..<numberOfColumns {
      xOffset.append(CGFloat(column) * columnWidth)
    }
 
    // Создаем переменную, отвечающую за количество колонок по дефолту 0.
    var column = 0
 
    // Создаем контейнер, который будет хранить данные смещения по оси Y и инициализируем его, устанавливая центр по Y как 0.0 для каждой колонки.
    var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
 
    // В цикле перебираем каждый Item
    for item in 0..<collectionView.numberOfItems(inSection: 0) {
      // Берем индекс каждого Item в конкретной секции, у нас это 0
      let indexPath = IndexPath(item: item, section: 0)
 
      // Создаем константу, которая будет хранить данные каждого загруженного изображения.
      let imageSize = delegateLayout?.collectionView(collectionView, heightForImageAtIndexPath: indexPath)
 
      // Создаем константу с шириной ячейки и присваиваем ширину колонки, в которой будет располагаться ячейка (то есть за основу берем ширину колонки).
      let cellWidth = columnWidth
 
      // Создаем переменную, отвечающую за высоту ячейки, и присваиваем ей вычисляемое значение, как:
      var cellHeight = imageSize!.height * cellWidth/imageSize!.width
 
      // Дополняем полученное ранее значение (сделано, чтобы не загромождать код выше математическими вычислениями).
      cellHeight = cellPadding * 2 + cellHeight
 
      // Создаем константу, которая будет хранить все вычисленные значения.
      let frame = CGRect(x: xOffset[column],
                         y: yOffset[column],
                         width: cellWidth,
                         height: cellHeight)
      // Создаем константу, которая будет хранить отступы по оси X и Y (отступы между самими ячейками)
      let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
 
      // Создаем константу, которая будет собирать все данные на каждую ячейку по индексу и работать с ними.
      let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
 
      // Добавляем во фрейм дополнительные отступы между ячейками.
      attributes.frame = insetFrame
 
      // Собираем полученные при помощи вычислений данные в хранилище.
      cache.append(attributes)
 
      // Сравнение величин между собой, устанавливается наибольшее из двух (если contentHeight будет больше frame.maxY, то значение будет взято из высоты контента, в противном случае из фрейма)
      contentHeight = max(contentHeight, frame.maxY)
 
      // Выравниваем все изображения по колонкам, учитывая их размеры и отступы
      yOffset[column] = yOffset[column] + cellHeight
 
      // Распределяем контент по колонкам, что в первую, что во вторую.
      column = column < (numberOfColumns - 1) ? (column + 1) : 0
    }
  }
 
  //Переопределяем метод. Представление коллекции вызывает его после prepare (), чтобы отобразить те элементы, которые будут выводиться в конкретной ячейке.
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
 
    //    Здесь перебираем атрибуты в кэше и проверяем, пересекаются ли их фреймы с прямоугольником, предоставляемым представлением коллекции.
    for attributes in cache {
      if attributes.frame.intersects(rect) {
 
        //    Вы добавляете атрибуты с фреймами, которые пересекаются с этим прямоугольником, в visibleLayoutAttributes, который будет возвращаться в представление коллекции.
        visibleLayoutAttributes.append(attributes)
      }
    }
    return visibleLayoutAttributes
  }
 
//  Здесь извлекаем и возвращаем из кэша атрибуты макета, которые соответствуют запрошенному indexPath.
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return cache[indexPath.item]
  }
}



