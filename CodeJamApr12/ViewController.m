//
//  ViewController.m
//  CodeJamApr12
//
//  Created by paul on 4/12/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //@autoreleasepool{
   NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
 
    
#pragma mark NSArray
//    Please, find your tasks on NSArray and NSMutableArray bellow:
//
//    Create NSArray, containing several strings, using literal declaration.

    NSArray *usingStringLiterals = @[@"first", @"second", @"third", @"fourth"];
//    Create mutable array from piviously created NSArray.
    
    NSMutableArray *mutableFromNSArray= [NSMutableArray arrayWithArray:usingStringLiterals];
    
//    Create an empty array and obtain its first and last element in a safe way.
    NSArray *emptyArray = [[[NSArray alloc] init] autorelease];
    [emptyArray firstObject];
    [emptyArray lastObject];
   
//    Create NSArray, containing strings from 1 to 20:
    [mutableFromNSArray removeAllObjects];
    for (int i=1; i<=20; i++) {
        [mutableFromNSArray addObject:[NSString stringWithFormat:@"%d", i ]];
    }
    
    NSArray *arrayOfStringsFromOneTillTwenty = [ NSArray arrayWithArray:
                                                mutableFromNSArray ];

//    Get its shallow copy and real deep copy.
    //shallow copy
    NSArray *shallowCopy = [NSMutableArray arrayWithArray:arrayOfStringsFromOneTillTwenty];
    // real deep copy
        NSArray *deepCopy = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver
                            archivedDataWithRootObject:arrayOfStringsFromOneTillTwenty]];
 
    

//    Iterate over array and obtain item at index 13. Print an item.
    for (int i=0; i<deepCopy.count; i++) {
            if (i==13) {
                NSLog(@"%@", deepCopy[i]);
                break;
        }
    }
//    Make array mutable. Add two new entries to the end of the array, add an entry to the
        //beginning of the array. Iterate over an array and remove item at index 5.
    arrayOfStringsFromOneTillTwenty = [arrayOfStringsFromOneTillTwenty mutableCopy];
    
        //Add two new entries to the end of the array
    [(NSMutableArray*) arrayOfStringsFromOneTillTwenty addObject:@"21"];
    [(NSMutableArray*) arrayOfStringsFromOneTillTwenty addObject:@"22"];
    [(NSMutableArray*) arrayOfStringsFromOneTillTwenty insertObject:@"0" atIndex:0];
    
        // Iterate over an array and remove item at index 5.
    for (int i= 0; i<arrayOfStringsFromOneTillTwenty.count; i++) {
        if(i==5){
            [(NSMutableArray*)arrayOfStringsFromOneTillTwenty  removeObjectAtIndex:i];
            break;
        }
    }
    
    
//    Create new array of mixed numbers. Sort it in an ascending and descending order.
//
    NSMutableArray *mixedNumbers = [NSMutableArray arrayWithCapacity:10];
    
    for (int i=0; i<10; i++ ) {
        mixedNumbers[i]=[NSNumber numberWithInteger:arc4random()%100];
    }
    
//    Sort it in an ascending
    NSArray *sortedAcsending = [mixedNumbers sortedArrayUsingSelector:@selector(compare:)];

    //    Sort it in an descending
        NSArray *sortedDescending = [mixedNumbers sortedArrayUsingComparator:
                                     ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            
           return [obj2 compare:obj1];
        }];
    [arrayOfStringsFromOneTillTwenty release];
       [pool release];
        //[pool dealloc];
    
#pragma mark NSDictionary
    NSAutoreleasePool *pool1 = [[NSAutoreleasePool alloc] init];
//        Please, find your tasks on NSDictionary and NSMutableDictionary bellow:
//
//        Create NSDictionary using literal declaration.
        NSDictionary *dictionaryUsingLiteral = @{@"0": @"NullNumber",
                                                 @"1": @"One",
                                                 @"2": @"Two",
                                                 @"3": @"Three",
                                                 @"4": @"Four",
                                                 @"5": @"Five",
                                                 };

//        Make it mutable and add several new entries.
          dictionaryUsingLiteral = [dictionaryUsingLiteral mutableCopy];
        [(NSMutableDictionary *) dictionaryUsingLiteral setObject:@"SixMutable" forKey:@"6"];
        [(NSMutableDictionary *) dictionaryUsingLiteral setObject:@"SevenMutable" forKey:@"7"];
      
//        Sort it in an ascending and descending order.
//        ascending
        NSMutableArray *tempArrayForSortingDictionary = [[dictionaryUsingLiteral allKeys]
        sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
        
        void(^printDictionaryByOrderedKeysBlock)(NSArray*,NSDictionary*)=^(NSArray* array,
                                                                           NSDictionary* dictionary)
    {
            for (NSString *key in array)
            {
                NSLog(@"%@ = %@", key, [dictionary objectForKey:key]);
            };
        };
        printDictionaryByOrderedKeysBlock(tempArrayForSortingDictionary, dictionaryUsingLiteral);
        
        printDictionaryByOrderedKeysBlock([[tempArrayForSortingDictionary reverseObjectEnumerator]
                                           allObjects], dictionaryUsingLiteral);
        
        
        //        Check whether required value is contained in the dictionary.
        __block id testValue =@"blbablabla";
        
        void(^testIfInTheDictionaryBlock)(void)=^{
            if ([[dictionaryUsingLiteral allKeysForObject:testValue] firstObject]) {
                NSLog(@"%@ is in the dictionary", testValue);
            } else{
                NSLog(@"There no such value as %@", testValue);
            }
        };
        
        testIfInTheDictionaryBlock();
        

        testValue = @"Three";
        testIfInTheDictionaryBlock();
  
    [dictionaryUsingLiteral release];
    [pool1 release];
#pragma mark NSSet
    NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
//        Please, find your tasks on NSSet and NSMutableSet bellow:
//        Create NSArray, containing 30 objects. Add duplicates to array.
         
        
        mutableFromNSArray = [NSMutableArray arrayWithCapacity:30];
        for (int i=0; i<30; i++) {
            [mutableFromNSArray addObject:[NSNumber numberWithInt:i]];
        }
        

      
        [mutableFromNSArray addObjectsFromArray:mutableFromNSArray ];
        NSArray *arrayForNSSetTask =  [NSArray arrayWithArray:mutableFromNSArray];
    
        

//      Use NSSet to exclude duplicates from array.
        
        NSSet* setForTask = [NSSet setWithArray:arrayForNSSetTask];
        
//      Check what is faster: Create an array of 100 numbers. Check whether number 74 is contained
//      inside an array. Transform array into NSSet and check whether number 74 is contained inside
//NSSet.
        [mutableFromNSArray removeAllObjects];
        mutableFromNSArray = [NSMutableArray arrayWithCapacity:100];
        for (int i=0; i<100; i++) {
            [mutableFromNSArray addObject:[NSNumber numberWithInt:i]];
        }
       

        NSDate *testDateArray= [NSDate date];
        [mutableFromNSArray containsObject:[NSNumber numberWithInt:74]];
        NSTimeInterval timeIntervalOfArray= [[NSDate date] timeIntervalSinceDate:testDateArray];
        
        
        
        mutableFromNSArray = [NSSet setWithArray:mutableFromNSArray];
        
        NSDate *testDateSet= [NSDate date];
        [(NSSet*)mutableFromNSArray containsObject:[NSNumber numberWithInt:74]];
        NSTimeInterval timeIntervalOfSet= [[NSDate date] timeIntervalSinceDate:testDateSet];
        
        if ([testDateArray compare: testDateSet]) {
            
            NSLog(@"Set is faster %.10f, < %.10f in %.2f times", timeIntervalOfSet,
                  timeIntervalOfArray, timeIntervalOfArray/timeIntervalOfSet);
        } else {NSLog(@"Array is faster %.10f, < %.10f in %.2f times", timeIntervalOfArray ,
                      timeIntervalOfSet, timeIntervalOfSet/timeIntervalOfArray);
            
        }
    
    [pool2 release];
#pragma mark NSPointerArray
    NSAutoreleasePool *pool3 = [[NSAutoreleasePool alloc] init] ;
    //Please, find your tasks on NSPointerArray bellow:
    
//    Create pointer array and add 10 objects inside.
    NSPointerArray* pointerArayForTask = [NSPointerArray weakObjectsPointerArray];
    NSArray *object0=[[[NSArray alloc] init] autorelease];
    NSArray *object1=[[[NSArray alloc] init] autorelease];
    NSArray *object2=[[[NSArray alloc] init] autorelease];
    NSArray *object3=[[[NSArray alloc] init] autorelease];
    NSArray *object4=[[[NSArray alloc] init] autorelease];
    NSArray *object5=[[[NSArray alloc] init] autorelease];
    NSArray *object6=[[[NSArray alloc] init] autorelease];
    NSArray *object7=[[[NSArray alloc] init] autorelease];
    NSArray *object8=[[[NSArray alloc] init] autorelease];
    NSArray *object9=[[[NSArray alloc] init] autorelease];
    
    [pointerArayForTask addPointer:object0];
    [pointerArayForTask addPointer:object1];
    [pointerArayForTask addPointer:object2];
    [pointerArayForTask addPointer:object3];
    [pointerArayForTask addPointer:object4];
    [pointerArayForTask addPointer:object5];
    [pointerArayForTask addPointer:object6];
    [pointerArayForTask addPointer:object7];
    [pointerArayForTask addPointer:object8];
    [pointerArayForTask addPointer:object9];
    

    
    
//    Check arrays count.
    
        NSLog(@"Pointer array Count = %ld", pointerArayForTask.count);
//    Nil several objects, added to the array and check count once again.
    
    object1=nil;
    object3=nil;
    
    NSLog(@"Pointer array after nilling of some objects Count = %ld", pointerArayForTask.count);
    [pool3 release];
    NSLog(@"");
        // Do any additional setup after loading the view, typically from a nib.
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
