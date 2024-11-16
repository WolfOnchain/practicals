module task1::example {

    public struct Sword has key, store {
        id: UID,
        magic: u64,
        strength: u64
    }

    public struct Forge has key {
        id: UID,
        sword_created: u64
    }

    fun init(ctx: &mut TxContext) {
        let admin = Forge {
            id: object::new(ctx),
            sword_created: 0,
        };
        transfer::transfer(admin, ctx.sender());
    }
    public fun magic(self: &Sword): u64 {
        self.magic
    }

    public fun strength(self: &Sword): u64 { 
        self.strength
    }

    public fun sword_created(self: &Forge): u64 { 
        self.sword_created
    }
    

#[test]
fun test_sword_create() { 
    let mut ctx = tx_context::dummy();
    


    let sword = Sword {
        id: object::new(&mut ctx),
        magic: 42,
        strength: 7
    };
    

    assert!(sword.magic() == 42 && sword.strength() == 7, 1);
    let dummy_address = @0;

    transfer::public_transfer(sword, dummy_address);
}
}
