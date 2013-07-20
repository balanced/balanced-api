{
    "name": "CardView", 
    "properties": {
        "security_code_check": {
            "required": true, 
            "type": "string", 
            "description": "One of \"passed\", \"failed\", \"unknown\""
        }, 
        "postal_code_check": {
            "required": true, 
            "type": "string", 
            "description": "One of \"passed\", \"failed\", \"unknown\""
        }, 
        "hash": {
            "required": true, 
            "type": "string", 
            "description": "A hash derived from ``card_number``, ``expiration_month`` and\n``expiration_year``. Cards with the same ``card_number``,\n``expiration_month`` and ``expiration_year`` will have the same\n``hash``."
        }, 
        "last_four": {
            "required": true, 
            "type": "string", 
            "description": "Last four digits of the card."
        }, 
        "expiration_year": {
            "required": true, 
            "type": "string", 
            "description": "Card's expiration year."
        }, 
        "brand": {
            "required": true, 
            "type": "string", 
            "description": "The brand of the card. One of: ``Visa``, ``MasterCard``,\n``American Express``, or ``Discover``."
        }, 
        "expiration_month": {
            "required": true, 
            "type": "string", 
            "description": "Card's expiration month."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "A single-level dictionary of string-type key/value pairs."
        }, 
        "postal_code": {
            "required": true, 
            "type": "string", 
            "description": "Postal code (zip code in the USA)."
        }, 
        "country_code": {
            "required": true, 
            "type": "string", 
            "description": "`ISO-3166-3`_ three character country code."
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this card\nwas tokenized."
        }, 
        "street_address": {
            "required": true, 
            "type": "string", 
            "description": "Street address."
        }, 
        "name": {
            "required": true, 
            "type": "string", 
            "description": "The name on the card."
        }
    }
}
