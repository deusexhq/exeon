class DisplayCycle extends DeusExDecoration;

var class<Actor> Displays[15];
var int CurIndex;
var DeusExDecoration Host;
var bool bChanging, bShrinking, bGrowing;

function bool Append(class<Actor> A){
    local int i;
    
    for (i=0;i<15;i++){
        if(Displays[i] == None){
            Displays[i] = A;
            return True;
        }
    }
    return False;
}

function clear(){
    local int i;
    
    for (i=0;i<15;i++){
        Displays[i] = None;
    }
}

function int length(){
    local int i, total;
    
    for (i=0;i<15;i++){
        if(Displays[i] != None){
            total++;
        }
    }
    return total;
}

function int next(){
    CurIndex++;
    if(CurIndex == 15 || Displays[CurIndex] == None) CurIndex = 0;
    return CurIndex;
}

function Timer(){
    if(!bChanging && !bShrinking){
        bChanging = True;
        bShrinking = True;
    }
}

function Change(){
    local int i;
    local vector loc;
    
    SetPhysics(PHYS_NONE);
    bFixedRotationDir=False;
    if(Host != None){
        loc = Host.Location;
        loc.z += 30;
        //log(loc);
        SetLocation(loc);
    } else Destroy();

    if(length() <= 1) return;
    i = next();
    
    if(Displays[i] != None){
        Mesh = Displays[i].default.mesh;
    }
    bFixedRotationDir=True;
    SetPhysics(PHYS_Rotating);
}

function Tick(float deltatime){
    super.tick(deltatime);
    if(bChanging){
        if(bShrinking){
            Drawscale -= 0.1;
            if(Drawscale <= 0){
                Change();
                bShrinking = False;
                bGrowing = True;
            }
        }
        
        if(bGrowing){
            Drawscale += 0.1;
            if(Drawscale >= 1){
                Drawscale = 1;
                bGrowing = False;
                bChanging = False;
            }
        }
    }
}
function Frob(Actor Frobber, Inventory frobWith){
    if(DeusExPlayer(Frobber) != None && Host != None) Host.Frob(Frobber, frobWith);
}

defaultproperties
{
    ItemName="Loadout Display"
    Physics=PHYS_Rotating
    bFixedRotationDir=True
    bInvincible=True
    bPushable=False
    bBlockPlayers=False
    Mass=5000.000000
    Buoyancy=500.000000
    CollisionHeight=5
    RotationRate=(Yaw=8192)
}
