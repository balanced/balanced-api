# Bank Account Credit

## Get a bank account credit

    GET /:version/bank_account_credits/:bank_account_credit_id

### Response

#### Header

    Status: 200 OK

#### Body

    {
        "id": "ACtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "name": "Gottfried Leibniz",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "pending"
    }


## Get a bank account credit (deleted bank account)

    GET /:version/bank_account_credits/:bank_account_credit_id

### Response

#### Header

    Status: 200 OK

#### Body

    {
        "id": "ACtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "name": "Gottfried Leibniz",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "cleared"
    }


## Create a bank account credit (new bank account)

    POST /:version/bank_account_credits

### Request

`amount`
: _required_ **integer**
: greater than zero

`bank_account`
: _required_ **object**
: [Bank Account](./bank_accounts.md)


### Response

#### Header

    Status: 201 Created

#### Body

    {
        "id": "ACtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "name": "Gottfried Leibniz",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "pending"
    }


## Create a bank account credit (existing bank account)

    POST /:version/bank_accounts/:bank_account_id/bank_account_credits

### Request

`amount`
: _required_ **integer**
: greater than zero

### Response

#### Header

    Status: 201 Created

#### Body

    {
        "id": "ACtjdsSJg0fFN26PACLLVHz",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "name": "Gottfried Leibniz",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
        "amount": 1716,
        "status": "pending"
    }
