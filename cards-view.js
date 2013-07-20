{
    "name": "BankAccountView", 
    "properties": {
        "routing_number": {
            "required": true, 
            "type": "string", 
            "description": "Meets `MICR <http://en.wikipedia.org/wiki/Routing_transit_number#MICR_Routing_number_format>`_\nrouting number format. Specified in FedACH database defined by the\n`US Federal Reserve <http://www.fedwiredirectory.frb.org/>`_."
        }, 
        "bank_name": {
            "required": true, 
            "type": "string", 
            "description": "The name of the bank."
        }, 
        "verification_uri": {
            "required": true, 
            "type": "string", 
            "description": "Most recent verification for this bank account."
        }, 
        "name": {
            "required": true, 
            "type": "string", 
            "description": "Name of the account holder."
        }, 
        "type": {
            "required": true, 
            "type": "string", 
            "description": "``checking`` or ``savings``."
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\nbank account was tokenized."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "A single-level dictionary of string-type key/value pairs."
        }, 
        "account_number": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "fingerprint": {
            "required": true, 
            "type": "string", 
            "description": "Uniquely identifies the bank account (``account_number`` and\n``routing_number``)."
        }, 
        "can_debit": {
            "required": true, 
            "type": "boolean", 
            "description": "Flag indicating whether this funding instrument can be debited (true)\nor not (false)."
        }, 
        "verifications_uri": {
            "required": true, 
            "type": "string", 
            "description": null
        }
    }
}
