//=============================================================================
// WeaponNailGun.
//=============================================================================
class WeaponMarineSidearm extends DeusExWeapon;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	// If this is a netgame, then override defaults
	if ( Level.NetMode != NM_StandAlone )
	{
		HitDamage = mpHitDamage;
		BaseAccuracy = mpBaseAccuracy;
		ReloadTime = mpReloadTime;
		AccurateRange = mpAccurateRange;
		MaxRange = mpMaxRange;
		ReloadCount = mpReloadCount;
	}
}

simulated function bool TestMPBeltSpot(int BeltSpot)
{
   return ( (BeltSpot >= 1) && (BeltSpot <=9) );
}

state NormalFire //(Thanks to JimBowen for this Infinite ammo code) 
{ 
   Begin: 
      if ((ClipCount >= ReloadCount) && (ReloadCount != 0)) 
      { 
         if (!bAutomatic) 
         { 
            bFiring = False; 
            FinishAnim(); 
         } 
    
         if (Owner != None) 
         { 
            if (Owner.IsA('DeusExPlayer')) 
            { 
               bFiring = False; 
            } 
            else if (Owner.IsA('ScriptedPawn')) 
            { 
               bFiring = False; 
               ReloadAmmo(); 
            } 
         } 
         else 
         { 
            if (bHasMuzzleFlash) 
               EraseMuzzleFlashTexture(); 
            GotoState('Idle'); 
         } 
      } 
      if ( bAutomatic && (( Level.NetMode == NM_DedicatedServer ) || ((Level.NetMode == NM_ListenServer) && Owner.IsA('DeusExPlayer') && !DeusExPlayer(Owner).PlayerIsListenClient()))) 
         GotoState('Idle'); 
    
      Sleep(GetShotTime()); 
      if (bAutomatic) 
      { 
         GenerateBullet();       // In multiplayer bullets are generated by the client which will let the server know when 
         Goto('Begin'); 
      } 
      bFiring = False; 
      FinishAnim(); 
      ReadyToFire(); 
   Done: 
      bFiring = False; 
      Finish(); 
}

defaultproperties
{
     GoverningSkill=Class'DeusEx.SkillWeaponPistol'
     NoiseLevel=0.010000
     ShotTime=0.150000
     reloadTime=0.000000
     HitDamage=8
     maxRange=4800
     AccurateRange=2400
     BaseAccuracy=0.800000
     bCanHaveScope=True
     bHasScope=True
     ScopeFOV=25
     bCanHaveLaser=True
     bHasLaser=True
     recoilStrength=0.100000
     mpReloadTime=1.500000
     mpHitDamage=30
     mpBaseAccuracy=0.200000
     mpAccurateRange=1200
     mpMaxRange=8200
     bCanHaveModBaseAccuracy=True
     bCanHaveModReloadCount=True
     bCanHaveModAccurateRange=True
     bCanHaveModReloadTime=True
     FireOffset=(X=-24.000000,Y=10.000000,Z=14.000000)
     ProjectileClass=Class'BulletShot'
     shakemag=50.000000
     FireSound=Sound'DeusExSounds.Weapons.PistolFire'
     AltFireSound=Sound'DeusExSounds.Weapons.StealthPistolReloadEnd'
     CockingSound=Sound'DeusExSounds.Weapons.StealthPistolReload'
     SelectSound=Sound'DeusExSounds.Weapons.StealthPistolSelect'
     InventoryGroup=1055
     ItemName="Marine Sidearm"
     PlayerViewOffset=(X=22.000000,Y=-10.000000,Z=-14.000000)
     PlayerViewMesh=LodMesh'DeusExItems.Glock'
     PickupViewMesh=LodMesh'DeusExItems.GlockPickup'
     ThirdPersonMesh=LodMesh'DeusExItems.Glock3rd'
     LandSound=Sound'DeusExSounds.Generic.DropLargeWeapon'
     Icon=Texture'DeusExUI.Icons.BeltIconPistol'
     largeIconWidth=47
     largeIconHeight=37
     beltDescription="MARINE"
     Mesh=LodMesh'DeusExItems.GlockPickup'
     CollisionRadius=7.000000
     CollisionHeight=1.000000
     Mass=3.000000
}
