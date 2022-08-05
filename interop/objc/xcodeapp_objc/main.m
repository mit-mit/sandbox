//
//  main.m
//  cmdline
//
//  Created by Michael Thomsen on 03/08/2022.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSTimeZone *timezone = [NSTimeZone systemTimeZone];
        NSLog(@"Timezone name: %@", timezone.name);
        NSLog(@"Timezone offset GMT: %ld hours", timezone.secondsFromGMT/60/60);
        
        timezone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        NSLog(@"Timezone name: %@", timezone.name);
        NSLog(@"Timezone offset GMT: %ld hours", timezone.secondsFromGMT/60/60);
    }
    return 0;
}
