
#import <Foundation/Foundation.h>

@interface Anagram : NSObject

@property (strong) NSString* originalString;
@property (strong) NSString* key;

-(Anagram*) initWithWord: (NSString*) aWord;

-(NSComparisonResult) compare: (Anagram*) otherWord;

-(NSString*) description;

@end