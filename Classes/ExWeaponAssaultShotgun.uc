class ExWeaponAssaultShotgun extends WeaponAssaultShotgun;

simulated function bool TestMPBeltSpot(int BeltSpot)
{
   return ( (BeltSpot >= 1) && (BeltSpot <=3) );
}

defaultproperties
{
     HitDamage=8
     bInstantHit=False
     ProjectileClass=Class'BulletShot'
     ItemName="Assault Shotgun (E)"
     beltDescription="SHOTGUN(E)"
     Mass=1.000000
}
