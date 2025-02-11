module metaschool::calculator_48
{
    use std::string::{String,utf8};
    use std::signer;

    struct Message has key
    {
        my_message : String
    }

    public entry fun create_message(account: &signer)
    {
        if (!exists<Message>(signer::address_of(account))){
            let message = Message {
                my_message : utf8(b"Hi, its my first dApp on the Aptos ecosystem")            
            };
            move_to(account,message);    
        }
    }

    public fun get_message(account: &signer): String acquires Message {
        let calculator = borrow_global<Message>(signer::address_of(account));
        calculator.my_message
    }
}