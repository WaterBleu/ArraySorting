//
//  main.m
//  ArraySorting
//
//  Created by Jeff Huang on 2015-07-07.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSArray* arr = @[@"eeeeeAAbfdf",
                        @"Everything",
                        @"news to me",
                        @"timepiece",
                        @"egg",
                        @"eggs",
                        @"paper",
                        @"e",
                        @"facebook",
                        @"painting",
                        @"231 thurlow st",
                        @"99 bottles"];
        
        static NSStringCompareOptions compareOption = NSForcedOrderingSearch | NSCaseInsensitiveSearch | NSNumericSearch;

        NSComparator compareAlphabetSortBlock = ^(id s1, id s2) {
            NSRange s1Range = NSMakeRange(0, [s1 length]);
            return [s1 compare:s2 options:compareOption range:s1Range];
        };
        
        compareOption = NSCaseInsensitiveSearch | NSNumericSearch;
        
        NSComparator compareLengthSortBlock = ^(id s1, id s2){
            NSRange s1Range = NSMakeRange(0, [s1 length]);
            NSRange s2Range = NSMakeRange(0, [s2 length]);
            if(s1Range.length > s2Range.length)
                return NSOrderedDescending;
            else if(s1Range.length < s2Range.length)
                return NSOrderedAscending;
            else
                return NSOrderedSame;
        };
        
        NSComparator compareLastCharSortBlock = ^(id s1, id s2){
            NSRange s1Range = NSMakeRange(0, [s1 length]);
            NSRange s2Range = NSMakeRange(0, [s2 length]);
            if([s1 characterAtIndex:s1Range.length - 1] > [s2 characterAtIndex:s2Range.length - 1])
                return NSOrderedDescending;
            else if([s1 characterAtIndex:s1Range.length - 1] < [s2 characterAtIndex:s2Range.length - 1])
                return NSOrderedAscending;
            else
                return NSOrderedSame;
        };
        
        NSComparator compareOccurenceESortBlock = ^(id s1, id s2){
            NSMutableString *ms1 = [s1 mutableCopy];
            NSMutableString *ms2 = [s2 mutableCopy];
            int s1Occur = (int)[ms1 replaceOccurrencesOfString:@"e" withString:@"#" options:compareOption range:NSMakeRange(0, [ms1 length])];
            int s2Occur = (int)[ms2 replaceOccurrencesOfString:@"e" withString:@"#" options:compareOption range:NSMakeRange(0, [ms2 length])];
            if(s1Occur > s2Occur)
                return NSOrderedDescending;
            else if(s1Occur < s2Occur)
                return NSOrderedAscending;
            else
                return NSOrderedSame;
        };
        
        NSArray *alphaSortArray = [arr sortedArrayUsingComparator:compareAlphabetSortBlock];
        NSArray *lengthSortArray = [arr sortedArrayUsingComparator:compareLengthSortBlock];
        NSArray *lastCharSortArray = [arr sortedArrayUsingComparator:compareLastCharSortBlock];
        NSArray *occurenceESortArray = [arr sortedArrayUsingComparator:compareOccurenceESortBlock];
        
        NSLog(@"alphSortArray: %@", alphaSortArray);
        NSLog(@"lengthSortArray: %@", lengthSortArray);
        NSLog(@"lastCharSortArray: %@", lastCharSortArray);
        NSLog(@"occurenceESSortArray: %@", occurenceESortArray);
        
        
    }
    return 0;
}
