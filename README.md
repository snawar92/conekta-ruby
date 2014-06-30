# Conekta

This is a ruby library that allows interaction with https://api.conekta.io API.

## Installation

Add this line to your application's Gemfile:

    gem 'conekta'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conekta

## Usage
    # This change the Accept-Language Header to the locale specified
    Conekta.locale = :es
    
    Conekta.api_key = '1tv5yJp3xnVZ7eK67m4h'
    
    begin
        charge = Conekta::Charge.create({
                    amount: 51000,
                    currency: "MXN",
                    description: "Pizza Delivery",
                    reference_id: "orden_de_id_interno",
                    card: params[:conektaTokenId] 
                    #"tok_a4Ff0dD2xYZZq82d9"
                    })
    rescue Conekta::ParameterValidationError => e
        puts e.message 
        #alguno de los parámetros fueron inválidos
    rescue Conekta::ProcessingError => e
        puts e.message 
        #la tarjeta no pudo ser procesada
    rescue Conekta::Error
        puts e.message 
        #un error ocurrió que no sucede en el flujo normal de cobros como por ejemplo un auth_key incorrecto
    end
    

    {
        "id": "5286828b8ee31e64b7001739",
        "livemode": false,
        "created_at": 1384546955,
        "status": "paid",
        "currency": "MXN",
        "description": "Some desc",
        "reference_id": null,
        "failure_code": null,
        "failure_message": null,
        "object": "charge",
        "amount": 2000,
        "fee": 371,
        "payment_method": {
            "name": "Mario Moreno",
            "exp_month": "05",
            "exp_year": "15",
            "auth_code": "861491",
            "object": "card_payment",
            "last4": "4242",
            "brand": "visa"
        },
        "details": {
            "name": null,
            "phone": null,
            "email": null,
            "line_items": []
        }
    }
