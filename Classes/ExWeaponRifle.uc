class ExWeaponRifle extends WeaponRifle;

simulated function bool TestMPBeltSpot(int BeltSpot)
{
   return ( (BeltSpot >= 1) && (BeltSpot <=3) );
}

defaultproperties
{
     HitDamage=50
     bInstantHit=False
     ProjectileClass=Class'BulletShot'
     ItemName="Sniper Rifle (E)"
     beltDescription="SNIPER(E)"
     Mass=1.000000
    maxRange=24000
     AccurateRange=14400
}
