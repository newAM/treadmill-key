ID_ACTUAL = 19.75; // measured
OD_ACTUAL = 37.75; // measured
CABLE_D_ACTUAL = 3.18; // measured

ID = 19;
OD = 30;
CABLE_D = 5;
TORROID_R = 2;
H = 5;
RECESSED_H = 2;
MAGNET_D = 11;
MAGNET_H = 5;

difference() {
  union() {
    cylinder(h=H, r=ID/2, center=true, $fn=100);
    translate([0, 0, RECESSED_H/2]) {
      cylinder(h=H - RECESSED_H, r=OD/2, center=true, $fn=100);
    }
    translate([0, 0, H/2])
      rotate([90, 0, 0])
        rotate_extrude(angle=180, convexity=10)
          translate([CABLE_D + TORROID_R / 2, 0, 0])
            circle(r=TORROID_R, $fn=100); 
  }
  translate([0, 0, -H/2]) {
    cylinder(r=MAGNET_D/2, h=MAGNET_H, $fn=100, center=true);
  }
}
