## Balanced-api requests directory

The directory defines all the possible requests to the balanced api.

### layout
  * files in this directory are requests that can be done at the top level.  Eg: the file `card.json` represents request to `/cards`
  * files contained in directories represent nested requests. Eg: `bank_accounts/credit.json` represents requests to `/bank_accounts/:bank_account_id/credits`
  * the folder _models contains schemas that are commonly used through requests such as address field
  * the _patch.json file represents the schema for a PATCH request to updated an object
