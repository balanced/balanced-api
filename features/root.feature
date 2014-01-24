Feature: Root resource
  The root resource is kind of funny, because while it's one of the simplest,
  it's also one of the most important.

  This is where all hypermedia style interaction begins from. Right now it's
  not that way, but it will be at some point.

  Scenario: Request the root resource
    The primary interaction with the root is to fetch it.

    When I make a GET request to /
    Then I should get a 200 status code
