[![Build Status](https://travis-ci.org/balanced/balanced-api.png?branch=revision1)](https://travis-ci.org/balanced/balanced-api)

Balanced API Spec
=================

Online marketplaces enable a new form of commerce at a scale that has never
existed before. The success of online marketplaces has the potential to
materially effect the global economy by creating new jobs and economic activity
that previously did not exist. Airbnb, Kickstarter, Etsy, and other
marketplaces have created new forms of income for businesses and individuals.
That's what gets the [Balanced](https://www.balancedpayments.com/) team excited
and what the [Balanced API](https://www.balancedpayments.com/docs/integration)
hopes to support.

Payments for marketplaces is unfortunately painful because of unique
requirements including paying sellers, payments aggregation policies, tax
ramifications, and fraud. Balanced lets you charge cards, escrow funds, and pay
sellers the next business day without the pain of building a payments system.

The primary goal of this repo is to create more openness behind the decisions
driving the designs and functionality of the Balanced API. We reached out to
existing and potential customers when designing the API, but that was a limited
set of people we already knew. We've received tremendous growth in the last few
months, and our new customers have great feedback or at least want to
understand the reasoning behind the original decisions.

We're going to automate validation of our API code against the specifications
in the repo. Any changes to the API can't be deployed unless they've been
merged into master first. Any merge to master will happen concurrently with
deploys of the API and the [docs](https://www.balancedpayments.com/docs). That
means the specs need to be auto generated (except for comments) instead of
handwritten to make sure the code and specs can never go out of sync.

We'll do our best to have even internal discussions online. All changes (even
by the Balanced team) to the specs must be submitted via pull request and can
only be merged in by @matin after giving the community a chance to comment on
the changes.


Running Tests
=============

```
$ bundle
$ bin/cucumber
```

This requires Ruby. We run the changes with Ruby 2.0, but other versions will
probably work as well. [Let us
know](https://github.com/balanced/balanced-api/issues/new) if you have any
problems running these specs, and we'd be happy to help.

If you're working on a new scenario, the 'focus' task is useful. Tag a scenario
with `@focus`, and then run `bin/rake focus`. It will only run that single scenario.

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
