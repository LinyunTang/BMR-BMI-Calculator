
#import "Anagram.h"
#import "NSString+KeyWordExtension.h"

@implementation Anagram
@synthesize originalString;
@synthesize key;

-(Anagram*) initWithWord: (NSString*) aWord
{
  self = [super init];
  if(self){
    self.originalString = aWord;
    self.key = [aWord key];
  }
  return self;
}

-(NSComparisonResult) compare: (Anagram*) otherWord
{
  return [self.key compare: otherWord.key];
}

-(NSString*) description
{
  return [NSString stringWithFormat: @"%@ %@", self.originalString, self.key];
}


@end