class ExWeaponAssaultGun extends WeaponAssaultGun;

simulated function bool TestMPBeltSpot(int BeltSpot)
{
   return ( (BeltSpot >= 1) && (BeltSpot <=3) );
}

defaultproperties
{
     HitDamage=8
     bInstantHit=False
     ProjectileClass=Class'BulletShot'
     InventoryGroup=132
     ItemName="Assault Gun (E)"
     beltDescription="ASSAULT(E)"
     Mass=1.000000
}
