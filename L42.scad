// Length of the visible part of the bulbs
bulblength = 300;
bulbthickness = 40;
blocklength = 40;
blockheight = 30;

// Margin around the 'edges' of the outer box
margin = 15;

lamplength = blocklength+bulblength+blocklength;
rib = (margin+lamplength+margin) / 3;

top_margin = rib;


module lamp() {
    color("white") cylinder(r=bulbthickness/2,h=bulblength, center=true);
    color("black") translate([0,0,(bulblength+blocklength)/2])
      cube([blockheight, blockheight, blocklength], center=true);
    color("black") translate([0,0,-(bulblength+blocklength)/2])
      cube([blockheight, blockheight, blocklength], center=true);
}

// Inner box:
//cube(rib, center=true);
// Outer box:
//cube(3*rib, center=true);

// Lamps
translate([-rib/2,-rib/2,0])
  lamp();

translate([rib/2,0,rib/2])
  rotate([90,0,0]) lamp();

translate([0,rib/2,-rib/2])
  rotate([0,90,0]) lamp();

// Plate

plateheight=14;

translate([0,0,(3*rib+plateheight)/2+top_margin])
  color("black") 
    cube([3*rib,3*rib,plateheight],center=true);
    
// Wiring

wirethickness=6;

translate([-rib/2,-rib/2,lamplength/2])
  color("black") cylinder(r=wirethickness/2,h=top_margin+margin);

translate([rib/2,(bulblength+blocklength)/2,rib/2])
  color("black") cylinder(r=wirethickness/2,h=top_margin+rib);
translate([rib/2,-(bulblength+blocklength)/2,rib/2])
  color("black") cylinder(r=wirethickness/2,h=top_margin+rib);
  
translate([(bulblength+blocklength)/2,rib/2,-rib/2])
  color("black") cylinder(r=wirethickness/2,h=top_margin+2*rib);
translate([-(bulblength+blocklength)/2,rib/2,-rib/2])
  color("black") cylinder(r=wirethickness/2,h=top_margin+2*rib);