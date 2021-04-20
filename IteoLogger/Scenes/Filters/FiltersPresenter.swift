//
//  FiltersPresenter.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//  Copyright (c) 2021 iteo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates by Patryk Średziński
//

import UIKit

protocol FiltersPresenter: IteoLoggerSpinnerPresenter, IteoLoggerAlertPresenter {
    func reloadFilters(_ filter: LogFilter,
                       availableModules: Set<IteoLoggerModule>,
                       availableLevels: Set<IteoLoggerLevel>)
}

final class FiltersPresenterImpl<T: FiltersPresentable>: IteoLoggerBasePresenter<T> {
    
}

extension FiltersPresenterImpl: FiltersPresenter {
    
    func reloadFilters(_ filter: LogFilter,
                       availableModules: Set<IteoLoggerModule>,
                       availableLevels: Set<IteoLoggerLevel>) {
        var dataSource = [FilterSectionItem]()
        dataSource.append(FilterSectionItem(type: .levels,
                                            items: availableLevels
                                                .sorted(by: { a, b in a.rawValue < b.rawValue })
                                                .map { FilterCellItem.level(item: $0, selected: filter.levels.contains($0))}))
        dataSource.append(FilterSectionItem(type: .modules,
                                            items: availableModules
                                                .sorted(by: { a, b in a.name < b.name })
                                                .map { FilterCellItem.module(item: $0, selected: filter.modules.contains($0))}))
        controller?.reloadFilter(dataSource: dataSource,
                                 toggleLevelsText: filter.levels.isEmpty ? "SELECT ALL" : "DESELECT ALL",
                                 toggleModulesText: filter.modules.isEmpty ? "SELECT ALL" : "DESELECT ALL")
    }
    
}