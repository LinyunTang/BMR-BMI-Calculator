
#import "Anagram.h"
#import "NSString+KeyWordExtension.h"

#import <Foundation/Foundation.h>

void chomp(char *s){
  int i = 0;
  while( s[i] != '\0' ){
    if(s[i] == '\n'){
      s[i] = '\0';
      break;  
    }
    i++;
  }
}

int main(int argc, char **argv){
  @autoreleasepool{
    char buffer[256];
    int max = -1;
    int index = -1;
    int difference;
    
    FILE *fh = fopen(argv[1], "r");
    assert(fh);

    NSMutableArray* list = [[NSMutableArray alloc] init];
    while( fgets(buffer, 256, fh) != NULL){
      chomp(buffer);
      [list addObject: [[Anagram alloc] initWithWord:[NSString stringWithCString: buffer encoding: NSASCIIStringEncoding]]];
    }

    NSArray* words = [list sortedArrayUsingSelector: @selector(compare:)];

    int i = 0;
    int j = 1;
    while(i < [words count] - 1 && j < [words count]){
      if( [[words objectAtIndex: i] compare: [words objectAtIndex: j]] == NSOrderedSame){
        j++;
      }else{
        difference = j - i;
        if( difference > max){
          max = difference;
          index = i;
        }
        i = j;
        j++;
      }
    }
    difference = j - i;
    if( difference > max){
      max = difference;
      index = i;
    }

    NSLog(@"max: %d", max);
    for(int i = 0; i < max; i++ ){
      NSLog(@"%@", [[words objectAtIndex: index + i] description]);
    }

  }
  return 0;
}