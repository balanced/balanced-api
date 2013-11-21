## Balanced-api responses directory

This directory defines the form of all the possible responses from the balanced api.

### Example response
``` json
  {
   "customers": [
    {
     "name": "Balanced testing",
     "links": {
      "source": null,
      "destination": null
     },
     "created_at": "2013-08-16T03:19:00.112349Z",
     "dob_month": null,
     "merchant_status": "no-match",
     "updated_at": "2013-08-16T03:19:00.112350Z",
     "phone": null,
     "href": "/customers/CU4CQ5MkeOIuxwL2IGI4I2RG",
     "meta": {},
     "dob_year": null,
     "email": null,
     "address": {
      "city": null,
      "line2": null,
      "line1": null,
      "state": null,
      "postal_code": null,
      "country_code": null
     },
     "business_name": null,
     "ssn_last4": null,
     "id": "CU4CQ5MkeOIuxwL2IGI4I2RG",
     "ein": null
    }
   ],
   "links": {
    "customers.source": "/cards/{customers.source}",
    "customers.card_holds": "/customers/{customers.id}/card_holds",
    "customers.cards": "/customers/{customers.id}/cards",
	"customers.debits": "/customers/{customers.id}/debits",
    "customers.destination": "/cards/{customers.destination}",
    "customers.bank_accounts": "/customers/{customers.id}/bank_accounts",
    "customers.transactions": "/customers/{customers.id}/transactions",
    "customers.refunds": "/customers/{customers.id}/refunds",
    "customers.reversals": "/customers/{customers.id}/reversals",
    "customers.orders": "/customers/{customers.id}/orders",
    "customers.credits": "/customers/{customers.id}/credits"
   }
  }
```

### Layout of files
  * The files in this directory are for validating the full response with the response envelope
  * The files in the _models directory are for validating the individual object contained in the `[resource]s` array
