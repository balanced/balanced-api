{
    "name": "CustomerView", 
    "properties": {
        "twitter": {
            "required": true, 
            "type": "string", 
            "description": "Twitter ID or username of the customer or representative of the\nbusiness."
        }, 
        "meta": {
            "required": true, 
            "type": "object", 
            "description": "Key-Value mapping."
        }, 
        "id": {
            "required": true, 
            "type": "string", 
            "description": null
        }, 
        "email": {
            "required": true, 
            "type": "string", 
            "description": "Email address of the person or business."
        }, 
        "bank_accounts_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for all bank accounts associated with the customer."
        }, 
        "phone": {
            "required": true, 
            "type": "string", 
            "description": "Phone number of the person or business."
        }, 
        "facebook": {
            "required": true, 
            "type": "string", 
            "description": "Facebook ID or username of the customer or representative of the\nbusiness."
        }, 
        "address": {
            "required": true, 
            "type": "object", 
            "description": "A single-level dictionary of string-type key/value pairs representing\nthe address of the person or business."
        }, 
        "business_name": {
            "required": true, 
            "type": "string", 
            "description": "Full business name if the customer is a business. If there is a\nbusiness name and EIN present, the customer will be treated as a\nbusiness instead of a person."
        }, 
        "credits_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for all credits associated with the customer."
        }, 
        "cards_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for all cards associated with the customer."
        }, 
        "holds_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for all holds associated with the customer."
        }, 
        "name": {
            "required": true, 
            "type": "string", 
            "description": "Name of the customer or representative of the business."
        }, 
        "dob": {
            "required": true, 
            "type": "string", 
            "description": "Date of birth of the customer or representative of the business.\nFormat is YYYY-MM e.g. \"1980-05\""
        }, 
        "created_at": {
            "required": true, 
            "type": "string", 
            "description": "`ISO 8601 <http://www.w3.org/QA/Tips/iso-date>`_ date of when this\ncustomer was created."
        }, 
        "is_identity_verified": {
            "required": true, 
            "type": "boolean", 
            "description": "Indicates if Balanced was able to match the identify information\nprovided for the customer."
        }, 
        "uri": {
            "required": true, 
            "type": "string", 
            "description": "The URI of this customer."
        }, 
        "refunds_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for all refunds associated with the customer."
        }, 
        "debits_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for all debits associated with the customer."
        }, 
        "transactions_uri": {
            "required": true, 
            "type": "string", 
            "description": "URI for all transactions associated with the customer."
        }, 
        "ssn_last4": {
            "required": true, 
            "type": "string", 
            "description": "Last four digits of the Social Security Number of the customer or\nrepresentative of the business."
        }, 
        "ein": {
            "required": true, 
            "type": "string", 
            "description": "Employee Identification Number of the business if the customer is a\nbusiness. If there is a business name and EIN present, the customer\nwill be treated as a business instead of a person."
        }
    }
}
