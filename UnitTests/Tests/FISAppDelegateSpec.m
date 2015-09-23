//  FISAppDelegateSpec.m
//  objc-palindrome-inspector

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISAppDelegate.h"


SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    
    __block FISAppDelegate *appDelegate;
    
    beforeEach(^{
        appDelegate = [[FISAppDelegate alloc] init];
    });
    
    describe(@"stringByReversingString:", ^{
        it(@"returns the reversed string 'emordinlap' when the argument string is 'palindrome'", ^{
            NSString *palindrome = @"palindrome";
            NSString *reverse = @"emordnilap";
            
            expect([appDelegate stringByReversingString:palindrome]).to.equal(reverse);
        });
        
        it(@"does not remove capitalization or punctuation when reversing a string containing a sentence", ^{
            NSString *papayaWar = @"No sir! Away! A papaya war is on.";
            NSString *reverse = @".no si raw ayapap A !yawA !ris oN";
            
            expect([appDelegate stringByReversingString:papayaWar]).to.equal(reverse);
        });
    });
    
    describe(@"stringIsPalindrome:", ^{
        it(@"returns 'NO' for the word 'palindrome'", ^{
            NSString *palindrome = @"palindrome";
            
            expect([appDelegate stringIsPalindrome:palindrome]).to.beFalsy();
        });
        
        it(@"returns 'YES' for the palindrome 'racecar'", ^{
            NSString *racecar = @"racecar";
            
            expect([appDelegate stringIsPalindrome:racecar]).to.beTruthy();
        });
        
        it(@"returns 'YES' for the palindrome 'Bob'", ^{
            NSString *bob = @"Bob";
            
            expect([appDelegate stringIsPalindrome:bob]).to.beTruthy();
        });
        
        it(@"returns 'YES' for the palindrome 'Kanakanak'", ^{
            NSString *kanakanak = @"Kanakanak";
            
            expect([appDelegate stringIsPalindrome:kanakanak]).to.beTruthy();
        });

        it(@"returns 'YES' for the palindrome 'Aibohphobia'", ^{
            NSString *aibohphobia = @"Aibohphobia";
            
            expect([appDelegate stringIsPalindrome:aibohphobia]).to.beTruthy();
        });
        
        it(@"returns 'NO' for the regular phrase 'this is not a palindrome'", ^{
            NSString *notAPalindrome = @"this is not a palindrome";
            
            expect([appDelegate stringIsPalindrome:notAPalindrome]).to.beFalsy();
        });
        
        it(@"returns 'YES' for the palindrome phrase 'never odd or even'", ^{
            NSString *neverOdd = @"never odd or even";
            
            expect([appDelegate stringIsPalindrome:neverOdd]).to.beTruthy();
        });
        
        it(@"returns 'YES' for the palindrome phrase 'I prefer pi'", ^{
            NSString *iPreferPi = @"I prefer pi";
            
            expect([appDelegate stringIsPalindrome:iPreferPi]).to.beTruthy();
        });
        
        it(@"returns 'YES' for the palindrome sentence 'Flee to me, remote elf.'", ^{
            NSString *fleeToMe = @"Flee to me, remote elf.";
            
            expect([appDelegate stringIsPalindrome:fleeToMe]).to.beTruthy();
        });
        
        it(@"returns 'YES' for the palindrome sentence 'Norma is as selfless as I am, Ron.'", ^{
            NSString *norma = @"Norma is as selfless as I am, Ron.";
            
            expect([appDelegate stringIsPalindrome:norma]).to.beTruthy();
        });
        
        it(@"returns 'YES' for the palindrome sentence 'No sir! Away! A papaya war is on.'", ^{
            NSString *papayaWar = @"No sir! Away! A papaya war is on.";
            
            expect([appDelegate stringIsPalindrome:papayaWar]).to.beTruthy();
        });
    });
});

SpecEnd
