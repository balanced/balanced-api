## Endpoints

### Marketplace

    /:version/marketplaces
    - id
    - reserve: must be positive to perform credits. Same as in_escrow
    - balance: settled once per business day
    - bank_account
    - api_keys

### ACH Debit

    /:version/ach_debits
    - id
    - bank_account
    - amount
    - status: pending, cleared, rejected

### ACH Credit

    /:version/ach_credits
    - id
    - bank_account
    - amount
    - status: pending, cleared, rejected


### Bank Account

    /:version/bank_accounts
    - id
    - name
    - account_number
    - routing_number
    - type: savings, checking
    

## Examples

### Create an ACH Debit
Operations to create an ACH Debit or ACH Credit are the same

`POST /:version/ach_debits`

    {
        "bank_account": {
            "name": "Gottfried Leibniz",
            "account_number": "3819372930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
    }

### Check the status on an ACH Debit

`GET /:version/ach_debits/<ach_debits_id>`

    {
        "id": "<ach_debit_id>",
        "bank_account": {
            "id": <bank_account_id>,
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "pending"
    }

### Check the balance and amount in reserve for a marketplace

`GET /:version/marketplaces/<marketplace_id>`

    {
        "id": "<marketplace_id>",
        "reserve": 1984,
        "balance": -50,
        "bank_account": {
            "id": "<bank_account_id",
            "name": "Rent my bike",
            "account_number": "xxxxxx1129",
            "routing_number": "121042882",
            "type": "checking"
        },
        "api_keys": [<api_key_id>]
    }