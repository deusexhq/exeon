//=============================================================================
// AmmoCrate
//=============================================================================
class LoadoutCrate extends Containers;

#exec TEXTURE IMPORT NAME=LoadoutTex1 FILE=Textures\LoadoutTex1.pcx GROUP="Skins" 
/*#exec TEXTURE IMPORT NAME=LoadoutTex2 FILE=Textures\LoadoutTex2.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex3 FILE=Textures\LoadoutTex3.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex4 FILE=Textures\LoadoutTex4.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex5 FILE=Textures\LoadoutTex5.pcx GROUP="Skins" 
#exec TEXTURE IMPORT NAME=LoadoutTex6 FILE=Textures\LoadoutTex6.pcx GROUP="Skins" */

enum ELoadout
{
    EL_Elitist,
    EL_Sniper,
    EL_Medic,
    EL_Soldier,
    EL_Engineer,
    EL_Custom,
    EL_Random
};
var() ELoadout Loadout;

var() class<inventory> items[15];
var() int NumDisplays;

var DisplayCycle Displayer;

function bool Append(class<Inventory> A){
    local int i;
    
    for (i=0;i<15;i++){
        if(items[i] == None){
            items[i] = A;
            return True;
        }
    }
    return False;
}

function clear(){
    local int i;
    
    for (i=0;i<15;i++){
        items[i] = None;
    }
}

function DisplayCycle AttachDisplay(){
    local vector loc;
    local int i;
    
    loc = Location;
    loc.z += 30;
    Displayer = Spawn(class'DisplayCycle',,, loc);
    Displayer.Host = Self;
    for (i=0;i<NumDisplays;i++){
        if(items[i] != None) {
            if(i == 0) Displayer.mesh = items[i].default.mesh;
            Displayer.append(items[i]);
        }
    }
    Displayer.SetTimer(3, True);
}

function BeginPlay(){
    super.BeginPlay();
    
    switch (Loadout) {
        case EL_Elitist:   
            clear();
            Append(class'WeaponAssaultGun');
            Append(class'WeaponAssaultShotGun');
            Append(class'WeaponRifle');
            Append(class'Lockpick');
            Append(class'Multitool');
            Append(class'Medkit');
            break;
        case EL_Sniper:    
            clear();
            Append(class'WeaponRifle');
            Append(class'WeaponSawedOffShotgun');
            Append(class'WeaponCombatKnife');
            Append(class'Lockpick');
            Append(class'Multitool');
            Append(class'Medkit');
            break;
        case EL_Medic:   
            clear();
            Append(class'WeaponMiniCrossbow');
            Append(class'WeaponShuriken');
            Append(class'WeaponStealthPistol');
            Append(class'Lockpick');
            Append(class'Multitool');
            Append(class'Medkit');
            Append(class'Medkit');
            break;
        case EL_Soldier:    
            clear();
            Append(class'WeaponAssaultGun');
            Append(class'WeaponAssaultShotGun');
            Append(class'WeaponGEPGun');
            Append(class'Lockpick');
            Append(class'Multitool');
            Append(class'Medkit');
            break;
        case EL_Engineer:   
            clear();
            Append(class'WeaponFlamethrower');
            Append(class'WeaponSawedOffShotgun');
            Append(class'WeaponCrowbar');
            Append(class'Lockpick');
            Append(class'Multitool');
            Append(class'Medkit');
            break;
    }
    AttachDisplay();
}

function GiveItem(DeusExPlayer DXP, class<Inventory> toGive){
    local inventory inv;
    inv=Spawn(toGive);
    if(inv != None){
        Inv.Frob(dxp,None);
        Inv.bInObjectBelt = True;
        inv.Destroy();
    }

}

function GiveLoadout(DeusExPlayer newPlayer){
    local Inventory inv;
    local int i;
    
    foreach AllActors(class'Inventory', inv){ if(inv.owner == newPlayer) inv.destroy(); }
    
    for(i=0;i<15;i++){
        if(items[i] != None) GiveItem(newPlayer, items[i]);
    }
 
}

function Frob(Actor Frobber, Inventory frobWith){
    if(DeusExPlayer(Frobber) != None) GiveLoadout(DeusExPlayer(Frobber));
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
     NumDisplays=3
}
 
