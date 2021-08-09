//=============================================================================
// Dart.
//=============================================================================
class BulletEnergy extends DeusExProjectile;
#exec obj load file=..\Textures\Effect.utx package=Effects
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
     speed=1700.000000
     MaxSpeed=2500.000000
     Damage=15.000000
     MomentumTransfer=1000
     ImpactSound=Sound'PlasmaRifleHit'
     Mesh=LodMesh'DeusExItems.Tracer'
     Texture=FireTexture'Effects.liquid.ambrosia_SFX'
     Skin=FireTexture'Effects.liquid.ambrosia_SFX'
     Drawscale=4
     CollisionRadius=3.000000
     CollisionHeight=0.500000
}
