# Ruby Shell Proxy

A ruby library to generate shell code for different shell implementations and platforms.

## Rationale

[RVM 1](https://github.com/wayneeseguin/rvm) was build using Bash/ZSH compatible code,
it was working for a long time but shell scripting is quite complicated.
Obviously it was working well only in Bash and ZSH, adapting more shells compatibility
would require a more complex codding or dropping features.

As a result a plan was made to use of [SMF](https://github.com/sm/sm) for internal code
and an library to translate pseudo code to different shells.
At this time ruby was not considered as an implementation language because of
the bootstrapping problem or as you could call it
[Chicken or the egg dilemma](http://en.wikipedia.org/wiki/Chicken_or_the_egg) -
how do you start ruby based tool for installing ruby.

But this changed thanks to three major factors, so first RVM got Binary Rubies introduced in
[RVM 1.16](https://www.engineyard.com/blog/2012/rvm-1-16/),
second [JRuby](http://jruby.org/) can be used as an fallback as it has an
additional dependency of JVM - but which is also available for great number of platforms,
last but not least [DRUG attendees](http://drug.org.pl/) pointed out this possibility.
With binary rubies it is possible to limit the bootstrapping script
to just unpacking archive with proper ruby package for given platform.

Because changing shell environment requires using it's internally loaded code to be executed
the new tool needs to allow generating shell code which then
can be evaluated on any target shell and platform configuration.
This is where `ruby-shell-proxy` comes into play to allow using Ruby DSL for writing shell code.
It should allow testing the code without actually having access to all the target shells.
It will also allow easy addition of more platforms as it's enough to describe the system
in terms of command configuration and not to rewrite whole application for the new system.

## Planned features

- define dsl that will be flexible enough to generate code for multiple shells and platforms
- allow forcing configuration shell/platform configuration
- provide auto-detection code that will automatic picking of proper proxy configuration
- provide local runners for the supported platforms
- provide remote runners for the supported platforms
- provide test suite that will ensure the generated code is compatible with given targets
- provide tool for probing new/unknown systems for compatibility
