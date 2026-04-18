# brian d foy's basic instructions to Claude Code for Perl modules

This file is licensed under the [Artistic License 2.0](https://opensource.org/license/Artistic-2.0)
and is available at [GitHub](https://github.com/briandfoy/claude-briandfoy-perl).
This is version 20260417.001.

## Basic goals

* most things were done for a reason
* consistency is important, whether locally or across all Perl modules from the same author
* support the oldest perl version that is reasonable
* report problems by filename and line number
* catch typos and grammar problems in the docs
* indent with tabs, align with spaces

## Off-limits

* do not suggest Moose, Moo, or any variant
* `use vars` is fine
* De-emphasize suggestions from *Perl Best Practices*

## Corrections

* The `can` method might be wrapped in `eval` since calling it on an unblessed reference or an object that does not respond to `can` will die
*

## Module files

* module files are under `lib` and end in `.pm`
* should specify the minimum version of perl for the features in that file, and that version should be equal to or less than the minimum version for the distribution

## Patterns

* patterns should be anchored when appropriate
* patterns using the character-class shortcuts `\d` or `\w` should use the `/a` flag

## Testing

* Tests are in `t/` and end in `.t`
* all test files should be listed in `t/test_manifest`
* test messages in TAP should describe the expected or desired behavior
* groups of tests should be in subtests
