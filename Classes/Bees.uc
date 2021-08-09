//=============================================================================
// AmmoCrate
//=============================================================================
class Bees extends DeusExDecoration;

var localized String AmmoReceived;

function tick(float deltatime){
super.tick(deltatime);
RadialCollect();
}

function RadialCollect()
{
	local DeusExPlayer P, winP;
	local vector dist;
	local float lowestDist;

	lowestDist = 1024;

	foreach VisibleActors(class'DeusExPlayer', P, 1000)
	{
		if(P != None && !P.IsInState('Dying') && P.Health > 0)
		{
			if(vSize(P.Location - Location) < lowestDist)
			{
				winP = P;
				lowestDist = vSize(P.Location - Location);
			}
		}
	}

	if(winP != None)
		DoRefill(winp);
}

function Frob(Actor Frobber, Inventory frobWith)
{
	local Actor A;
	local Pawn P;
	local DeusExPlayer Player;

	Player = DeusExPlayer(Frobber);

    if (Player != None) DoRefill(Player);
}

function DoRefill(DeusExPlayer Player){
    local Bee b;

    b = Spawn(class'Bee',,,location);
    if(b != None){
        Player.CLientMessage("Bee spawned.");
            b.AttachPlayer = Player;
    b.gotostate('following');
        
    }

}


defaultproperties
{
     AmmoReceived="Ammo restocked."
     HitPoints=4000
     bFlammable=False
     ItemName="Ammo Box"
     bBlockSight=True
     Mesh=LodMesh'DeusExItems.DXMPAmmobox'
     CollisionRadius=7
     CollisionHeight=7
     Drawscale=0.4
     Mass=30.000000
     Buoyancy=40.000000
     RotationRate=(Yaw=8192)
     Physics=PHYS_Rotating
     bBlockPlayers=False
     bFixedRotationDir=True
}
