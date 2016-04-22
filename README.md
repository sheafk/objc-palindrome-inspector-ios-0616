# Palindrome Inspector

## Objectives

1. Use a familiar problem to introduce yourself to Xcode's testing interface.
2. Compare the "expected" versus the "got" of each test failure to gain insight towards how to solve the problem.
3. Solve the problem step by step, relying on the tests to ensure yourself of forward progress.
4. Verify that Learn detected your successful solution by looking at the "Local Build" light.

## Introduction

Instead of relying on `NSLog()` statements to inspect our palindrome detector, let's rely on a testing suite that uses Specta and Expecta! The test file is already set up for you with the test strings and the method calls. You'll have to write out the method implementations a second time, but now you'll have the test failures and successes to guide you instead of doing it yourself from the `application:didFinishLaunchingWithOptions:` methods.

## Instructions

Fork and clone this lab.

Open the `objc-palindrome-inspector.xcworkspace` file. **Note:** *This is the workspace, not the project. The workspace contains a second project that holds the testing library that we use.*

1 — Try to run the tests with `⌘` `U`. You should experience a build failure that generates a collection of errors because of missing method definitions.

![](https://curriculum-content.s3.amazonaws.com/ios/ios-objc-fundamentals-unit/palindrome_no_method_errors.png)

Don't panic! This is because the test file `FISAppDelegateSpec.m` is looking for the methods that you're going to write. Objective-C doesn't have a `NoMethodError` like some other languages such as Ruby, so instead the pre-compiler simply keeps the build from succeeding in order to avoid a definite crash. The fix for this is simple: write the methods the test file is instructed to call!

2 — Navigate to the `FISAppDelegate.h` header file and declare the same two methods from the previous lab:

  * `stringIsPalindrome:` which takes one `NSString` argument called `string` and returns a `BOOL`, and
  * `stringByReversingString:` which takes one `NSString` argument called `string` and returns an `NSString`.

3 — Now, navigate to the `FISAppDelegate.m` implementation file and use autocomplete to define the implementation of `stringIsPalindrome:` to `return NO;` and the implementation of `stringByReversingString:` to `return nil;`.

4 — You should now be able to run the tests with `⌘` `U`. You should see that most of the tests fail (the ones that succeed are negative checks). These are *test failures*, **not** errors, and are marked with a red diamond containing an "x". Successes are marked with a green diamond containing a check mark.

![](https://curriculum-content.s3.amazonaws.com/ios/ios-objc-fundamentals-unit/palindrome_test_failures.png)

You can (temporarily) drag the Navigator area's pane out to the right in order to view the descriptions of each test, which can sometimes be rather long. Unfortunately there is not a way to get Xcode to wrap this text to a new line in the Navigator area so dragging the pane to be wider is common practice.

Alternatively, you can view the test results in the Results navigator by clicking on the right-most symbol in the top of the Navigator area:

![](https://curriculum-content.s3.amazonaws.com/ios/ios-objc-fundamentals-unit/palindrome_results_navigator.png) 

**Note:** *The Results navigator is useful for comparing long test results that do not fit into the highlighted flags that appear in the Code Editor when viewing a test file.*

5 — Insert the provided implementation for the `stringByReversingString:` method which returns a string that is the reverse of the argument string:

```objc
- (NSString *)stringByReversingString:(NSString *)string {
    
    NSString *result = @"";
    
    for (NSUInteger i = [string length]; i > 0; i--) {
        NSUInteger index = i - 1;
        unichar c = [string characterAtIndex:index];
        result = [result stringByAppendingFormat:@"%c", c];
    }
    
    return result;
}
```

Run the tests again with `⌘` `U`. You should see the tests for this method succeed and their lights turn to green check marks:

![](https://curriculum-content.s3.amazonaws.com/ios/ios-objc-fundamentals-unit/palindrome_test_successes.png)

6 — Now, solve the `stringIsPalindrome:` method step-by-step, relying on the testing suite to check each portion of the problem. Avoid copy/pasting your code from the code-along; try to rely on the tests to help you solve a familiar problem. Only reference the code-along if you get stuck. Remember, the initial steps to detect a single-word, all-lowercase palindrome is to:

  * reverse the string,
  * compare the original string to its reverse, and
  * return the result of the comparison.

Correctly implementing these steps should allow the `stringIsPalindrome__returns_YES_for_the_palindrome_racecar` test to pass without causing any of the four passing tests to fail.

7 — Add functionality to the `stringIsPalindrome:` method to handle uppercase strings. This should allow the tests using the palindromes "Bob", "Kanakanak", and "Aibohphobia" to pass without causing any of the other five passing tests to fail.

8 — Add functionality to the `stringIsPalindrome:` method to handle a palindrome phrase by removing the spaces from the string being checked. This should allow the tests using the palindrome phrases "never odd or even" and "I prefer pi" to pass without causing any of the other eight passing tests to fail.

9 — Add functionality to the `stringIsPalindrome:` method to handle a palindrome sentence by removing punctuation from the string being checked. **Hint:** *This step requires a loop.* It should allow the tests using the palindrome sentences "Flee to me, remote elf."; "Norma is as selfless as I am, Ron."; and "No sir! Away! A papaya war is on!" to pass without causing any of the other ten tests to fail.

10 — At this point all thirteen of the tests should be passing:

![](https://curriculum-content.s3.amazonaws.com/ios/ios-objc-fundamentals-unit/palindrome_all_pass.png)

Congratulations! You have solved your first tested lab. Your "local build" light in Learn should now be green:

![](https://curriculum-content.s3.amazonaws.com/ios/ios-objc-fundamentals-unit/palindrome_local_build_green.png)

Commit and push your solution to your remote fork. On GitHub, open a pull request to complete the lab.
<p data-visibility='hidden'>View <a href='https://learn.co/lessons/objc-palindrome-inspector' title='Palindrome Inspector'>Palindrome Inspector</a> on Learn.co and start learning to code for free.</p>

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/objc-palindrome-inspector'>Palindrome Inspector</a> on Learn.co and start learning to code for free.</p>
