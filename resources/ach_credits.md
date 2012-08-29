# ACH Credit

## Get an ACH credit

    GET /:version/ach_credits/:ach_credit_id

### Response

#### Header

    Status: 200 OK

#### Body

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "pending"
    }


## Get an ACH credit (deleted bank account)

    GET /:version/ach_credits/:ach_credit_id

### Response

#### Header

    Status: 200 OK

#### Body

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "cleared"
    }


## Create an ACH credit (new bank account)

    POST /:version/ach_credits

### Request

`amount`
: _required_ **integer**. Greater than zero

`bank_account`
: _required_ **object**. [Bank Account](./bank_accounts.md)


### Response

#### Header

    Status: 201 Created

#### Body

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "pending"
    }


## Create an ACH credit (existing bank account)

    POST /:version/bank_accounts/:bank_account_id/ach_credits

### Request

`amount`
: _required_ **integer**. Greater than zero

### Response

#### Header

    Status: 201 Created

#### Body

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "pending"
    }
