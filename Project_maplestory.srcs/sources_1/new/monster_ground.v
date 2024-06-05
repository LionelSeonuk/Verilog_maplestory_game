module monster_ground(
    output      ground ,
    input [9:0] monster_x,
    input [9:0] monster_y
);

    // Define image width, height
    parameter WIDTH = 102, HEIGHT = 79;

    parameter REAL_GROUND = 385;
    
    wire [9:0] left, right;
    wire [9:0] top, bottom;

    assign left =monster_x;
    assign top = monster_y;
    assign right = left + WIDTH;
    assign bottom = top + HEIGHT;
    
    wire real_ground;
    
     assign real_ground = (bottom == REAL_GROUND);
     
     assign ground= real_ground;
     
     endmodule