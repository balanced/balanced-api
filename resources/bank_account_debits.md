# Bank Account Debit

## Get a bank account debit

    GET /:version/bank_account_debits/:bank_account_debit_id

### Response

#### Header

    Status: 200 OK

#### Body

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "amount": 1716,
        "status": "pending",
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }

    }


## Get a bank account debit (deleted bank account)

    GET /:version/bank_account_debits/:bank_account_debit_id

### Response

#### Header

    Status: 200 OK

#### Body

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "amount": 1716,
        "status": "cleared",
        "bank_account": {
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
    }


## Create a bank account debit (new bank account)

    POST /:version/bank_account_debits

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
        "amount": 1716,
        "status": "pending"
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
    }


## Create a bank account debit (existing bank account)

    POST /:version/bank_accounts/:bank_account_id/bank_account_debits

### Request

`amount`
: _required_ **integer**. Greater than zero

### Response

#### Header

    Status: 201 Created

#### Body

    {
        "id": "ADtjdsSJg0fFN26PACLLVHz",
        "amount": 1716,
        "status": "pending"
        "bank_account": {
            "id": "BANm9b8BcoOjcF5i1p4eV9I",
            "account_number": "xxxxxx2930",
            "routing_number": "121042882",
            "type": "checking"
        }
    }
