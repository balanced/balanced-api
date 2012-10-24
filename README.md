# Balanced ACH API [Beta]

The goal of this API is to let you credit (deposit)
to bank accounts in the US using next business day
[ACH](http://en.wikipedia.org/wiki/Automated_Clearing_House) transfers.
Balanced already provides an API to charge cards, holds funds in escrow,
and deposit to bank accounts.


## Milestones

UPDATE: Milestones 3 and 4 have been pushed back until further notice.

1. ~~**Wednesday, September 19, 2012:** Finalize initial version of API
specifications~~
2. ~~**Wednesday, September 26, 2012:** Release a test API that follows the
specifications but does not process live transactions~~
3. Release thin client libraries for the API in
Ruby, Python, and PHP
4. Enable live transactions


## Versioning

Note that this is API is in beta. The current version is `a1`. New versions
with breaking changes will be released. However, there will *not* be breaking
changes within a specific version and deprecated versions will be supported for
14 days.


## Pricing

**Per credit:** 25¢<br>
**Credit failure:** $3.50<br>

Balanced does not charge for:
* setup fees
* batch file costs. Well ... unlike others, we don't use batch files.
* monthly fees
* compliance
* vaulting
* data portability
* variable fee (only one fixed fee)


## Quick Start Examples


### Credit a Bank Account

    curl https://x.balancedpayments.com/a1/credits \
        -d amount=100000 \
        -d bank_account[name]="Johann Bernoulli" \
        -d bank_account[account_number]=9900000001 \
        -d bank_account[routing_number]=121000358 \
        -d bank_account[type]=checking