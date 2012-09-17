# Bank Account

## Get a bank account

    GET /a0/bank_accounts/:bank_account_id

### Response

#### Header

    Status: 200 OK

#### Body

```javascript
{
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
```


## Store a bank account

    POST /a0/bank_accounts

### Request

`name`
: _required_ **string**

`account_number`
: _required_ **string**

`routing_number`
: _required_ **string**

`type`
: _required_ **string**
: `checking` or `savings`

```javascript
{
    "name": "Gottfried Leibniz",
    "account_number": "3819372930",
    "routing_number": "121042882",
    "type": "checking"
}
```

### Response

#### Header

    Status: 201 Created

#### Body

```javascript
{
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
```


## Unstore a bank account

    DELETE /a0/bank_accounts/:bank_account_id

### Response

#### Header

    Status: 204 No Content