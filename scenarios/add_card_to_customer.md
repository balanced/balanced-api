# POST /customers

+ Request (application/json)

    + Body

            {
                 "name": "some name"
            }

+ Response 201 (application/json)

     + Body

            {}

     + Schema

            { "$ref": "../responses/customers.json" }


# POST /cards

+ Request (application/json)

        {
            "number": "4111111111111111",
            "month": 12,
            "year": 2016
        }

+ Response 201 (application/json)

    + Body

            {}

    + Schema

            { "$ref": "../responses/cards.json" }

# POST {0,customers.cards}

+ Request (application/json)

        {
            "href": "{1,cards.href}"
        }

+ Response 201 (application/json)

    + Schema

            { "$ref": "../responses/cards.json" }

    + Body

            {
                "cards": [ { "links": { "customers": "{0,customers.href}" } } ]
            }
