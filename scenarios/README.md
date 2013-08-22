## Balanced-api scenarios directory

This directory contains all the scenarios that defined how the api is suppose to interact.

### Simple example scenario
``` yaml
scenarios:
  - name: customer                                 # Every scenario has a name that can be used to reference it in other scenarios
    request:
      method: POST
      href: /customers
      schema:                                      # The request is validated against the request json schema
        "$ref": "../requests/customer.json"
      body: {                                      # The contents of the the request
        "name": "Balanced testing"
      }
    response:
      status_code: 201                             # status_code validated the returned status code
      schema:                                      # response schema to validate response against
        "$ref": "../responses/customers.json"
```


### More complex scenario
``` yaml
require:                                           # scenarios can require the result from other files
  - ../card_fixtures.yml
  - ../customer_fixtures.yml
scenarios:
  - name: add_card_to_customer
    request:
      method: PATCH
      href: "{card,cards.href}"                    # the results of the other scenarios can be referenced using {scenario_name,resource_name.field_on_resource}
      schema:
        "$ref": "requests/_patch.json"
      body: [{
        "op": "replace",
        "path": "/cards/0/links/customer",
        "value": "{customer,customers.id}"         # referencing other scenarios can also be used in request bodies
      }]
    response:
      schema:
        "$ref": "responses/cards.json"
      matches: { "cards": [ { "links": { "customer": "{customer,customers.id}" } } ] }   # matches assert that a field in the response is equal
```


## Additional notes about scenarios
  * required scenarios only run once at the beginning of the file
  * scenarios in a file are run sequentially, the file will stop on the first scenario to fail
  * when referencing other scenarios by name, the most recent scenario with that name is references (you can overwrite the result of a scenario)
  * all required files are isolated from each other (eg, if both files require a customer scenario, then two different customers will be created.  Additionally "{customer,customers.href}" will reference the last customer scenario)
  * matches in the response will assert that the field in the response and the value given are equal
  * assertIn in the response will assert that the field in the response contains the value that is asserted
  * all paths are relative or from the root of this repository
