//=============================================================================
// Dart.
//=============================================================================
class BulletShot extends DeusExProjectile;

var float mpDamage;

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	if ( Level.NetMode != NM_Standalone )
		Damage = mpDamage;
}

defaultproperties
{
     mpDamage=20.000000
     bBlood=True
     DamageType=shot
     ItemName="Bullet"
     ItemArticle="a"
     speed=1500.000000
     MaxSpeed=2000.000000
     Damage=15.000000
     MomentumTransfer=1000
     ImpactSound=Sound'Ricochet_4'
     Mesh=LodMesh'DeusExItems.Tracer'
     Drawscale=4
     CollisionRadius=3.000000
     CollisionHeight=0.500000
}
