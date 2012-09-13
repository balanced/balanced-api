# Bank Account Credit

## Get a bank account credit

    GET /:version/bank_account_credits/:bank_account_credit_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "id": "ACtjdsSJg0fFN26PACLLVHz",
    "uri": "/:version/bank_account_credits/ACtjdsSJg0fFN26PACLLVHz",
    "created": "1347571524",
    "amount": 1716,
    "status": "pending",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created": "1347571524",
        "debits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Get a bank account credit (deleted bank account)

    GET /:version/bank_account_credits/:bank_account_credit_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "id": "ACtjdsSJg0fFN26PACLLVHz",
    "uri": "/:version/bank_account_credits/ACtjdsSJg0fFN26PACLLVHz",
    "created": "1347571524",
    "amount": 1716,
    "status": "cleared",
    "bank_account": {
        "created": "1347571524",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Credit a new bank account

    POST /:version/bank_account_credits

### Request

`amount`
: _required_ **integer**
: `>= 0`

`bank_account`
: _required_ **object**
: [Bank Account](./bank_accounts.md)

```javascript
{
    "amount": 1716,
    {
        "name": "Gottfried Leibniz",
        "account_number": "3819372930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


### Response

#### Header

    Status: 201 Created

#### Body

```javascript
{
    "id": "ACtjdsSJg0fFN26PACLLVHz",
    "uri": "/:version/bank_account_credits/ACtjdsSJg0fFN26PACLLVHz",
    "created": "1347571524",
    "amount": 1716,
    "status": "pending",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created": "1347571524",
        "debits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Credit an existing bank account

    POST /:version/bank_accounts/:bank_account_id/credits

### Request

`amount`
: _required_ **integer**
: `>= 0`

```javascript
{
    "amount": 1716
}
```

### Response

#### Header

    Status: 201 Created

#### Body

```javascript
{
    "id": "ACtjdsSJg0fFN26PACLLVHz",
    "uri": "/:version/bank_account_credits/ACtjdsSJg0fFN26PACLLVHz",
    "created": "1347571524",
    "amount": 1716,
    "status": "pending",
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created": "1347571524",
        "debits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/:version/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```