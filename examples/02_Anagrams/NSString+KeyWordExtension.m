
#import "NSString+KeyWordExtension.h"

@implementation NSString (KeyWordExtension)

-(NSString*) key
{
  NSUInteger length = [self length];
  unichar *chars = (unichar *)calloc(sizeof(unichar), length);

  [self getCharacters: chars range: NSMakeRange(0, length)];
  
  qsort_b(chars, length, sizeof(unichar), ^(const void *l, const void *r) {
    unichar left = *(unichar *)l;
    unichar right = *(unichar *)r;
    return (int)(left - right);
  });

  NSString *sorted = [NSString stringWithCharacters:chars length:length];

  free(chars);

  return sorted;
  
}

@end