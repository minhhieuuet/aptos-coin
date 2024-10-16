module MyCoin4::MyCoin4 {
     use aptos_framework::coin::{Self};
    use std::signer;

    struct MyCoin4 {}
 
    fun init_module(sender: &signer) {
        aptos_framework::managed_coin::initialize<MyCoin4>(
            sender,
            b"Tinh Love Coin",
            b"TINH",
            6,
            true,
        );
        // mint 1000 coins to the sender
        coin::register<MyCoin4>(sender);
        aptos_framework::managed_coin::mint<MyCoin4>(sender, signer::address_of(sender), 1000000000000000);
    }

    entry fun mint_my_coin2(sender: &signer, amount: u64) {
        aptos_framework::managed_coin::mint<MyCoin4>(sender, signer::address_of(sender), amount);
    }
}


