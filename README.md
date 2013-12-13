## Balanced API Specification

[![Build Status](https://travis-ci.org/balanced/balanced-api.png?branch=revision1)](https://travis-ci.org/balanced/balanced-api)

This repository contains an executable specification of the Balanced API. The
goal of this repository is two-fold. First, to ensure that the API is working
according to the spec. Second, to provide a place to have discussions around
the API as a product.

### An Executable Specification

Specifications don't matter if they're not followed. Therefore, this
specification is executable, so we can ensure conformance to the spec. There are
more details in the README file inside the `features` directory, but to run these
tests yourself, simply:

```bash
$ git clone https://github.com/balanced/balanced-api.git
$ cd balanced-api
$ bundle
$ bin/rake cucumber
```

This requires Ruby. We run the changes with Ruby 2.0, but other versions will
probably work as well. [Let us
know](https://github.com/balanced/balanced-api/issues/new) if you have any
problems running these specs, and we'd be happy to help.

### Discussions around changes

Speaking of issues, that's the second purpose of this repository. If you would
like to see a new feature implemented in the Balanced API, please [open an
issue](https://github.com/balanced/balanced-api/issues/new) and we'll discuss
it.

For example, one of our biggest requests is to support non-USD currencies.
[Here](https://github.com/balanced/balanced-api/issues/23) is the issue with
the discussion, and when we support this feature, we close the issue via a pull
request that implements the specification, and then everyone on the issue gets
notified.

Sometimes, Issues are great for collecting feedback, as well. For example,
[all implementation of the current framework was done via
PR](https://github.com/balanced/balanced-api/pull/431), and some issues need
more explanation around use cases by those who want the feature, like [Bitcoin
support](https://github.com/balanced/balanced-api/issues/204).

We try to do as much 'internal' discussion in these issues as well, it's not
just for public feedback. If you want to know what we're thinking, just search
for a relevant issue!
