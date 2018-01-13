//
//  AppPath.swift
//  GodEye
//
//  Created by 林鸿彬 on 2018/1/13.
//  Copyright © 2018年 zixun. All rights reserved.
//

import Foundation

/**
 * Create a path with the given bundle and the relative path appended.
 *
 * @param bundle        The bundle to append relativePath to. If nil, [NSBundle mainBundle]
 *                           will be used.
 * @param relativePath  The relative path to append to the bundle's path.
 *
 * @returns The bundle path concatenated with the given relative path.
 */
public func AppPathForBundleResource(bundle: Bundle?, relativePath: String) -> String {
    let resourcePath = (bundle == nil ? Bundle.main : bundle)!.resourcePath!
    
    return (resourcePath as NSString).appendingPathComponent(relativePath)
}

/**
 * Create a path with the documents directory and the relative path appended.
 *
 * @returns The documents path concatenated with the given relative path.
 */
public func AppPathForDocumentsResource(relativePath: String) -> String {
    return documentsPath.appendingPathComponent(relativePath)
}

/**
 * Create a path with the Library directory and the relative path appended.
 *
 * @returns The Library path concatenated with the given relative path.
 */
public func AppPathForLibraryResource(relativePath: String) -> String {
    return libraryPath.appendingPathComponent(relativePath)
}

/**
 * Create a path with the caches directory and the relative path appended.
 *
 * @returns The caches path concatenated with the given relative path.
 */
public func AppPathForCachesResource(relativePath: String) -> String {
    return cachesPath.appendingPathComponent(relativePath)
}


/**
 * Create a path with the ApplicationSupport directory and the relative path appended.
 *
 * @returns The caches path concatenated with the given relative path.
 */
public func AppPathForApplicationSupportResource(relativePath: String) -> String {
    return applicationSupportPath.appendingPathComponent(relativePath)
}

/// 将document目录作为常量保存起来，提高访问性能
private let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                .userDomainMask,
                                                                true).first! as NSString

/// 将library目录作为常量保存起来，提高访问性能
private let libraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory,
                                                              .userDomainMask,
                                                              true).first! as NSString

/// 将caches目录作为常量保存起来，提高访问性能
private let cachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory,
                                                             .userDomainMask,
                                                             true).first! as NSString

/// 将applicationSupport目录作为常量保存起来，提高访问性能
private let applicationSupportPath = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory,
                                                                         .userDomainMask,
                                                                         true).first! as NSString
