# Debit

## Get a debit

    GET /a0/debits/:debit_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "id": "WDtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/debits/WDtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "cleared",
    "fee": 100,
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Get a debit (unstored bank account)

    GET /a0/debits/:debit_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
    "id": "WDtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/debits/WDtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "cleared",
    "fee": 100,
    "bank_account": {
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Debit a new bank account

    POST /a0/debits

### Request

`amount`
: _required_ **integer**
: `> 0`

`bank_account`
: _required_ **object**
: [Bank Account](./bank_accounts.md)

```javascript
{
    "amount": 1716,
    "bank_account": {
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
    "id": "WDtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/debits/WDtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "pending",
    "fee": 0,
    "bank_account": {
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```


## Debit an existing bank account

    POST /a0/bank_accounts/:bank_account_id/debits

### Request

`amount`
: _required_ **integer**
: `> 0`

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
    "id": "WDtjdsSJg0fFN26PACLLVHz",
    "uri": "/a0/debits/WDtjdsSJg0fFN26PACLLVHz",
    "created_at": "2012-09-13T21:25:24Z",
    "amount": 1716,
    "state": "pending",
    "fee": 0,
    "bank_account": {
        "id": "BANm9b8BcoOjcF5i1p4eV9I",
        "uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I",
        "created_at": "2012-09-13T21:25:24Z",
        "debits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/debits",
        "credits_uri": "/a0/bank_accounts/BANm9b8BcoOjcF5i1p4eV9I/credits",
        "name": "Gottfried Leibniz",
        "account_number": "xxxxxx2930",
        "routing_number": "121042882",
        "type": "checking"
    }
}
```
