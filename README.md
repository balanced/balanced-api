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

