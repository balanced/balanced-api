## Balanced API Spec: Technical details

Here's where the rubber hits the road.

### Background

We use [Cucumber](http://cucumber.io/) for features. What that means is that the
descriptions are in psuedo-English, which then gets mapped to code.

You can check out the specifications by looking at any of the files that end
with `.feature` in this directory. They look like this:

```
Feature: API Keys
  API Keys are what customers use to authenticate against the Balanced API.
  Generally speaking, this will be the first step that is needed to be taken by
  the customer to get started with the API.

  Scenario: List all API keys
    Customers can make as many keys as they'd like. Being able to see all of
    them is a good thing.

    Given I have created more than one API keys
    When I GET to /api_keys
    Then I should get a 200 OK status code
```

As you can see by the indentation, each file describes a 'feature.' There's
then some descriptive text about what that feature is and why it's important.
Features are a collection of 'scenarios,' which describe different things the
API can do. These scenarios also have some descriptive text as well. Scenarios
are made up of 'steps,' which start with "Given," "When," "Then," "And," and a
few others. These steps are actually executed by Cucumber: they run actual code.

That code is determined by the `step_definitions` files, which are in that
directory. They map these feature lines to actual Ruby code. For example,

```
When I GET to /api_keys
```

is mapped to

```
When(/^I (\w+) to (\/\S*?)$/) do |verb, url|
  options = {
    headers: {
      "Accept" => "application/vnd.api+json;revision=1.1",
    },
    basic_auth: {
        username: $api_secret,
        password: "",
    }
  }
  response = HTTParty.send(verb.downcase, "https://api.balancedpayments.com#{url}", options)
  @response_code = response.code
  @response_body = JSON.parse(response.body)
end
```

This is illustrative of why we're using Cucumber; if you're not a Rubyist, you
can probably follow the second bit, but it's full of details you just don't
care about. You care that you're making a GET to a certain URL, the rest of the stuff
is just noise.

There is also a `support` directory with some background code that's used to
set things up. You probably don't care about it.

### Running the tests

The tests are run via `rake`. Simply go to the root level of the repository, and run

```
$ bin/rake cucumber
```

to run the specs that are currently passing. To see all the tasks, 

```
$ bin/rake -T
```
