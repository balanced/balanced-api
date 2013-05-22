the goal here is to create an order resource to assist with accounting/ledgering and debits/credit linking. specifically:

1. link debits with credits.
2. link funds debited into the system (aka escrowed) with the customers that will recieve those funds.
3. track the state of funds (e.g. what was released to a customer, what is still owed to a customer, etc).
4. handle marketplace fees

an order should represent the high level payment or order in your system (e.g. a purchase, a crowd funding campaign, a shopping card, etc). interaction might look like this:

1. create the order:

    ```python
    order = Order(description, meta)
    ```

2. debit customers (aka payers):

    ```python
    order.debit(payer1, amount1, fee, recipient1)
    order.debit(payer2, amount2, fee, recipient1)
    order.debit(payer3, amount3, fee, recipient2)
    ```

3. release funds from those debits to cutomers (aka recipients):

    ```python
    order.debits[i].release() # this will also collect fees
    order.debits[j].release()
    order.release()           # this will release all unreleased debits to recipients
    ```

4. refund recipients if you need to:

    ```python
    order.debits[i].refund()
    ```

5. view amounts at any time to understand the state of the order in the system:

    ```python
    order.in_escrow    # amount debited from payers but not released to recipients
    order.fee_in_ecrow # amount debited from payers but not released to you as fees
    order.fee          # amount released in fees

    order.debited_amount                        # sum of amounts that have been debited from payers
    order.refunded_amount                       # sum of amounts that have been refunded to payers
    order.payers[i].debited_amount              # amount that has been debited from payer
    order.payers[i].refunded_amount             # amount that has been refunded from payer
    order.payers[i].sources[j].debited_amount   # amount that has been debited from payer source
    order.payers[i].sources[j].refunded_amount  # amount that has been refunded to payer source

    order.credited_amount               # sum of amounts that have been credited to recipients
    order.owed_amount                  # sum of amounts amount still owed to recipients
    order.recipients[i].credited_amount # amount that has been credited to recipient
    order.recipients[i].owed_amount     # amount still owed to this recipient
    order.recipients[i].destinations[j].debited_amount  # amount that has been credied to payer source
    ```

as you can see there are 5 resources:

1. `order`
1. `payer`
1. `payer_source`
1. `recipient`
1. `recipient_source`

and for them most part they just do the tedious accounting work and linking of debits to credits.

order
=====

`GET /v1/orders/:order_id`

```json
{
    "id": "OR1234567890",
    "description": "my order!",
    "meta": {
        "tag": "a tag"
    },
    "payers_uri": "/v1/orders/OR1234567890/payers",
    "recipients_uri": "/v1/orders/OR1234567890/recipients",
    "debits_uri": "/v1/orders/OR1234567890/debits",
    "transactions_uri": "/v1/orders/OR1234567890/transactions",
    "debited_amount": 100,
    "refunded_amount": 0,
    "crediting_amount": 50,
    "credited_amount": 25,
    "in_escrow": 10,
    "fee_in_escrow": 5,
    "fee": 10
}
```

fields
------

`description`
**string**

`meta`
**object**

`payers_uri`
**string**: Link to all payers associated with this order.

`recipients_uri`
**string**: Link to all recipients associated with this order.

`transactions_uri`
**string**: Link to all transactions associated with this order.

`debits_uri`
**string**: Link to all unreleased debits.

`debited_amount`
**integer**: Sum of all amounts debited from payers as part of this order.

`refunded_amount`
**integer**: Sum of all amounts refunded to payers as part of this order.

`crediting_amount`
**integer**: Sum of all pending amounts credited to recipients as part of this order.

`credited_amount`
**integer**: Sum of all amounts credited to recipients as part of this order.

`in_escrow`
**integer**: Amount debited from payers to be released to recipients. 

`fee_in_escrow`
**integer**: Fees debited from payers to be taken when the debit is released. 

`fee`
**integer**: Amount debited from payers that has been taken as your fee.


payer
=====

this is a customer that is being debited as part of the payment. we call them payers.

`GET /v1/orders/:order_id/payers/:customer_id`

```json
{
    "uri": "/v1/orders/OR1234567890/payer/CU1234567890",
    "order_uri": "/v1/orders/OR1234567890",
    "customer": {
        "id": "CU1234567890",
        ...
    },
    "sources_uri": "/v1/orders/OR1234567890/payers",
    "transactions_uri": "/v1/orders/OR1234567890/recipients",
    "debited_amount": 50,
    "refunded_amount": 0
}
```

fields
------

`customer`
**object**: The ``customer`` that is paying.

`order_uri`
**string**: Link to the associated order.

`sources_uri`
**string**: Link to funding sources that have been used to debit funds from this payer.

`transactions_uri`
**string**: Link to all transactions for this payer.

`debited_amount`
**integer**: Amount that has been debited from this payer.

`refunded_amount`
**integer**: Amount that has been refunded to this payer.

payer source
============

this is a source that was used to debit a customer.

`GET /v1/orders/:order_id/payers/:customer_id/sources/:card_id`

```json
{
    "uri": "/v1/orders/OR1234567890/payer/CU1234567890/source/CC1234567890",
    "payer_uri": "/v1/orders/OR1234567890/payer/CU1234567890",
    "transactions_uri": "/v1/orders/OR1234567890/payer/CU1234567890/source/CC1234567890/transactions",
    "debited_amount": 45,
    "refunded_amount": 5
}
```

fields
------

`source`
**object**: The ``card`` or ``bank_account`` debited.

`payer_uri`
**string**: Link to the associated payer.

`transactions_uri`
**string**: Link to all transactions for for this payer source.

`debited_amount`
Amount that has been debited from this payer source.

`refunded_amount`
Amount that has been refunded to this payer source.

recipient
=========

this is a customer that is being credited funds debited from a payer. we call them recipients.

`GET /v1/orders/:order_id/recipients/:customer_id`

```json
{
    "uri": "/v1/orders/OR1234567890/recipients/CU1234567890",
    "order_uri": "/v1/orders/OR1234567890",
    "customer": {
        "id": "CU1234567890",
        ...
    },
    "destinations_uri": "/v1/orders/OR1234567890/recipients/CU1234567890/destinations",
    "transactions_uri": "/v1/orders/OR1234567890/recipients/CU1234567890/transactions",
    "crediting_amount": 10,
    "credited_amount": 5,
    "owed_amount": 25
}
```

fields
------

`customer`
**object**: The ``customer`` that is recieving funds.

`order_uri`
**string**: Link to the associated order.

`destinations`
**string**: Link to funding destinations that have been used to credit funds from this recipient.

`transactions_uri`
**string**: Link to all transactions for this recipient.

`crediting_amount`
**integer**: Amounts being credited to this recipient.

`credited_amount`
**integer**: Amounts that has been successfully credited to this recipient.

`owed_amount`
**integer**: Amount still be to credited to this recipient.

recipient destination
=====================

this is a destination funds have been released to.

`GET /v1/orders/:order_id/recipients/:customer_id/destination/:bank_account_id`

```json
{
    "uri": "/v1/orders/OR1234567890/recipients/CU1234567890/destination/BA1234567890",
    "recipient_uri": "/v1/orders/OR1234567890/recipients/CU1234567890",
    "customer": {
        "id": "CU1234567890",
        ...
    },
    "transactions_uri": "/v1/orders/OR1234567890/recipients/CU1234567890/destination/BA1234567890/transactions",
    "crediting_amount": 10,
    "credited_amount": 5
}
```


fields
------

`destination`
**object**: The ``bank_account`` credited.

`recipient_uri`
**string**: Link to the associated recipient.

`transactions_uri`
**string**: Link to all transactions for this recipient destination.

`crediting_amount`
**integer**: Amount being credited.

`credited_amount`
**integer**: Amount that has been successfully credited.

