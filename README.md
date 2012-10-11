# Balanced ACH API [Beta]

The goal of this API is to let you debit (withdrawal) from and credit (deposit)
to bank accounts in the US using next business day
[ACH](http://en.wikipedia.org/wiki/Automated_Clearing_House) transfers.
Balanced already provides an API to charge cards, holds funds in escrow,
and deposit to bank accounts. This API has been broken off, for now, to let the
Balanced team build add ACH debits without altering the existing stable API
(`v1`). Aspects of this API have already been and will continue to be merged
into `v1`.


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

Note that this is API is in beta. The current version is `a0`. New versions
with breaking changes will be released. However, there will *not* be breaking
changes within a specific version and deprecated versions will be supported for
14 days.


## Pricing

**ACH Credit:** 25¢<br>
**ACH Debit:** $1<br>
**Rejected transactions:** $3.50<br>
**Disputes of Debits:** $15<br>

Balanced does not charge for:
* setup fees
* batch file costs. Well ... unlike others, we don't use batch files.
* monthly fees
* compliance
* vaulting
* data portability
* variable fee (only one fixed fee)


## Quick Start Examples

### Debit a Bank Account

    curl https://x.balancedpayments.com/a0/debits \
        -d amount=100000 \
        -d bank_account[name]="Jacob Bernoulli" \
        -d bank_account[account_number]=9900000000 \
        -d bank_account[routing_number]=121042882 \
        -d bank_account[type]=checking

### Credit a Bank Account

    curl https://x.balancedpayments.com/a0/credits \
        -d amount=100000 \
        -d bank_account[name]="Johann Bernoulli" \
        -d bank_account[account_number]=9900000001 \
        -d bank_account[routing_number]=121000358 \
        -d bank_account[type]=checking