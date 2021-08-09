//=============================================================================
// AmmoCrate
//=============================================================================
class LoadoutCrate extends Containers;
#exec TEXTURE IMPORT NAME=LoadoutTex1 FILE=Textures\LoadoutTex1.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex2 FILE=Textures\LoadoutTex2.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex3 FILE=Textures\LoadoutTex3.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex4 FILE=Textures\LoadoutTex4.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex5 FILE=Textures\LoadoutTex5.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex6 FILE=Textures\LoadoutTex6.pcx GROUP="Skins" 

enum ELoadout
{
    EL_Elitist,
    EL_Sniper,
    EL_Medic,
    EL_Soldier,
    EL_Engineer
};
var() ELoadout Loadout;

function BeginPlay(){
    super.BeginPlay();
    switch (Loadout) {
        case EL_Elitist:          
            Skin = Texture'LoadoutTex2';
            break;
        case EL_Sniper:          
            Skin = Texture'LoadoutTex3';
            break;
        case EL_Medic:          
            Skin = Texture'LoadoutTex4';
            break;
        case EL_Soldier:          
            Skin = Texture'LoadoutTex5';
            break;
        case EL_Engineer:          
            Skin = Texture'LoadoutTex6';
            break;
    }
}
function GiveItem(DeusExPlayer DXP, class<Inventory> toGive){
    local inventory inv;
    inv=Spawn(toGive);
    Inv.Frob(dxp,None);
    Inventory.bInObjectBelt = True;
    inv.Destroy();
}

function GiveLoadout(DeusExPlayer newPlayer, ELoadout LD){
    local Inventory inv;
    
    foreach AllActors(class'Inventory', inv){ if(inv.owner == newPlayer) inv.destroy(); }
    
    switch (Loadout) {
        case EL_Elitist:          
            GiveItem(newPlayer, class'WeaponAssaultGun');
            GiveItem(newPlayer, class'WeaponAssaultShotGun');
            GiveItem(newPlayer, class'WeaponRifle');
            GiveItem(newPlayer, class'Lockpick');
            GiveItem(newPlayer, class'Multitool');
            GiveItem(newPlayer, class'Medkit');
            break;
        case EL_Sniper:          
            GiveItem(newPlayer, class'WeaponRifle');
            GiveItem(newPlayer, class'WeaponSawedOffShotgun');
            GiveItem(newPlayer, class'WeaponCombatKnife');
            GiveItem(newPlayer, class'Lockpick');
            GiveItem(newPlayer, class'Multitool');
            GiveItem(newPlayer, class'Medkit');
            break;
        case EL_Medic:          
            GiveItem(newPlayer, class'WeaponMiniCrossbow');
            GiveItem(newPlayer, class'WeaponShuriken');
            GiveItem(newPlayer, class'WeaponStealthPistol');
            GiveItem(newPlayer, class'Lockpick');
            GiveItem(newPlayer, class'Multitool');
            GiveItem(newPlayer, class'Medkit');
            GiveItem(newPlayer, class'Medkit');
            break;
        case EL_Soldier:          
            GiveItem(newPlayer, class'WeaponAssaultGun');
            GiveItem(newPlayer, class'WeaponAssaultShotGun');
            GiveItem(newPlayer, class'WeaponGEPGun');
            GiveItem(newPlayer, class'Lockpick');
            GiveItem(newPlayer, class'Multitool');
            GiveItem(newPlayer, class'Medkit');
            break;
        case EL_Engineer:          
            GiveItem(newPlayer, class'WeaponFlamethrower');
            GiveItem(newPlayer, class'WeaponSawedOffShotgun');
            GiveItem(newPlayer, class'WeaponCrowbar');
            GiveItem(newPlayer, class'Lockpick');
            GiveItem(newPlayer, class'Multitool');
            GiveItem(newPlayer, class'Medkit');
            break;
    }

}

function Frob(Actor Frobber, Inventory frobWith){
    if(DeusExPlayer(Frobber) != None) GiveLoadout(DeusExPlayer(Frobber), Loadout);
}

defaultproperties
{
    bInvincible=True
    Loadout=EL_Elitist
     HitPoints=4000
     bFlammable=False
     ItemName="Loadout Crate"
     bPushable=False
     bBlockSight=True
     Skin=Texture'LoadoutTex1'
     Mesh=LodMesh'DeusExDeco.CrateBreakableMed'
     CollisionRadius=34.000000
     CollisionHeight=24.000000
     Mass=3000.000000
     Buoyancy=40.000000
}
 
